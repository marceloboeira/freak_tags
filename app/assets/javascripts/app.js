angular.module('FreakTags', ['ui.router', 'templates'])
.config(['$stateProvider', '$urlRouterProvider', function($stateProvider, $urlRouterProvider) {
 
  $stateProvider
    .state('home', {
      url: '/home',
      templateUrl: 'home/_home.html',
      controller: 'HomeController'
    })
    .state('posts', {
      url: '/posts/{id}',
      templateUrl: '/posts/_posts.html',
      controller: 'PostsController'
    });
  $urlRouterProvider.otherwise('home');
}]);