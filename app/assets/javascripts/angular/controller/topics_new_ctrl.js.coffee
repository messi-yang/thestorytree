topics_new_app = angular.module('topics_new',[])

topics_new_app.controller 'topics_new_ctrl' , ['$scope',($scope)->
  $scope.setContentLength = (select_number) ->
    switch select_number
      when 1 then(
        $scope.length_min=20
        $scope.length_max=50
      )
      when 2 then(
        $scope.length_min=50
        $scope.length_max=150
      )
      when 3 then(
        $scope.length_min=100
        $scope.length_max=300
      )
   $scope.setArticlesLimit = (limit_number) ->
     $scope.articles_limit=limit_number
   $scope.setPrivacy = (boolean) ->
     $scope.privacy = boolean
   $scope.setTimeout = (time_out) ->
     $scope.timeout = time_out
   $scope.setScoreLimit = (score_limit) ->
     $scope.score_limit = score_limit
]
