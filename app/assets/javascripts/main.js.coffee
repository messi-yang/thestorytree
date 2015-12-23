@StoryTree = angular.module('StoryTree',['Devise'])

@StoryTree.config(['$routeProvider',($routeProvider) ->
  $routeProvider.
    when('/introduction',{
      templateUrl: '../templates/introduction.html',
      controller: 'introductionCtrl'
    }).
    when('/',{
      templateUrl: '../templates/storyHome.html',
      controller: 'storyHomeCtrl'
    }).
    when('/topics/new',{
      templateUrl: '../templates/topics/new.html',
      controller: 'topicsNewCtrl'
    }).
    when('/articles/show/:id',{
      templateUrl: '../templates/articles/show.html',
      controller: 'articlesShowCtrl'
    }).
    when('/signIn',{
      templateUrl: '../templates/users/signIn.html',
      controller: 'signInCtrl'
    }).
    when('/signUp',{
      templateUrl: '../templates/users/signUp.html',
      controller: 'signUpCtrl'
    }).otherwise({
      templateUrl: '../templates/storyHome.html',
      controller: 'storyHomeCtrl'
    })
])

@StoryTree.config(['AuthProvider','AuthInterceptProvider',(AuthProvider,AuthInterceptProvider) ->
  # Customize login
  # AuthProvider.loginMethod('GET')
  # AuthProvider.loginPath('/admins/login.json')
  
  # Customize logout
  # AuthProvider.logoutMethod('POST')
  # AuthProvider.logoutPath('/user/logout.json')
  
  # Customize register
  AuthProvider.registerMethod('POST')
  AuthProvider.registerPath('/users.json')
  
  # Customize the resource name data use namespaced under
  # Pass false to disable the namespace altogether.
  # AuthProvider.resourceName('customer')
  
  # Customize user parsing
  # NOTE: **MUST** return a truth-y expression
  # AuthProvider.parse((response) -> 
  #    return response.data.user
  # )
  
  # Intercept 401 Unauthorized everywhere
  # Enables `devise:unauthorized` interceptor
  AuthInterceptProvider.interceptAuth(true)
])
