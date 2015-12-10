@StoryTree.controller 'show_topics_ctrl' , ['$scope','$http',($scope,$http)->
  url = "/topics/get_newest"
  $http.get(url).success((data)->
    $scope.topics = data
  )
]
