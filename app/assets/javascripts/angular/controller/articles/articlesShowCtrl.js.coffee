@StoryTree.controller 'articlesShowCtrl' , ['$route','$scope','$http','$location','$routeParams','Auth',($route,$scope,$http,$location,$routeParams,Auth)->
	
  $scope.topicId=$routeParams.id
  
  $scope.initial=()->
    $scope.showTextArea = false
    $scope.showContiButton = true
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

  $scope.initial()
  
  # Check the initial value of like or not
  $scope.checkLike = (article_id) ->
  	if article_id in $scope.article_has_liked
  		true
  	else
  		false
  
  $scope.backToShowTopics = () ->
    $location.path('/')
  
  # Like & Unlike Button Mechanism
  $scope.likeItOrNot = (article_id, topic_id, index) ->
  	if $scope.user != undefined
  		console.log("User id:" + $scope.user.id)
  		if article_id in $scope.article_has_liked
  			# like-count in Article Model -1 through counts_controller
  			params = {article_id}
  			$http({
  				method: "POST",
  				url: "/add_article_likes"
  				data: params
  			}).success((data) ->
  				console.log(data)
  				$scope.articles[index].likes = data.article_likes
  			)
  			# delete user & topic info. about the article liked through article_likes_controller
  			$http({
					method: "DELETE",
					url: "/article_likes/delete_article_like_id",
					params: {topic_id, user_id: $scope.user.id, article_id}
  			}).success((data) ->
  				console.log(data.status)
  				$scope.removeLikedArray(article_id)
  			)
  		else
  			# like-count in Article Model +1 through counts_controller
  			params = {user_id: $scope.user.id, article_id, topic_id}
  			$http({
  				method: "POST",
  				url: "/add_article_likes",
  				data: params
  			}).success((data) ->
  				console.log(data)
  				$scope.articles[index].likes = data.article_likes
  			)
  			# record user & topic info. about the article liked through article_likes_controller
  			$http({
  				method: "POST",
  				url: "/article_likes",
  				data: params
  			}).success((data) ->
  				console.log(data)
  				$scope.pushLikedArray(article_id) 
  			)
  	else
  		prePath = $location.url()
  		$location.path('/signIn').search({path: prePath})
  
  # Used to show contiune story button
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
    $http({
    	method:"POST",
    	url: '/articles'
    	data: params
    }).success((data) ->  
    	url="/show/"+$scope.topicId 	
    	console.log(data.status)
    	$route.reload()
    )
	
  $scope.removeLikedArray = (valueToDelete) ->
    i=0
    while valueToDelete != $scope.article_has_liked[i]
      i++
    $scope.article_has_liked.splice(i,1)
    

  $scope.pushLikedArray = (value) ->
    $scope.article_has_liked.push(value)
	
  $scope.getArticleLikeList = () ->
  	$http({
  		method: "GET",
  		url: "/article_likes/get_article_likes",
  		params: {topic_id: $scope.topicId, user_id: $scope.user.id}
  	}).success((data) ->
  		console.log(data+"\n"+"Liked_Map: "+data.article_has_liked)
  		$scope.article_has_liked = data.article_has_liked  	)
  
  	
]
