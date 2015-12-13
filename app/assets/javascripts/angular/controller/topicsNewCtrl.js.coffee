@StoryTree.controller 'topicsNewCtrl' , ['$scope','$http','$location',($scope,$http,$location)->

  $http.get('topics/new').success((data)->
    $scope.user_id=data.user_id
    console.log($scope.user_id)
  )
  $scope.topic={articles_attributes:{0:""},browse_times:0,comment_amount:0}

  $scope.setContentLength = (select_number) ->
    switch select_number
      when 1 then(
        $scope.topic.length_min=20
        $scope.topic.length_max=50
      )
      when 2 then(
        $scope.topic.length_min=50
        $scope.topic.length_max=150
      )
      when 3 then(
        $scope.topic.length_min=100
        $scope.topic.length_max=300
      )
  $scope.setArticlesLimit = (limit_number) ->
    $scope.topic.articles_limit=limit_number
  $scope.setPrivacy = (boolean) ->
    $scope.topic.privacy = boolean
  $scope.setTimeout = (time_out) ->
    $scope.topic.timeout = time_out
  $scope.setScoreLimit = (score_limit) ->
    $scope.topic.score_limit = score_limit

  $scope.createTopic = () ->
    articles_attributes={
      user_id:$scope.user_id,
      first_article:true,
      likes:0,
      report_times:0,
      comment_amount:0
      content:$scope.content
    }

    params={}
    params.topic=$scope.topic
    params.topic.articles_attributes['0']=articles_attributes
    $http({
      method:"POST",
      url: '/topics'
      data: params
    }).success((data) ->
      console.log(data.status)
      $location.path('/')
    )


]
