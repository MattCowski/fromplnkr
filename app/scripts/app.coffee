# TODO route: admin/calendar
@fromplnkr = angular.module("fromplnkr", [
  "ui.bootstrap",
    'ngRoute'
])
@fromplnkr.config ($routeProvider, $locationProvider, $httpProvider) ->
  $routeProvider
    .when "/landing",
      templateUrl: "views/landing.html"
    .when "/kitchen",
      templateUrl: "views/kitchen.html"
    .when "/backsplash",
      templateUrl: "views/backsplash.html"
    .when "/contact",
      templateUrl: "views/contact.html"
    .when "/faq",
      templateUrl: "views/faq.html"
    .when "/home",
      templateUrl: "views/home.html"
    .when "/gallery",
      templateUrl: "views/gallery.html"
    .when "/invoice",
      templateUrl: "views/invoice.html"
    .when "/admin",
      templateUrl: "views/admin.html"
    .when "/chat",
      templateUrl: "views/chat.html"
    .otherwise
      redirectTo: "/admin"
