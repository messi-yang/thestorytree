@StoryTree.controller 'storyHomeCtrl' , ['$scope','$http','$location','Auth',($scope,$http,$location,Auth)->

  $scope.getNewTopics =() ->
    $scope.topicsSearchType="New Topics"
    $scope.topicsSearchTypeComment="There are new topics , please check it out"
    url = "/topics/get_newest"
    $http.get(url).success((data)->
      console.log(data)
      $scope.topics = data
      #$scope.topics[0].content = $scope.topics[0].content.replace(/(?:\r\n|\r|\n)/g,'<br>')
    )
    #remove and add to make animation restart
    
  $scope.getNewTopics()

  $scope.getHotTopics =() ->
    $scope.topicsSearchType="Hot Topics"
    $scope.topicsSearchTypeComment="There are hot topics , please check it out"
    url = "/topics/get_hot"
    $http.get(url).success((data)->
      console.log(data)
      $scope.topics = data
    )
    #remove and add to make animation restart

  $scope.toShowStory =(topic_id)->
    $location.path('/articles/show/'+topic_id)   
    	
  $scope.toNewTopics = ()-> 
    $location.path('/topics/new')   


  #CSS part


]
