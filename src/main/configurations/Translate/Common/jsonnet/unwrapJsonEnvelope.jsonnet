if std.type(payload) != "object" then
  error "Expected 'payload' to be a JSON object."
else if !std.objectHas(payload, "results") then
  error "Expected property 'payload.results' to exist."
else if std.type(payload.results) != "array" then
  error "Expected 'payload.results' to be an array."
else
  payload.results