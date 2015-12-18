@StoryTree.controller 'signInCtrl' , ['$scope','$http','$location','Auth',($scope,$http,$location,Auth)->
  
  $scope.rememberMe='0'

  Auth.currentUser().
  then((user)->
    $location.path('/')
  ).
  then((error)->
    console.log(error)
  )
  
  $scope.setRemember = ()->
    if $scope.rememberMe == '0'
      $scope.rememberMe ='1'
    else
      $scope.rememberMe ='0'

  $scope.signIn = () ->
    urlParams = $location.search()
    credentials ={
      email: $scope.email,
      password: $scope.password,
      remember_me: $scope.rememberMe
    }
    console.log(credentials)
    config ={
      headers: {
        'X-HTTP-Method-Override': 'POST'
      }
    }

    Auth.login(credentials,config).
    then((user)->
      $('#showSignOut').show()
      $('#showRegister').hide()
      $('#showSignIn').hide()
      $location.path(urlParams.path||'/')
    ).
    then((error)->

    )
    
    $scope.$on('devise:login',(event,currentUser)->
    )
    $scope.$on('devise:new-session',(event,currentUser)->

    )
]
