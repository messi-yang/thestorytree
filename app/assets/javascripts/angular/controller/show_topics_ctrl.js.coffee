@StoryTree.controller 'show_topics_ctrl' , ['$scope','$http','$location',($scope,$http,$location)->
  url = "/topics/get_newest"
  $http.get(url).success((data)->
    $scope.topics = data
  )
  $scope.toNewTopics = ()->
    
    $location.path('/topics/new')   
]
