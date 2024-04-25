"use strict";

function _createForOfIteratorHelper(o, allowArrayLike) { var it = typeof Symbol !== "undefined" && o[Symbol.iterator] || o["@@iterator"]; if (!it) { if (Array.isArray(o) || (it = _unsupportedIterableToArray(o)) || allowArrayLike && o && typeof o.length === "number") { if (it) o = it; var i = 0; var F = function F() {}; return { s: F, n: function n() { if (i >= o.length) return { done: true }; return { done: false, value: o[i++] }; }, e: function e(_e) { throw _e; }, f: F }; } throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); } var normalCompletion = true, didErr = false, err; return { s: function s() { it = it.call(o); }, n: function n() { var step = it.next(); normalCompletion = step.done; return step; }, e: function e(_e2) { didErr = true; err = _e2; }, f: function f() { try { if (!normalCompletion && it["return"] != null) it["return"](); } finally { if (didErr) throw err; } } }; }
function _unsupportedIterableToArray(o, minLen) { if (!o) return; if (typeof o === "string") return _arrayLikeToArray(o, minLen); var n = Object.prototype.toString.call(o).slice(8, -1); if (n === "Object" && o.constructor) n = o.constructor.name; if (n === "Map" || n === "Set") return Array.from(o); if (n === "Arguments" || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return _arrayLikeToArray(o, minLen); }
function _arrayLikeToArray(arr, len) { if (len == null || len > arr.length) len = arr.length; for (var i = 0, arr2 = new Array(len); i < len; i++) arr2[i] = arr[i]; return arr2; }
function mergeProfileDefaultsWithProfiles(profilesFile) {
  var json = JSON.parse(profilesFile);
  var profileDefaults = {
    "profile": json["profileDefaults"]
  };
  var profiles = {
    "profile": json["profile"]
  };
  var result = {};
  result["profile"] = [];
  result["profileDefaults"] = json["profileDefaults"];
  if (json["profileDefaults"] == null || json["profile"] == null) {
    return profilesFile;
  }
  var _iterator = _createForOfIteratorHelper(profiles.profile),
    _step;
  try {
    var _loop = function _loop() {
      var pf = _step.value;
      var pfres = {};
      Object.keys(profileDefaults.profile).forEach(function (key) {
        return pfres[key] = profileDefaults.profile[key];
      });
      Object.keys(pf).forEach(function (key) {
        return pfres[key] = pf[key];
      });
      if (pf["valueOverrides"] == null) {
        result.profile.push(pfres);
        return "break";
      }
      pfres["valueOverrides"] = pf.valueOverrides.concat(profileDefaults.profile.valueOverrides.filter(function (value) {
        return pf.valueOverrides.find(function (value2) {
          return value2.key != value.key;
        });
      }));
      result.profile.push(pfres);
    };
    for (_iterator.s(); !(_step = _iterator.n()).done;) {
      var _ret = _loop();
      if (_ret === "break") break;
    }
  } catch (err) {
    _iterator.e(err);
  } finally {
    _iterator.f();
  }
  return JSON.stringify(result, null, 4);
}
