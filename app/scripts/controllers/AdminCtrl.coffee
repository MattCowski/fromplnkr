"use strict"
fromplnkr.controller "adminCtrl", ($scope) ->
  $scope.dateOptions =
    'year-format': "'yy'",
    'starting-day': 1

  $scope.dateDisabled = (date, mode)->
    if $scope.availability == 'busy'
      return true
    else 
      return false
  
  $scope.open = ($event,opened) ->
    $event.preventDefault();
    $event.stopPropagation();
    $scope[opened] = true;
