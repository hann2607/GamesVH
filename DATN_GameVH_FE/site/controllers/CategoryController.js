app.controller("CategoryController", function (CategoryService, $scope) {
    $scope.categories = [];

    CategoryService.getAll().then(function (response) {
        $scope.categories = response.data;
    }).catch(function (error) {
        console.error('Lỗi khi lấy danh sách danh mục:', error);
    });

});
