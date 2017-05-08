(function () {
    'use strict';

    angular
        .module('app', [])
        .config(config);

    config.$inject = ['$provide'];

    function config($provide) {
        $provide.decorator('$exceptionHandler', myExceptionHandler);
    }

    myExceptionHandler.$inject = ['$delegate', '$window'];

    function myExceptionHandler($delegate, $window) {
        return function (exception, cause) {
            // Keep default implementation.
            $delegate(exception, cause);

            // Execute server side logging.
            // Need to wrap to try catch, to prevent infinitive loop.
            try {
                // Cannot use $http service because of circular references.
                $.ajax({
                    type: 'POST',
                    url: '/api/log/',
                    contentType: 'application/json',
                    data: angular.toJson({
                        url: $window.location.href,
                        message: exception.message,
                        stack: exception.stack,
                    })
                });
            }
            catch (e) {
                // Do nothing, browser will display message in console.
            }
        };
    }
})();
