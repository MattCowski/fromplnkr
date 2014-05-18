"use strict"
fromplnkr.controller "SpicyCtrl", ($scope) ->
    $scope.spice = "ceramic"
    $scope.chiliSpicy = ->
      $scope.spice = "stone"
      return

    $scope.jalapenoSpicy = ->
      $scope.spice = "glass"
      return
      
fromplnkr.controller "SpicyCtrl2", ($scope) ->
    $scope.customSpice = "___"
    $scope.spice = "ceramic"
    $scope.spicy = (spice) ->
      $scope.spice = spice
      return

fromplnkr.controller "DoubleCtrl", ($scope) ->
    $scope.double = (value) ->
      value * 2


fromplnkr.controller "Controller", ($scope) ->
  $scope.sf = 31
  $scope.change = ->
    $scope.items.labor['quantity'] = $scope.sf
    $scope.items.sealer['quantity'] = $scope.sf
    $scope.items.tile['quantity'] = $scope.sf
  
  
  sf = -> $scope.sf

  $scope.items =
    labor:
      price: 10
      quantity: $scope.sf
    tile:
      price: 0
      quantity: $scope.sf
    sealer:
      price: 0
      quantity: $scope.sf
    inserts:
      price: 4
      quantity: 0
    caulking:
      price: 14
      quantity: 0
    frame:
      price: 60
      quantity: 0
  
  $scope.total = ->
    total = 0
    
    angular.forEach($scope.items, (value = {quantity:0, price:0}, key) ->
      value.total = (value.price * value.quantity)
      $scope.items[key] = value
      total += value.total
    )
    return total
    
  #class Item
    #constructor: (@desc, @quantity=0, @price) ->
    #total: (price) ->
      #@quantity * price
    #say: ->
      #console.log "foobar"
    #@say
  #
  #class Sealer extends Item
    #total: ->
      #console.log "..."
      #super 2
      #
  #class Caulking extends Item
    #total: ->
      #super 2
  #
  #class Labor extends Item
    #total: ->
      #console.log @desc
      #super 10
  #
  #
  #labor = new Labor "labor charge", 22
  #sealer = new Sealer "1 coat"
  #caulking = new Caulking
  #labor.total()
  #console.log sealer
  #console.log labor
  #caulking.say()
  


      
  $scope.multiplier = (value, item) ->
    value * item
  $scope.multiplierCaulk = (value) ->
    value * 14
  $scope.multiplierSealer = (sf) ->
    sf * 2
  $scope.master = {}
  $scope.update = (user) ->
    $scope.master = angular.copy(user)
    return

  $scope.reset = ->
    $scope.user = angular.copy($scope.master)
    return

  $scope.reset()
  return
        #td {{item.name || ''}} => labor, inserts, frame, caulking
        #td {{item.price|| 0}} => 10, 4, 14, 60, 0 || sealer.price, 0 || tile.price
        #td {{item.quantity}} => sf, inserts, caulking, frame, sf, sf
        #td {{item.quantity * item.price|| 0}}
  $scope.singleModel = 1
  $scope.radioModel = "1 coat of sealer"
  $scope.checkModel =
    left: false
    middle: true
    right: false
  return

      
fromplnkr.controller "AlertDemoCtrl", ($scope) ->
  $scope.alerts = [
    {
      type: "danger"
      msg: "Oh snap! Change a few things up and try submitting again."
    }
    {
      type: "success"
      msg: "Well done! You successfully read this important alert message."
    }
  ]
  $scope.addAlert = ->
    $scope.alerts.push msg: "Another alert!"
    return

  $scope.closeAlert = (index) ->
    $scope.alerts.splice index, 1
    return

  return

fromplnkr.controller "CollapseDemoCtrl", ($scope) ->
  $scope.isCollapsed = false
  return

fromplnkr.controller "TypeaheadCtrl", ($scope, $http) ->
  # Any function returning a promise object can be used to load values asynchronously
  $scope.getDistance = () ->
    fakeres = {
      destination_addresses : [ "Norridge, IL, USA" ],
      origin_addresses : [ "Elgin, IL, USA", "Lake Forest, IL, USA" ],
      "rows" : [{
        "elements" : [{
          "distance" : {
            "text" : "32.9 mi",
            "value" : 52896
          },
          "duration" : {
            "text" : "39 mins",
            "value" : 2368
          },
          "status" : "OK"
        }]
      }, {
        "elements" : [{
          "distance" : {
            "text" : "26.2 mi",
            "value" : 42092
          },
          "duration" : {
            "text" : "35 mins",
            "value" : 2109
          },
          "status" : "OK"
        }]
      }],
      "status" : "OK"
    }
    distances = []
    minutes = 0
    angular.forEach fakeres.rows, (item) ->
      minutes += item.elements[0].duration.value / 60
      #miles += item.elements[0].distance.value / 60
      distances.push item.elements[0]
      
      return
    $scope.price = minutes * .5 #travel charge 
    $scope.distances = distances
  
    
    #$http.get("http://maps.googleapis.com/maps/api/distancematrix/json",
      #params:
        #origins: "Elgin+Il|Lake+forest+IL"
        #destinations: "Norridge IL"
        #units:"imperial"
        #sensor: true
    #).then (res) ->
  
  $scope.getLocation = (val) ->
    $http.get("http://maps.googleapis.com/maps/api/geocode/json",
      params:
        address: val
        sensor: false
    ).then (res) ->
      addresses = []
      angular.forEach res.data.results, (item) ->
        addresses.push item.formatted_address
        return

      addresses
  return

# Disable weekend selection
fromplnkr.controller "PaginationDemoCtrl", ($scope) ->
  $scope.totalItems = 64
  $scope.currentPage = 4
  $scope.setPage = (pageNo) ->
    $scope.currentPage = pageNo
    return

  $scope.pageChanged = ->
    console.log "Page changed to: " + $scope.currentPage
    return

  $scope.maxSize = 5
  $scope.bigTotalItems = 175
  $scope.bigCurrentPage = 1
  return

fromplnkr.controller "CarouselDemoCtrl", ($scope) ->
  $scope.myInterval = 5000
  slides = $scope.slides = []
  newSlideId = 0
  $scope.removeSlide = (index) ->
    #delete $scope.slides[index]
    $scope.slides.splice index, 1
    newSlideId += 1
    $scope.addSlide()
  $scope.addSlide = ->
    newWidth = 600 + slides.length + newSlideId
    slides.push
      image: "http://placekitten.com/" + newWidth + "/300"
      text: [
        "More"
        "Extra"
        "Lots of"
        "Surplus"
      ][slides.length % 4] + " " + [
        "Cats"
        "Kittys"
        "Felines"
        "Cutes"
      ][slides.length % 4]

    return

  i = 0

  while i < 4
    $scope.addSlide()
    i++
  return
  
  
  
  
fromplnkr.controller "AccordionDemoCtrl", ($scope) ->
  $scope.oneAtATime = true
  $scope.groups = [
    {
      title: "Dynamic Group Header - 1"
      content: "Dynamic Group Body - 1"
    }
    {
      title: "Dynamic Group Header - 2"
      content: "Dynamic Group Body - 2"
    }
  ]
  $scope.items = [
    "Item 1"
    "Item 2"
    "Item 3"
  ]
  $scope.addItem = ->
    newItemNo = $scope.items.length + 1
    $scope.items.push "Item " + newItemNo
    return

  return

fromplnkr.controller "RatingDemoCtrl", ($scope) ->
  $scope.rate = 4
  $scope.max = 10
  $scope.isReadonly = false
  $scope.hoveringOver = (value) ->
    $scope.overStar = value
    $scope.percent = 100 * (value / $scope.max)
    return

  $scope.ratingStates = [
    {
      stateOn: "glyphicon-ok-sign"
      stateOff: "glyphicon-ok-circle"
    }
    {
      stateOn: "glyphicon-star"
      stateOff: "glyphicon-star-empty"
    }
    {
      stateOn: "glyphicon-heart"
      stateOff: "glyphicon-ban-circle"
    }
    {
      stateOn: "glyphicon-heart"
    }
    {
      stateOff: "glyphicon-off"
    }
  ]
  return


fromplnkr.controller "TooltipDemoCtrl", ($scope) ->
  $scope.dynamicTooltip = "Hello, World!"
  $scope.dynamicTooltipText = "dynamic"
  $scope.htmlTooltip = "I've been made <b>bold</b>!"
  return


fromplnkr.controller "PopoverDemoCtrl", ($scope) ->
  $scope.dynamicPopover = "Hello, World!"
  $scope.dynamicPopoverTitle = "Title"
  return

fromplnkr.controller "ProgressDemoCtrl", ($scope) ->
  $scope.max = 200
  $scope.random = ->
    value = Math.floor((Math.random() * 100) + 1)
    type = undefined
    if value < 25
      type = "success"
    else if value < 50
      type = "info"
    else if value < 75
      type = "warning"
    else
      type = "danger"
    $scope.showWarning = (type is "danger" or type is "warning")
    $scope.dynamic = value
    $scope.type = type
    return

  $scope.random()
  $scope.randomStacked = ->
    $scope.stacked = []
    types = [
      "success"
      "info"
      "warning"
      "danger"
    ]
    i = 0
    n = Math.floor((Math.random() * 4) + 1)

    while i < n
      index = Math.floor((Math.random() * 4))
      $scope.stacked.push
        value: Math.floor((Math.random() * 30) + 1)
        type: types[index]

      i++
    return

  $scope.randomStacked()
  return

fromplnkr.controller "TimepickerDemoCtrl", ($scope) ->
  $scope.mytime = new Date()
  $scope.hstep = 1
  $scope.mstep = 15
  $scope.options =
    hstep: [
      1
      2
      3
    ]
    mstep: [
      1
      5
      10
      15
      25
      30
    ]

  $scope.ismeridian = true
  $scope.toggleMode = ->
    $scope.ismeridian = not $scope.ismeridian
    return

  $scope.update = ->
    d = new Date()
    d.setHours 8
    d.setMinutes 0
    $scope.mytime = d
    return
  $scope.update()
  $scope.changed = ->
    console.log "Time changed to: " + $scope.mytime
    return

  return

fromplnkr.controller "TabsDemoCtrl", ($scope) ->
  $scope.tabs = [
    {},{},{},{},{},{},{}
    #{
      #title: "Dynamic Title 1"
      #content: "Dynamic content 1"
    #}
    #{
      #title: "Dynamic Title 2"
      #content: "Dynamic content 2"
      #disabled: true
    #}
  ]
  $scope.alertMe = ->
    setTimeout ->
      alert "You've selected the alert tab!"
      return

    return

  $scope.navType = "pills"
  return

fromplnkr.controller "DatepickerDemoCtrl", ($scope, $filter) ->
  dateIsInArray = (date,arrayOfDates) ->
    for aDate in arrayOfDates
      aDate = $filter('date')(new Date(aDate), 'MM/dd/yyyy')
      return true if aDate is date
      
  arrayOfDatesToDisable = ['May 23 2014','May 22 2014']
  $scope.disabled = (date, mode) ->
    date = $filter('date')(date, 'MM/dd/yyyy')
    if (dateIsInArray(date,arrayOfDatesToDisable))
      return true
    return false
    
  $scope.today = ->
    $scope.dt = new Date()
    return
  $scope.parsedDate = ->
    '3 days = $30'


  $scope.today()
  $scope.showWeeks = false
  $scope.toggleWeeks = ->
    $scope.showWeeks = not $scope.showWeeks
    return

  $scope.clear = ->
    $scope.dt = null
    return

  $scope.toggleMin = ->
    $scope.minDate = (if ($scope.minDate) then null else new Date())
    return

  $scope.toggleMin()
  $scope.open = ($event) ->
    $event.preventDefault()
    $event.stopPropagation()
    $scope.opened = true
    return

  $scope.dateOptions =
    "year-format": "'yy'"
    "starting-day": 1
  $scope.initDate = new Date('2016-15-20')
  $scope.formats = ['dd-MMMM-yyyy', 'yyyy/MM/dd', 'dd.MM.yyyy', 'shortDate']
  $scope.format = $scope.formats[0]
  return

fromplnkr.controller "ModalDemoCtrl", ($scope, $modal, $log) ->
  $scope.items = [
    "item1"
    "item2"
    "item3"
  ]
  $scope.open = ->
    modalInstance = $modal.open(
      templateUrl: "http://google.com"
      controller: ModalInstanceCtrl
      resolve:
        items: ->
          $scope.items
    )
    modalInstance.result.then ((selectedItem) ->
      $scope.selected = selectedItem
      return
    ), ->
      $log.info "Modal dismissed at: " + new Date()
      return

    return

  return


# Please note that $modalInstance represents a modal window (instance) dependency.
# It is not the same as the $modal service used above.
fromplnkr.controller "ModalInstanceCtrl", ($scope, $modalInstance, items) ->
  $scope.items = items
  $scope.selected = item: $scope.items[0]
  $scope.ok = ()->
    $modalInstance.close $scope.selected.item
  $scope.cancel = ()->
    $modalInstance.dismiss "cancel"
