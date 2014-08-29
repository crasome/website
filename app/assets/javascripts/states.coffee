@app.config(
  ['$stateProvider', '$urlRouterProvider',
  ( $stateProvider,   $urlRouterProvider ) ->

    $urlRouterProvider.otherwise '/'

    $stateProvider
      .state "contact_options", {
        url: "/",
        templateUrl: 'contact_options.html'
      }

      .state "contact", {
        abstract: true,
        url: "/contact",
        templateUrl: 'contact.html'
      }

      .state "contact.hire_us", {
        url: "/hire_us",
        templateUrl: 'contact/hire_us.html'
      }

      .state "contact.join_us", {
        url: "/join_us",
        templateUrl: 'contact/join_us.html'
      }

      .state "contact.send_message", {
        url: "/send_message",
        templateUrl: 'contact/send_message.html'
      }

      .state "contact.message_sent", {
        url: "",
        templateUrl: 'contact/message_sent.html'
      }
  ])
