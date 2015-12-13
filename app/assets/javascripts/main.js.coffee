@StoryTree = angular.module('StoryTree',[])

@StoryTree.config(['$routeProvider',($routeProvider) ->
  $routeProvider.
    when('/introduction',{
      templateUrl: '../templates/test.html',
      controller: 'showTopicsCtrl'
    }).
    when('/',{
      templateUrl: '../templates/storyHome.html',
      controller: 'showTopicsCtrl'
    }).
    when('/topics/new',{
      templateUrl: '../templates/topics/new.html',
      controller: 'topicsNewCtrl'
    }).
    when('/showStory/:id',{
      templateUrl: '../templates/articles/showStory.html',
      controller: 'showStoryCtrl'
    })
])
