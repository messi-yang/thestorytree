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
  $scope.bodyCss={
    'margin-top':'50px'
  }

  $scope.navbarCss={
    'background':'#169a1a',  
    'background':'-webkit-linear-gradient(#226022,#16b31a)', 
    'background':'-o-linear-gradient(#226022, #16b31a)', 
    'background':'-moz-linear-gradient(#226022, #16b31a)', 
    'background':'linear-gradient(#226022, #16b31a)'
  }
  $scope.whiteFontCss={
    'color':'white'
  }
]
