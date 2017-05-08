(function () {
    'use strict';

    angular
        .module('app')
        .controller('TestController', TestController);

    TestController.$inject = ['$scope'];

    function TestController($scope) {
        $scope.firstName = 'Alex';
        $scope.lastName = 'Smith'
        $scope.getFullName = getFullName;

        function getFullName() {
            return $scope.firstName + ' ' + $scope.lastName;
        }
    }
})();
