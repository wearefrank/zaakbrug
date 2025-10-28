"use strict";

function _toConsumableArray(arr) { return _arrayWithoutHoles(arr) || _iterableToArray(arr) || _unsupportedIterableToArray(arr) || _nonIterableSpread(); }
function _nonIterableSpread() { throw new TypeError("Invalid attempt to spread non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); }
function _iterableToArray(iter) { if (typeof Symbol !== "undefined" && iter[Symbol.iterator] != null || iter["@@iterator"] != null) return Array.from(iter); }
function _arrayWithoutHoles(arr) { if (Array.isArray(arr)) return _arrayLikeToArray(arr); }
function _createForOfIteratorHelper(o, allowArrayLike) { var it = typeof Symbol !== "undefined" && o[Symbol.iterator] || o["@@iterator"]; if (!it) { if (Array.isArray(o) || (it = _unsupportedIterableToArray(o)) || allowArrayLike && o && typeof o.length === "number") { if (it) o = it; var i = 0; var F = function F() {}; return { s: F, n: function n() { if (i >= o.length) return { done: true }; return { done: false, value: o[i++] }; }, e: function e(_e) { throw _e; }, f: F }; } throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); } var normalCompletion = true, didErr = false, err; return { s: function s() { it = it.call(o); }, n: function n() { var step = it.next(); normalCompletion = step.done; return step; }, e: function e(_e2) { didErr = true; err = _e2; }, f: function f() { try { if (!normalCompletion && it["return"] != null) it["return"](); } finally { if (didErr) throw err; } } }; }
function _unsupportedIterableToArray(o, minLen) { if (!o) return; if (typeof o === "string") return _arrayLikeToArray(o, minLen); var n = Object.prototype.toString.call(o).slice(8, -1); if (n === "Object" && o.constructor) n = o.constructor.name; if (n === "Map" || n === "Set") return Array.from(o); if (n === "Arguments" || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return _arrayLikeToArray(o, minLen); }
function _arrayLikeToArray(arr, len) { if (len == null || len > arr.length) len = arr.length; for (var i = 0, arr2 = new Array(len); i < len; i++) arr2[i] = arr[i]; return arr2; }
function mergeProfileDefaultsWithProfiles(profileDefaults, profiles) {
  var profileDefaults = JSON.parse(profileDefaults);
  var profiles = JSON.parse(profiles);
  var result = {};
  result["profile"] = [];
  result["profileDefaults"] = profileDefaults;
  if (profileDefaults == null || profiles == null || Object.keys(profileDefaults).length === 0) {
    return profilesFile;
  }
  var _iterator = _createForOfIteratorHelper(profiles),
    _step;
  try {
    var _loop = function _loop() {
      var pf = _step.value;
      var pfres = {};
      Object.keys(profileDefaults).forEach(function (key) {
        return pfres[key] = profileDefaults[key];
      });
      Object.keys(pf).forEach(function (key) {
        return pfres[key] = pf[key];
      });
      if (pf["valueOverrides"] == null || profileDefaults["valueOverrides"] == null) {
        result.profile.push(pfres);
        return "continue";
      }
      pfres["valueOverrides"] = [].concat(_toConsumableArray(pf.valueOverrides), _toConsumableArray(profileDefaults.valueOverrides.filter(function (_ref) {
        var key = _ref.key;
        return !pf.valueOverrides.some(function (obj) {
          return obj.key === key;
        });
      })));
      result.profile.push(pfres);
    };
    for (_iterator.s(); !(_step = _iterator.n()).done;) {
      var _ret = _loop();
      if (_ret === "continue") continue;
    }
  } catch (err) {
    _iterator.e(err);
  } finally {
    _iterator.f();
  }
  return JSON.stringify(result, null, 4);
}