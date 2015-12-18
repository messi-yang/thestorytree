@StoryTree.controller 'appCtrl' , ['$scope','$http','$location','Auth',($scope,$http,$location,Auth)->

  Auth.currentUser().
  then((user)->
    $('#showSignOut').show()
    $('#showRegister').hide()
    $('#showSignIn').hide()
  ).
  then((error)->
    console.log(error)
  )
  $scope.$on('devise:unauthorized',(event, xhr, deferred)->
    $('#showSignOut').hide()
    $('#showRegister').show()
    $('#showSignIn').show()
  )
  
  $scope.signOut = () ->
    config ={
      headers: {
        'X-HTTP-Method-Override': 'DELETE'
      }
    }

    Auth.logout(config).
    then((oldUser)->
      $('#showSignOut').hide()
      $('#showRegister').show()
      $('#showSignIn').show()
      url=$location.url()
      $location.path('/')
    ).
    then((error)->

    )
  


  #CSS part
]
