@StoryTree.controller 'showStoryCtrl' , ['$route','$scope','$http','$location','$routeParams','Auth',($route,$scope,$http,$location,$routeParams,Auth)->
  $scope.topicId=$routeParams.id

  params={topic_id:$routeParams.id}
  $http({
    method: "POST"
    url: "/add_topic_browse_times"
    data: params
  }).success((data) ->
    console.log(data.status)
  )	
  
  
  url = "/articles/by_topic_id?topic_id="+$scope.topicId
  $http.get(url).success((data)->
    console.log(data)
    $scope.articles = data.articles
    $scope.topic = data.topic
  )

  $scope.backToShowTopics = () ->
    $location.path('/')
  
  # Used to show contiune story button
  $scope.showTextArea =false
  $scope.showContiButton = true
  $scope.displayTextArea = () ->
    Auth.currentUser().
    then((user)->
      $scope.showTextArea = !$scope.showTextArea
      $scope.showContiButton = !$scope.showContiButton
      $scope.user=user
      console.log("User_id: "+$scope.user.id)
    ).
    then((error)->
      console.log(error)
    )
    $scope.$on('devise:unauthorized',(event, xhr, deferred)->
      prePath=$location.url()
      $location.path('/signIn').search({path:prePath})
    )

  $scope.createArticle = () ->
    $scope.articlesAttributes={
      user_id:$scope.user.id,
      first_article:false,
      likes:0,
      report_times:0,
      comment_amount:0
      content:$scope.content
    }
    params={topic_id:$scope.topicId,article:$scope.articlesAttributes}
    console.log(params)
    $http({
      method:"POST",
      url: '/articles'
      data: params
    }).success((data) ->
      url="/showStory/"+$scope.topicId
      console.log(data.status)
      $route.reload()
    )
  

	
]
