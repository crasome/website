@app.controller "ContactCtrl", ["$scope", "$http", "$state"
  ($scope, $http, $state) ->
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

      $http.post(destination, formData)
        .error (data) ->
          contact.errors = data
        .success (data) ->
          $state.go('contact_forms.message_sent');
]
