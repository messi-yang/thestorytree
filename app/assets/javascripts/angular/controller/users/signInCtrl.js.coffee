@StoryTree.controller 'signInCtrl' , ['$scope','$http','$location','Auth',($scope,$http,$location,Auth)->
  
  $scope.rememberMe='0'
  $scope.wrongIdAndPassword=false

  Auth.currentUser().
  then((user)->
    $location.path('/')
  ).
  then((error)->
    console.log(error)
  )
  
  $scope.setRemember = ()->
    if $scope.rememberMe == '0'
      $scope.rememberMe ='1'
    else
      $scope.rememberMe ='0'

  $scope.checkSignIn = (mode) ->
    $scope.wrongIdAndPassword=false
    emailFormat=/[a-zA-Z0-9_]{0,25}@([a-zA-Z0-9_]+\.)*(com$)/        
    $scope.wrongEmailFormat=!emailFormat.test($scope.email)   
    if !$scope.wrongEmailFormat
      $scope.signIn(mode)

  $scope.signIn = (mode) ->
    urlParams=null
    credentials=null
    if mode ==0
      credentials ={
        email: $scope.email,
        password: $scope.password,
        remember_me: $scope.rememberMe
      }
      console.log(credentials)

    if mode ==1
      credentials ={
        email: "youre@my.angel.com",
        password: "a1234567",
        remember_me: "1"
      }
      console.log(credentials)    

    urlParams = $location.search()
    config ={
      headers: {
        'X-HTTP-Method-Override': 'POST'
      }
    }


    Auth.login(credentials,config).
    then((user)->
      #login success
      $('#showSignOut').show()
      $('#profile').show()
      $('#showRegister').hide()
      $('#showSignIn').hide()
      $location.path(urlParams.path||'/')
    ).
    then((error)->

    )
    $scope.wrongIdAndPassword=true
    
    $scope.$on('devise:login',(event,currentUser)->
    )
    $scope.$on('devise:new-session',(event,currentUser)->

    )
]
