@app.config(
  ['$stateProvider', '$urlRouterProvider', 
  ( $stateProvider,   $urlRouterProvider) ->

    $urlRouterProvider.otherwise '/'

    $stateProvider
      .state "contact_options", {
        url: "/",
        templateUrl: 'contact_options.html'
      }

      .state "contact_forms", {
        abstract: true,
        url: "/contact",
        templateUrl: 'contact_forms.html'
      }

      .state "contact_forms.hire_us", {
        url: "/hire_us",
        templateUrl: 'contact_forms/hire_us.html'
      }

      .state "contact_forms.join_us", {
        url: "/join_us",
        templateUrl: 'contact_forms/join_us.html'
      }

      .state "contact_forms.send_message", {
        url: "/send_message",
        templateUrl: 'contact_forms/send_message.html'
      }

      .state "contact_forms.message_sent", {
        url: "",
        templateUrl: 'contact_forms/message_sent.html'
      }
  ])
