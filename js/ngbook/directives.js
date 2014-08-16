'use strict';

var myApp = angular.module('myApp', []);

myApp.directive('myDirective', function() {
    return {
      restrict: 'EAC',
      replace: true,
      template: '<a href="http://www.google.com">Click here to go to google.</a>'
    };
});
