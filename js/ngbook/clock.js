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
});
