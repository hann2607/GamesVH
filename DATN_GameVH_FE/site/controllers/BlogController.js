app.controller("BlogController", function (PageService, BlogService, TimeService, $scope, $routeParams, $location, $window) {
    $scope.itemsPerPage = 3; // Số lượng phần tử hiển thị trên mỗi trang
    $scope.currentPage = 1; // Trang hiện tại
    $scope.totalPages = 0;
    $scope.displayedItems = [];
    $scope.blogs = [];
    $scope.blogPopular = [];
    $scope.calculateTimeAgo = TimeService.calculateTimeAgo;
    $scope.tempBlogs = [];

    $scope.limitContent = function (content) {
        return content.length > 243 ? content.substring(0, 243) + '...' : content;
    };

    $scope.loadData = function () {
        BlogService.getAllBlog().then(function (resp) {
            $scope.blogs = resp.data;
            $scope.tempBlogs = $scope.blogs;
            $scope.getListProductOnPage();
        }).catch(function (error) {
            console.error('Lỗi khi lấy tất cả sản phẩm DTO:', error);
        });
        BlogService.getTop4BlogPopular().then(function (resp) {
            $scope.blogPopular = resp.data;
        }).catch(function (error) {
            console.error('Lỗi khi lấy top 4 blog:', error);
        });
    }
    $scope.loadData();

    $scope.searchBlog = function () {
        $scope.blogs = $scope.tempBlogs;
        var searchTerm = document.getElementById("search-blog-id").value.toLowerCase(); // Chuyển searchTerm thành chữ thường
        var result = $scope.blogs.filter(function (item) {
            var blogTitle = item.title.toLowerCase(); // Chuyển giá trị thuộc tính name thành chữ thường
            return blogTitle.indexOf(searchTerm) !== -1;
        });

        $scope.itemsPerPage = 3; // Số lượng phần tử hiển thị trên mỗi trang
        $scope.currentPage = 1; // Trang hiện tại
        $scope.totalPages = 0;
        $scope.getListProductOnPage();
        $scope.blogs = result;
        $scope.getListProductOnPage();
    }

    $scope.getListProductOnPage = function () {
        // Tổng số trang
        $scope.totalPages = PageService.calctotalPage($scope.itemsPerPage, $scope.blogs);

        // Lấy danh sách sản phẩm cho trang hiện tại
        $scope.displayedItems = PageService.getDisplayedItems($scope.itemsPerPage, $scope.currentPage, $scope.blogs);

        // Danh sách số trang hiển thị
        $scope.getPageRange = function (totalPages) {
            const maxPages = 10; // Số trang tối đa hiển thị liên tiếp
            const currentPage = $scope.currentPage;

            if (totalPages <= maxPages) {
                return Array(totalPages).fill().map((_, index) => index + 1);
            } else {
                let pageRange = [];
                if (currentPage <= 3) {
                    pageRange = Array(5).fill().map((_, index) => index + 1);
                    pageRange.push('...');
                    pageRange.push(totalPages);
                } else if (currentPage >= totalPages - 2) {
                    pageRange.push(1);
                    pageRange.push('...');
                    pageRange = pageRange.concat(Array(5).fill().map((_, index) => totalPages - 4 + index));
                } else {
                    pageRange.push(1);
                    pageRange.push('...');
                    pageRange = pageRange.concat(Array(3).fill().map((_, index) => currentPage - 1 + index));
                    pageRange.push('...');
                    pageRange.push(totalPages);
                }
                return pageRange;
            }
        };
    };

    $scope.previousPage = function () {
        if ($scope.currentPage > 1) {
            $scope.currentPage--;
        } else {
            $scope.currentPage = $scope.totalPages;
        }
        $scope.getListProductOnPage();
    };

    $scope.nextPage = function () {
        if ($scope.currentPage < $scope.totalPages) {
            $scope.currentPage++;
        } else {
            $scope.currentPage = 1;
        }
        $scope.getListProductOnPage();
    };

    $scope.get_ByPage = function (page) {
        $scope.currentPage = page;
        $scope.getListProductOnPage();
    };
});