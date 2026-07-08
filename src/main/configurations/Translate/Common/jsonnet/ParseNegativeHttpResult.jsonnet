local get(obj, field) =
  if std.type(obj) == "object" && std.objectHas(obj, field) then obj[field] else "";

local status = get(payload, "status");
local sender = if std.type(senderPipeName) == "string" then senderPipeName else "";
local requestUrl = if std.type(url) == "string" then url else "";

{
  code:
    if status == 400 then "TranslationError"
    else "TechnicalError",

  reason:
    if status == 400 then
      "400 Bad Request from ZGW API received by " + sender
    else if status == 401 then
      "401 Unauthorized from ZGW API received by " + sender
    else if status == 403 then
      "403 Forbidden from ZGW API received by " + sender
    else if status == 404 then
      "404 Not Found from ZGW API received by " + sender
    else if status == 500 then
      "500 Internal Server Error from ZGW API received by " + sender
    else
      "some negative response from ZGW API received by " + sender,

  request: requestUrl,

  details:
    std.join(" ", [
      get(payload, "code"),
      get(payload, "title"),
      if status == "" then "" else std.toString(status),
      get(payload, "detail"),
    ]),


  detailsXml: [CDATA]
}