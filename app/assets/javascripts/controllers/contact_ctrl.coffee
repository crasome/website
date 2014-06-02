@app.controller "ContactCtrl", ["$scope", "$http",
  ($scope, $http) ->
    @visitor = {}
    @company = {}
    @message = {}

    @errors = {}

    $scope.sendRequest = (destination) ->
      contact = this

      formData = {
        visitor: @visitor,
        company: @company,
        message: @message
      }

      $http.post(destination, formData).error (data) ->
        contact.errors = data
]
