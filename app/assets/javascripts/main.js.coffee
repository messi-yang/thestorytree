@StoryTree = angular.module('StoryTree',['Devise'])

@StoryTree.config(['$routeProvider',($routeProvider) ->
  $routeProvider.
    when('/introduction',{
      templateUrl: '../templates/test.html',
      controller: 'showTopicsCtrl'
    }).
    when('/',{
      templateUrl: '../templates/storyHome.html',
      controller: 'showTopicsCtrl'
    }).
    when('/topics/new',{
      templateUrl: '../templates/topics/new.html',
      controller: 'topicsNewCtrl'
    }).
    when('/showStory/:id',{
      templateUrl: '../templates/articles/showStory.html',
      controller: 'showStoryCtrl'
    })
])

@StoryTree.config(['AuthProvider','AuthInterceptProvider',(AuthProvider,AuthInterceptProvider) ->
  # Customize login
  AuthProvider.loginMethod('GET')
  AuthProvider.loginPath('/admins/login.json')
  
  # Customize logout
  AuthProvider.logoutMethod('POST')
  AuthProvider.logoutPath('/user/logout.json')
  
  # Customize register
  AuthProvider.registerMethod('PATCH')
  AuthProvider.registerPath('/user/sign_up.json')
  
  # Customize the resource name data use namespaced under
  # Pass false to disable the namespace altogether.
  AuthProvider.resourceName('customer')
  
  # Customize user parsing
  # NOTE: **MUST** return a truth-y expression
  AuthProvider.parse((response) -> 
      return response.data.user
  )
  
  # Intercept 401 Unauthorized everywhere
  # Enables `devise:unauthorized` interceptor
  AuthInterceptProvider.interceptAuth(true)
])
