local opMapping = {
  T: "add",
  V: "remove",
  W: "replace",
  I: "test",
};

local getOp(vs) =
  if std.objectHas(opMapping, vs)
  then opMapping[vs]
  else "add";

// Extract uuid safely
local getUuid(o) =
  if std.type(o) == "object" && std.objectHas(o, "uuid")
  then o.uuid
  else if uuid_id != ''
  then uuid_id
  else null;

// Build path with uuid filter if needed
local buildPath(basePath, uuid) =
  if uuid != null
  then basePath + "[?(@/uuid == '" + uuid + "')]"
  else basePath;

// Main function
local makePatch(payload, verwerkingssoort, basePath="") =
  local op = getOp(verwerkingssoort);
  local uuid = getUuid(payload);
  local path = buildPath(basePath, uuid);

  if op == "remove" then
    // V → only uuid-based remove, no value
    [
      {
        op: op,
        path: path,
      }
    ]
  else
    // T, I, W → full object
    [
      {
        op: op,
        path: path,
        value: payload,
      }
    ];

// Example call
makePatch(payload, verwerkingssoort, "/rollen")