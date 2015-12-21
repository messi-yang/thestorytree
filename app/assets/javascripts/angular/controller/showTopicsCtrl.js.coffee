@StoryTree.controller 'showTopicsCtrl' , ['$scope','$http','$location','Auth',($scope,$http,$location,Auth)->
  
  $scope.getNewTopics =() ->
    $scope.topicsSearchType="New Topics"
    $scope.topicsSearchTypeComment="There are new topics , please check it out"
    url = "/topics/get_newest"
    $http.get(url).success((data)->
      console.log(data)
      $scope.topics = data
    )
  $scope.getNewTopics()
  

  $scope.getHotTopics =() ->
    $scope.topicsSearchType="Hot Topics"
    $scope.topicsSearchTypeComment="There are hot topics , please check it out"
    url = "/topics/get_hot"
    $http.get(url).success((data)->
      console.log(data)
      $scope.topics = data
    )


  $scope.toShowStory =(topic_id)->
    $location.path('/showStory/'+topic_id)   
    	
  $scope.toNewTopics = ()-> 
    $location.path('/topics/new')   


  #CSS part


]
