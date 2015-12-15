@StoryTree.controller 'signInCtrl' , ['$scope','$http','$location','Auth',($scope,$http,$location,Auth)->
 
  Auth.currentUser().
  then((user)->
    $location.path('/')
  ).
  then((error)->
    console.log(error)
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
      $location.path(urlParams.path||'/')
    ).
    then((error)->

    )
    
    $scope.$on('devise:login',(event,currentUser)->
      location.reload()
    )
    $scope.$on('devise:new-session',(event,currentUser)->

    )
]
