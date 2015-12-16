@StoryTree.controller 'signUpCtrl' , ['$scope','$http','$location','Auth',($scope,$http,$location,Auth)->
 
  Auth.currentUser().
  then((user)->
    $location.path('/')
  ).
  then((error)->
    console.log(error)
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
      $('#showSignOut').show()
      $('#showRegister').hide()
      $('#showSignIn').hide()
      $location.path(urlParams.path||'/')
    ).
    then((error)->

    )
    
    $scope.$on('devise:new-registration',(event,user)->
    )
]
