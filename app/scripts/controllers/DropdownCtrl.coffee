"use strict"
fromplnkr.controller "DropdownCtrl", ($scope) ->
  $scope.items = [
    "The first choice!"
    "And another choice for you."
    "but wait! A third!"
  ]
  $scope.status = isopen: false
  $scope.toggled = (open) ->
    console.log "Dropdown is now: ", open
    return

  $scope.toggleDropdown = ($event) ->
    $event.preventDefault()
    $event.stopPropagation()
    $scope.status.isopen = not $scope.status.isopen
    return

  return
