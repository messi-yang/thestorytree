@StoryTree = angular.module('StoryTree',[])

@StoryTree.config(['$routeProvider',($routeProvider) ->
  $routeProvider.
    when('/introduction',{
      templateUrl: '../templates/test.html',
      controller: 'show_topics_ctrl'
    }).
    when('/',{
      templateUrl: '../templates/story_home.html',
      controller: 'show_topics_ctrl'
    }).
    when('/topics/new',{
      templateUrl: '../templates/topics/new.html',
      controller: 'topicsNewCtrl'
    })
])
