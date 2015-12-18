@StoryTree.controller 'topicsNewCtrl' , ['$scope','$http','$location','Auth',($scope,$http,$location,Auth)->
  
  # It is used to make sure the use has logged in
  Auth.currentUser().
  then((user)->
    $scope.user_id=user.id
    console.log("User_id: "+$scope.user_id)
  ).
  then((error)->
    console.log(error)
  )
  $scope.$on('devise:unauthorized',(event, xhr, deferred)->
    prePath=$location.url()
    $location.path('/signIn').search({path:prePath})
  )
   
  
  # Initial the topic
  $scope.topic={articles_attributes:{0:""},browse_times:0,article_amount:0}

  $scope.setArticlesLimit = (limit_number) ->
    $scope.topic.articles_limit=limit_number
  $scope.setPrivacy = (boolean) ->
    $scope.topic.privacy = boolean
  $scope.setTimeout = (time_out) ->
    $scope.topic.timeout = time_out
  $scope.setScoreLimit = (score_limit) ->
    $scope.topic.score_limit = score_limit

  $scope.createTopic = () ->
    #initial the articles attributes
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
