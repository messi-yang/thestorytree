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

]
