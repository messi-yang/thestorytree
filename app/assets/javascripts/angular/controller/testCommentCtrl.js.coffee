@StoryTree.controller 'testCommentCtrl' , ['$route','$scope','$http','$location','$routeParams','Auth',($route,$scope,$http,$location,$routeParams,Auth)->


  $scope.topicId=$routeParams.id

  $scope.createArticleComment = () -> 

    $scope.articleCommentAttributes={
      user_id:1,
      content:$scope.content
    }
    params={article_id:1,article_comments:$scope.articleCommentAttributes}
    console.log(params)  	    
    $http({
    	method:"POST",
    	url: '/article_comments'
    	data: params
    }).success((data) ->  
      console.log(data.status)
    )
		
]
