// jsonpatch_full.jsonnet

// Recursive function to generate JSON Patch for all fields
local generateFullPatch(obj, path="") =
  std.flattenArrays([
    if std.type(obj[k]) == "object" then
      generateFullPatch(obj[k], path + "zaak/" + k)
    else
      [{ "op": "replace", "path": path + "zaak/" + k, "value": obj[k] }]
    for k in std.objectFields(obj)
  ]);

// Generate JSON Patch
generateFullPatch(payload)