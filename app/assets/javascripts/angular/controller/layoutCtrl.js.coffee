@StoryTree.controller 'layoutCtrl' , ['$scope','$http','$location','Auth',($scope,$http,$location,Auth)->

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
  
  #make the navbar fade out on scroll
  $(window).scroll(()->
    if $(window).scrollTop() > 35
      $('#navbar').fadeOut()
      $('#topic-title-in-articles-show').addClass('topic-title-navbar')
    else
      $('#navbar').show()
      $('#topic-title-in-articles-show').removeClass('topic-title-navbar')



  )

  #CSS part
]
