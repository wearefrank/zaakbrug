"use strict";

function _typeof(obj) { "@babel/helpers - typeof"; return _typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ? function (obj) { return typeof obj; } : function (obj) { return obj && "function" == typeof Symbol && obj.constructor === Symbol && obj !== Symbol.prototype ? "symbol" : typeof obj; }, _typeof(obj); }
function _createForOfIteratorHelper(o, allowArrayLike) { var it = typeof Symbol !== "undefined" && o[Symbol.iterator] || o["@@iterator"]; if (!it) { if (Array.isArray(o) || (it = _unsupportedIterableToArray(o)) || allowArrayLike && o && typeof o.length === "number") { if (it) o = it; var i = 0; var F = function F() {}; return { s: F, n: function n() { if (i >= o.length) return { done: true }; return { done: false, value: o[i++] }; }, e: function e(_e) { throw _e; }, f: F }; } throw new TypeError("Invalid attempt to iterate non-iterable instance.\nIn order to be iterable, non-array objects must have a [Symbol.iterator]() method."); } var normalCompletion = true, didErr = false, err; return { s: function s() { it = it.call(o); }, n: function n() { var step = it.next(); normalCompletion = step.done; return step; }, e: function e(_e2) { didErr = true; err = _e2; }, f: function f() { try { if (!normalCompletion && it["return"] != null) it["return"](); } finally { if (didErr) throw err; } } }; }
function _unsupportedIterableToArray(o, minLen) { if (!o) return; if (typeof o === "string") return _arrayLikeToArray(o, minLen); var n = Object.prototype.toString.call(o).slice(8, -1); if (n === "Object" && o.constructor) n = o.constructor.name; if (n === "Map" || n === "Set") return Array.from(o); if (n === "Arguments" || /^(?:Ui|I)nt(?:8|16|32)(?:Clamped)?Array$/.test(n)) return _arrayLikeToArray(o, minLen); }
function _arrayLikeToArray(arr, len) { if (len == null || len > arr.length) len = arr.length; for (var i = 0, arr2 = new Array(len); i < len; i++) arr2[i] = arr[i]; return arr2; }
function mergeProfileDefaultsWithProfiles(profileDefaults, profiles) {
  profileDefaults = JSON.parse(profileDefaults || '{}');
  profiles = JSON.parse(profiles || '[]');
  var result = {};
  result["profile"] = [];
  result["profileDefaults"] = profileDefaults;
  if (profiles.length === 0 || Object.keys(profileDefaults).length === 0) {
    var returnData = {};
    if (profiles.length > 0) {
      returnData["profile"] = profiles;
    }
    if (Object.keys(profileDefaults).length > 0) {
      returnData["profileDefaults"] = profileDefaults;
    }
    return JSON.stringify(returnData, null, 4);
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
      var pfresNewReference = JSON.parse(JSON.stringify(pfres));
      recursiveMerge(pfresNewReference, pf);

      //        Object.entries(pf).filter(([key, value]) => typeof value === 'object' && !Array.isArray(value) && value !== null).forEach(([key, value]) =>
      //        {
      //            if (profileDefaults[key] && profileDefaults[key] == null) {
      //                pfres[key] = {
      //                    ...value,
      //                }
      //            }
      //        });

      //        if(pf["valueOverrides"] == null || profileDefaults["valueOverrides"] == null){
      //            result.profile.push(pfres);
      //            continue;
      //        }
      //
      //        pfres["valueOverrides"] = [
      //            ...pf.valueOverrides,
      //            ...profileDefaults.valueOverrides.filter(({key}) => !pf.valueOverrides.some(obj => obj.key === key)
      //            )
      //        ];

      result.profile.push(pfresNewReference);
    };
    for (_iterator.s(); !(_step = _iterator.n()).done;) {
      _loop();
    }
  } catch (err) {
    _iterator.e(err);
  } finally {
    _iterator.f();
  }
  return JSON.stringify(result, null, 4);
}
function recursiveMerge(currentObject, overwrite) {
  var keys = Object.keys(overwrite);
  var _loop2 = function _loop2() {
    var key = _keys[_i];
    var value = overwrite[key];
    if (currentObject.hasOwnProperty(key)) {
      var currentProp = currentObject[key];
      if (_typeof(value) === 'object' && !Array.isArray(value) && value !== null && _typeof(currentProp) == 'object' && !Array.isArray(currentProp) && currentProp !== null) {
        recursiveMerge(currentProp, value);
        return "continue";
      } else if (Array.isArray(value) && Array.isArray(currentProp)) {
        value.forEach(function (obj) {
          var matchingItem = currentProp.find(function (curObj) {
            return curObj.key === obj.key;
          });
          if (matchingItem) {
            recursiveMerge(matchingItem, obj);
          } else {
            currentProp.push(obj);
          }
        });
        return "continue";
      }
    }
    currentObject[key] = value;
  };
  for (var _i = 0, _keys = keys; _i < _keys.length; _i++) {
    var _ret = _loop2();
    if (_ret === "continue") continue;
  }
}