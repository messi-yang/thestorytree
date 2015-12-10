@StoryTree.controller 'topicsNewCtrl' , ['$scope','$http','$location',($scope,$http,$location)->
  $scope.topic={articles_attributes:{0:""}}
  articles_attributes={
    user_id:"1",
    first_article:true,
    likes:0,
    report_times:0,
    comment_amount:0
    article_detail_attributes:{}
  }

  $scope.createTopic = () ->
    params={}
    params.topic=$scope.topic
    articles_attributes.article_detail_attributes.content=$scope.content
    params.topic.articles_attributes['0']=articles_attributes
    $http({
      method:"POST",
      url: '/topics'
      data: params
    }).success((data) ->
      $location.path('/')
    )

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
   $scope.setPrivate = (boolean) ->
     $scope.topic.private = boolean
   $scope.setTimeout = (time_out) ->
     $scope.topic.timeout = time_out
   $scope.setScoreLimit = (score_limit) ->
     $scope.topic.score_limit = score_limit
]
