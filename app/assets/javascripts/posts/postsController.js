angular.module('FreakTags').controller('PostsController', ['$scope','$stateParams','PostService', function($scope, $stateParams, postService){
  $scope.post = postService.posts[$stateParams.id];
  $scope.addComment = function() {
    if($scope.body === '') {return; }
    $scope.post.comments.push({
      body: $scope.body,
      author: 'user',
      upvotes: 0
    });
    $scope.body = '';
  }
}]);