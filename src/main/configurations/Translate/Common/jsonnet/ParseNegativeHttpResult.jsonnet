local get(obj, field) =
  if std.type(obj) == "object" && std.objectHas(obj, field) then obj[field] else "";

local statusMatch = std.findSubstr("\"status\"", CDATA);

local statusIndex =
  if std.length(statusMatch) > 0 then statusMatch[0] else -1;

local status =
  if statusIndex >= 0 then
    std.parseInt(std.substr(CDATA, statusIndex + 9, 3))
  else
    0;
local sender = if std.type(senderPipeName) == "string" then senderPipeName else "";
local requestUrl = if std.type(url) == "string" then url else "";

{
  code:
    if status == 400 then "TranslationError"
    else "TechnicalError",

  reason:
    if std.length(statusMatch) > 0 then
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
        "some negative response from ZGW API received by " + sender
    else
      "some negative NON ZGW API response received by " + sender,

  request: requestUrl,

  detailsXml: CDATA
}