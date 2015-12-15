@StoryTree.controller 'signInCtrl' , ['$scope','$http','$location','Auth',($scope,$http,$location,Auth)->
 
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
      $location.path(urlParams.path||'/')
    ).
    then((error)->

    )
    
    $scope.$on('devise:login',(event,currentUser)->

    )
    $scope.$on('devise:new-session',(event,currentUser)->

    )
]
