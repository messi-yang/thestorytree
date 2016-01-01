@StoryTree.controller 'articlesShowCtrl' , ['$route','$scope','$http','$location','$routeParams','Auth',($route,$scope,$http,$location,$routeParams,Auth)->
	
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
  
  Auth.currentUser().
  	then((user) ->
  		$scope.user = user
  		console.log("User_id: " + $scope.user.id)
  		$scope.getArticleLikeList()
  	).
  	then((error) ->
  		console.log(error)
  	)
  

  Auth.currentUser().
    then((user)->
      $scope.user=user
      console.log("User_id: "+$scope.user.id)
    ).
    then((error)->
      console.log(error)
    )

  $scope.backToShowTopics = () ->
    $location.path('/')
  
  $scope.checkLike = (article_id) ->
  	$scope.article_id = article_id
  	if $scope.article_id in $scope.article_has_liked
  		#console.log("yes")
  		#console.log($scope.article_id)
  		true
  	else
  		#console.log("no")
  		#console.log($scope.article_id)
  		false
  
  # Like & Unlike Button Mechanism
  $scope.likeItOrNot = (article_id, topic_id) ->
  	if $scope.user != undefined
  		$scope.article_id = article_id
  		$scope.topic_id = topic_id
  		console.log("User id:" + $scope.user.id)
  		if $scope.article_id in $scope.article_has_liked
  			# like-count in Article Model -1 through counts_controller
  			params = {article_id: $scope.article_id}
  			$http({
  				method: "POST",
  				url: "/add_article_likes"
  				data: params
  			}).success((data) ->
  				console.log(data)
  				$scope.articles[article_id].likes = data.article_likes
  			)
  			# delete user & topic info. about the article liked through article_likes_controller
  			$http({
  				method: "GET",
  				url: "/article_likes/find_delete_id",
  				params: {topic_id: $scope.topic_id, user_id: $scope.user.id, article_id: $scope.article_id}
  			}).success((data) ->
  				console.log(data)
  				$scope.delete_id = data.delete_id
  				
  				$http({
						method: "DELETE",
						url: "/article_likes/" + $scope.delete_id,
  				}).success((data) ->
  					console.log(data.status)
  					$scope.getArticleLikeList()
  				)
  			)
  		else
  			# like-count in Article Model +1 through counts_controller
  			params = {user_id: $scope.user.id, article_id: $scope.article_id, topic_id: $scope.topic.id}
  			$http({
  				method: "POST",
  				url: "/add_article_likes",
  				data: params
  			}).success((data) ->
  				console.log(data)
  				$scope.articles[article_id].likes = data.article_likes
  			)
  			# record user & topic info. about the article liked through article_likes_controller
  			$http({
  				method: "POST",
  				url: "/article_likes",
  				data: params
  			}).success((data) ->
  				console.log(data)
  				$scope.article_likes_id = data.article_likes_id
  				$scope.getArticleLikeList() 
  			)
  	else
  		prePath = $location.url()
  		$location.path('/signIn').search({path: prePath})
  
  # Used to show contiune story button
  $scope.showTextArea = false
  $scope.showContiButton = true
  $scope.displayTextArea = () ->
    if $scope.user!=undefined
      $scope.showTextArea = !$scope.showTextArea
      $scope.showContiButton = !$scope.showContiButton
    else
      prePath = $location.url()
      $location.path('/signIn').search({path:prePath})

  $scope.createArticle = () -> 
    # use to count article amounts under the same topic
    param={topic_id:$scope.topicId}
    $http({
    	method: "POST",
    	url: "/add_topic_article_amounts"
    	data: param
    }).success((data) ->
    	console.log(data.status)
    )
    
    # use to create the new story under the same topic
    $scope.articlesAttributes={
      user_id:$scope.user.id,
      first_article:false,
      likes:0,
      report_times:0,
      comment_amount:0,
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

  $scope.getArticleLikeList = () ->
  	$http({
  		method: "GET",
  		url: "/article_likes/get_article_likes",
  		params: {topic_id: $scope.topicId, user_id: $scope.user.id}
  	}).success((data) ->
  		console.log(data)
  		$scope.article_has_liked = data.article_has_liked
  	)
  	
]
