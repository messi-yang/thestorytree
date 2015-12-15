@StoryTree.controller 'appCtrl' , ['$scope','$http','$location','Auth',($scope,$http,$location,Auth)->
  if Auth.isAuthenticated() 
    $showSignOut=true
  else
    $showRegister=false
    $showLogIn=false

  $scope.signOut = () ->
    config ={
      headers: {
        'X-HTTP-Method-Override': 'DELETE'
      }
    }

    Auth.logout(config).
    then((oldUser)->
      $showSignOut=false
      $showRegister=true
      $showLogIn=true

    ).
    then((error)->

    )
]
