@app.controller "ContactCtrl", [
  "$scope", "$http",
  ($scope, $http) ->
    "use strict"
    $scope.visitor = {}
    $scope.company = {}
    $scope.message = {}

    $scope.sendRequest = (destination) ->
      data = {
        visitor: $scope.visitor,
        company: $scope.company,
        message: $scope.message
      }

      $http.post(destination, data)
]
