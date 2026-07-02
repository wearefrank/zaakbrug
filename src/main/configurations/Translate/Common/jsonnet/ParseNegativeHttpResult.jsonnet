{
  code:
    if payload.status == 400 then "TranslationError"
    else "TechnicalError",

  reason:
    if payload.status == 400 then
      "400 Bad Request from ZGW API received by " + senderPipeName
    else if payload.status == 401 then
      "401 Unauthorized from ZGW API received by " + senderPipeName
    else if payload.status == 403 then
      "403 Forbidden from ZGW API received by " + senderPipeName
    else if payload.status == 404 then
      "404 Not Found from ZGW API received by " + senderPipeName
    else if payload.status == 500 then
      "500 Internal Server Error from ZGW API received by " + senderPipeName
    else
      "some negative response from ZGW API received by " + senderPipeName,

  details:
    std.join(" ", [
      payload.code,
      payload.title,
      std.toString(payload.status),
      payload.detail,
    ]),

  detailsXml: payload,
}