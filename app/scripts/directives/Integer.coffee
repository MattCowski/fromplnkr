"use strict"
fromplnkr.directive "integer", ->
  require: "ngModel"
  link: (scope, elm, attrs, ctrl) ->
    ctrl.$parsers.unshift (viewValue) ->
      INTEGER_REGEXP = /^\-?\d+$/
      if INTEGER_REGEXP.test(viewValue)
        ctrl.$setValidity "integer", true
        viewValue
      else
        ctrl.$setValidity "integer", false
        `undefined`

    return

