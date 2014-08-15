'use strict';

var myApp = angular.module("myApp", []);

myApp.controller('MyController', function ($scope, $timeout) {
  var updateClock = function() {
    $scope.clock = {};
    $scope.clock.now = new Date();
    $timeout(function() {
        updateClock();
        }, 1000);
  };
  updateClock();

  $scope.counter = 0;

  $scope.add = function(amount) { $scope.counter += amount; };
  $scope.subtract = function(amount) { $scope.counter -= amount; };
});

myApp.controller('ParentController', function($scope) {
  $scope.person = { greeted: false };
});

myApp.controller('ChildController', function($scope) {
  $scope.sayHello = function() {
    $scope.person.name = "Rohit";
    $scope.person.greeted = true;
  };
});
