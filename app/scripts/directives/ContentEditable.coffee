"use strict"
fromplnkr.directive "contentEditable", ->
  require: "ngModel"
  link: (scope, elm, attrs, ctrl) ->
    elm.on "blur", ->
      scope.$apply ->
        ctrl.$setViewValue elm.html()
        return

      return

    ctrl.$render = ->
      elm.html ctrl.$viewValue
      return

    ctrl.$setViewValue elm.html()
    return
