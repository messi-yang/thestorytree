@StoryTree.controller 'showStoryCtrl' , ['$route','$scope','$http','$location','$routeParams','Auth',($route,$scope,$http,$location,$routeParams,Auth)->
  $scope.topicId=$routeParams.id
  url = "/articles/by_topic_id?topic_id="+$scope.topicId

  $http.get(url).success((data)->
    $scope.articles = data
    $scope.userId = $scope.articles[0].user_id
  )
  
  # Used to show contiune story button
  $scope.showTextArea =false
  $scope.showContiButton = true
  $scope.displayTextArea = () ->
    Auth.currentUser().
    then((user)->
      $scope.showTextArea = !$scope.showTextArea
      $scope.showContiButton = !$scope.showContiButton
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
      user_id:$scope.userId,
      first_article:true,
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
