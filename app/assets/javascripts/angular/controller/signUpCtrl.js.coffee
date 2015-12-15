@StoryTree.controller 'signUpCtrl' , ['$scope','$http','$location','Auth',($scope,$http,$location,Auth)->
 
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
      $location.path(urlParams.path||'/')
    ).
    then((error)->

    )
    
    $scope.$on('devise:new-registration',(event,user)->

    )
]
