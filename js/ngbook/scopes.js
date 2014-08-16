'use strict';

var myScopedApp = angular.module('myScopedApp', []);

myScopedApp.run(function($rootScope) {
  $rootScope.rootProperty = 'root scope';
});

myScopedApp.controller('ParentController', function($scope) {
  $scope.parentProperty = 'parent scope';
});

myScopedApp.controller('ChildController', function($scope) {
  $scope.childProperty = 'child scope';
  $scope.fullSentenceFromChild = 'In the same $scope: We can access: ' +
    $scope.rootProperty + ' and ' +
    $scope.parentProperty + ' and ' +
    $scope.childProperty;
});
