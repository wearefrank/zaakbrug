local statusCode = std.parseInt(httpStatus) default null;
local jsonResponse = std.parseJson(responsePlainText) default null;
{
  code: if(statusCode != null && statusCode == 400) then "TranslationError" else "TechnicalError",
  reason:
    if (statusCode != null && jsonResponse != null) then
        "[" + statusCode + " " + httpReasonPhrase + " '" + (jsonResponse.code default "") + "'] error response from ZGW API received by " + senderPipeName
    else
      "[" + statusCode + " " + httpReasonPhrase + "] error response received by " + senderPipeName,

  details: "url: [" + (url default "") + "]"
    + ", description: [" + (jsonResponse.detail default "") + "]",

  detailsXml: {
    url: url default null,
    description: jsonResponse.detail default null,
    response: if(jsonResponse != null) then jsonResponse else ds.regex.regexReplace(ds.trim(responsePlainText), "\\s+", " ")
  }
}
