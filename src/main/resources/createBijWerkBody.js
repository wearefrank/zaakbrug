function applyRolePatches(rolesData, patches,ZgwStatusJson) {

  const rolesDataParsed = JSON.parse(rolesData).results;
  const patchesParsed = JSON.parse(patches);
  const ZgwStatusJsonParsed = JSON.parse(ZgwStatusJson);

  // Apply patches (your existing logic)
  patchesParsed.forEach(patch => {
    const pathParts = patch.path.split('/').slice(1);
    if (patch.path.startsWith("/rollen")) {
      // Your existing rollen patch logic...
      const { roltype, omschrijving, betrokkeneIdentificatie } = patch.value || {};
      const identifications = betrokkeneIdentificatie || {};
      const uuid = patch.path.match(/uuid\s*==\s*'([^']+)'/)?.[1];

      const matchingRoles = findMatchingRoles(rolesDataParsed, roltype, omschrijving, identifications, uuid);

      switch (patch.op) {
        case "add":
          if (matchingRoles.length === 0) rolesDataParsed.push(patch.value);
          break;
        case "replace":
          if (matchingRoles.length !== 1) throw new Error(`Replace requires exactly 1 matching role (found ${matchingRoles.length})`);
          const { parent, key } = getTarget(matchingRoles[0], pathParts.slice(2));
          parent[key] = patch.value;
          break;
        case "remove":
          if (matchingRoles.length !== 1) throw new Error(`Remove requires exactly 1 matching role (found ${matchingRoles.length})`);
          const idx = rolesDataParsed.indexOf(matchingRoles[0]);
          rolesDataParsed.splice(idx, 1);
          break;
        case "test":
          if (matchingRoles.length === 0) throw new Error(`Test failed: no matching role found`);
          matchingRoles.forEach(role => {
            const { parent, key } = getTarget(role, pathParts.slice(2));
            if (parent[key] !== patch.value) throw new Error(`Test failed at path ${patch.path}`);
          });
          break;
      }
    } else {
      // Top-level fields like 'zaak'
      const { parent, key } = getTarget(rolesDataParsed, pathParts);
      switch (patch.op) {
        case "replace":
        case "add":
          parent[key] = patch.value;
          break;
        case "remove":
          if (Array.isArray(parent)) parent.splice(key, 1);
          else delete parent[key];
          break;
        case "test":
          if (parent[key] !== patch.value) throw new Error(`Test failed at path ${patch.path}`);
          break;
      }
    }
  });
  // Your existing cleaning logic for rollen
  const removeAttrs = [
    "url",
    "zaak",
    "omschrijving",
    "omschrijvingGeneriek",
    "registratiedatum",
    "statussen",
    "uuid"
  ];

  const cleanedRoles = rolesDataParsed
    .filter(role => {
      const isTOrW =
        typeof role.roltype === "string" &&
        (role.roltype.includes("/T") || role.roltype.includes("/W"));

      const hasInitiatorInToelichting =
        typeof role.roltoelichting === "string" &&
        role.roltoelichting.toLowerCase().includes("initiator");

      return !(isTOrW && !hasInitiatorInToelichting);
    })
    .map(role => {
      const newRole = { ...role };
      removeAttrs.forEach(attr =>  {
        if (Object.hasOwn(newRole, attr)) {
          delete newRole[attr];
        }});
      return newRole;
    });
  // Build the flat zaak object (only patched top-level fields)
  const zaak = {};
  patchesParsed.forEach(patch => {
    if (patch.path.startsWith("zaak/")) {
      const key = patch.path.split('/')[1]; // always take the immediate field under zaak
      zaak[key] = patch.value;
      
    }
  });
  
  return JSON.stringify({
    zaak,
    rollen: cleanedRoles,
    status:ZgwStatusJsonParsed
  }, null, 2);
  
}
// Identification keys for uniqueness
const idKeys = [
  "inpBsn",
  "anpIdentificatie",
  "inpA_nummer",
  "innNnpId",
  "annIdentificatie",
  "vestigingsNummer",
  "OEHidentificatie",
  "MDWidentificatie"
];

// Find matching roles by roltype + omschrijving + any identification field
function findMatchingRoles(roles, roltype, omschrijving, identifications = {}, uuid) {

  return roles.filter(role => {
    if (uuid) {
      return role.uuid === uuid;
    }
    if (roltype && role.roltype !== roltype) return false;
    if (omschrijving && role.omschrijving !== omschrijving) return false;
    return idKeys.some(key => identifications[key] && role.betrokkeneIdentificatie?.[key] === identifications[key]);
  });
}

// Helper to traverse/create nested path
function getTarget(obj, pathParts, create = true) {
  let current = obj;
  for (let i = 0; i < pathParts.length - 1; i++) {
    const key = pathParts[i];
    if (!current[key]) {
      current[key] = !isNaN(parseInt(pathParts[i + 1])) ? [] : {};
    }
    current = current[key];
  }
  return { parent: current, key: pathParts[pathParts.length - 1] };
}