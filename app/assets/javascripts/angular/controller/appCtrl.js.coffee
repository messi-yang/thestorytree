@StoryTree.controller 'appCtrl' , ['$scope','$http','$location','Auth',($scope,$http,$location,Auth)->
  $scope.showSignOut=true
  $scope.showRegister=false
  $scope.showLogIn=false
  Auth.currentUser().
  then((user)->
    $scope.showSignOut=true
    $scope.showRegister=false
    $scope.showLogIn=false
  ).
  then((error)->
    console.log(error)
  )
  $scope.$on('devise:unauthorized',(event, xhr, deferred)->
    $scope.showSignOut=false
    $scope.showRegister=true
    $scope.showLogIn=true
  )
  
  $scope.signOut = () ->
    config ={
      headers: {
        'X-HTTP-Method-Override': 'DELETE'
      }
    }

    Auth.logout(config).
    then((oldUser)->
      $scope.showSignOut=false
      $scope.showRegister=true
      $scope.showLogIn=true
      url=$location.url()
      $location.path('/')
    ).
    then((error)->

    )


  $scope.signIn = () ->
    urlParams = $location.search()
    credentials ={
      email: $scope.email,
      password: $scope.password
    }
    console.log(credentials)
    config ={
      headers: {
        'X-HTTP-Method-Override': 'POST'
      }
    }

    Auth.login(credentials,config).
    then((user)->
      $scope.showSignOut=true
      $scope.showRegister=false
      $scope.showLogIn=false
      $location.path(urlParams.path||'/')
    ).
    then((error)->

    )
    
    $scope.$on('devise:login',(event,currentUser)->
      location.reload()
    )
    $scope.$on('devise:new-session',(event,currentUser)->

    )


  $scope.signUp = () ->
    urlParams = $location.search()
    credentials ={
      email: $scope.email,
      password: $scope.password,
      password_confirmation: $scope.password_confirmation
    }
    console.log(credentials)
    config ={
      headers: {
        'X-HTTP-Method-Override': 'POST'
      }
    }

    Auth.register(credentials,config).
    then((registeredUser)->
      $scope.showSignOut=true
      $scope.showRegister=false
      $scope.showLogIn=false
      $location.path(urlParams.path||'/')
    ).
    then((error)->

    )
    
    $scope.$on('devise:new-registration',(event,user)->
      location.reload()
    )

]
