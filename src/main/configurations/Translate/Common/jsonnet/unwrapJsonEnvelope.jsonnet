if std.type(payload) != "object" then
  error "Expected 'payload' to be a JSON object."
else if !std.objectHas(payload, "results") then
  error "Expected property 'payload.results' to exist."
else
  payload.results