@StoryTree.controller 'showStoryCtrl' , ['$route','$scope','$http','$location','$routeParams',($route,$scope,$http,$location,$routeParams)->
  $scope.topic_id=$routeParams.id
  url = "/articles/by_topic_id?topic_id="+$scope.topic_id

  $http.get(url).success((data)->
    $scope.articles = data
    $scope.user_id = $scope.articles[0].user_id
    console.log($scope.user_id)
  )
  
  $scope.showTextArea =false
  $scope.showContiButton = true

  $scope.displayTextArea = () ->
    $scope.showTextArea = !$scope.showTextArea
    $scope.showContiButton = !$scope.showContiButton

  $scope.createArticle = () ->
    $scope.articles_attributes={
      user_id:$scope.user_id,
      first_article:true,
      likes:0,
      report_times:0,
      comment_amount:0
      article_detail_attributes:{content:$scope.content}
    }
    params={topic_id:$scope.topic_id,article:$scope.articles_attributes}
    console.log(params)
    $http({
      method:"POST",
      url: '/articles'
      data: params
    }).success((data) ->
      url="/showStory/"+$scope.topic_id
      console.log(data.status)
      $route.reload()
    )
]
