@StoryTree.controller 'signUpCtrl' , ['$scope','$http','$location','Auth',($scope,$http,$location,Auth)->
 
  Auth.currentUser().
  then((user)->
    $location.path('/')
  ).
  then((error)->
    console.log(error)
  )

  $scope.initial = () ->
    $scope.wrongEmailFormat=false

  $scope.initial()

  $scope.checkSignUp =() ->
    emailFormat=/[a-zA-Z0-9_]{0,25}@([a-zA-Z0-9_]+\.)*(com$)/    
    $scope.wrongEmailFormat=!emailFormat.test($scope.email)   
    if !$scope.wrongEmailFormat
      $scope.signUp()

  $scope.signUp = () ->
    urlParams = $location.search()
    credentials ={
      email: $scope.email,
      password: $scope.password,
      password_confirmation: $scope.password_confirmation,
      nickname: $scope.nickname
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
    ).
    then((error)->
      #alert("This Email's not allowed , someone's used!")
    )

    $scope.$on('devise:new-registration',(event,user)->
      $location.path(urlParams.path||'/')
    )

]
