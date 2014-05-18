# TODO route: admin/calendar
@fromplnkr = angular.module("fromplnkr", [
  "ui.bootstrap",
    'ngRoute',
    'financeServices'
])
@fromplnkr.config ($routeProvider, $locationProvider, $httpProvider) ->
  $routeProvider
    .when "/landing",
      templateUrl: "landing.html"
    .when "/kitchen",
      templateUrl: "kitchen.html"
    .when "/backsplash",
      templateUrl: "backsplash.html"
    .when "/contact",
      templateUrl: "contact.html"
    .when "/faq",
      templateUrl: "faq.html"
    .when "/home",
      templateUrl: "home.html"
    .when "/gallery",
      templateUrl: "gallery.html"
    .when "/invoice",
      templateUrl: "invoice.html"
    .when "/admin",
      templateUrl: "admin.html"
    .when "/chat",
      templateUrl: "chat.html"
    .otherwise
      redirectTo: "/admin"
