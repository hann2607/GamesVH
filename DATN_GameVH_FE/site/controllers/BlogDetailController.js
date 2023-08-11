app.controller("BlogDetailController", function (BlogService, CommentService, TimeService, $scope, $routeParams, $window, $location, $route, ToastService) {
    $scope.blog = {}; // Thông tin bài viết sẽ được hiển thị trên trang chi tiết
    $scope.comments = []; // Tất cả các conmment đã được duyệt của bài viết
    $scope.commentData = {};
    $scope.blogIdPrev; // Bài viết trước đó
    $scope.blogIdNext; // Bài viết sau đó
    $scope.blogPopular = []; // Top 4 bài viết nhiều bình luận nhất
    var blogId = $routeParams.blogId; // ID của bài viết được truyền vào qua URL

    $scope.username = $window.localStorage.getItem("username") || $window.sessionStorage.getItem("username");
    // Lấy bài viết theo ID để hiển thị trên trang chi tiết
    BlogService.getBlogById(blogId).then(function (resp) {
        $scope.blog = resp.data;
        BlogService.getAllBlog()
            .then(function (resp) {
                $scope.lstBlog = resp.data;
                CommentService.getAllCommentByBlogId(blogId).then(function (resp) {
                    $scope.comments = resp.data;
                }).catch(function (error) {
                    console.error('Lỗi khi lấy danh sách bình luận:', error);
                });
                //Lấy top 4 bài viết nhiều bình luận nhất
                BlogService.getTop4BlogPopular().then(function (resp) {
                    $scope.blogPopular = resp.data;
                }).catch(function (error) {
                    console.error('Lỗi khi lấy top 4 blog:', error);
                });
                //Xử lí chuyển bài viết tiếp theo
                $scope.checkPrevAndNextBlog($scope.lstBlog);
            }).catch(function (error) {
                console.error('Lỗi khi lấy tất cả bài viết :', error);
            });
    }).catch(function (error) {
        console.error('Lỗi khi lấy bài viết :', error);
    });

    $scope.setBaseUrl = function(){
        // Kiểm tra xem URL cần kiểm tra có trong các link đã được khai báo trong route hay không
        var isDeclaredRoute = false;

        // Lấy URL cần kiểm tra
        var urlToCheck = $location.path();

        // Lặp qua các route đã khai báo
        angular.forEach($route.routes, function (route) {
            // Kiểm tra xem URL cần kiểm tra có trùng khớp với route hay không
            if (route.originalPath && route.regexp && route.regexp.test(urlToCheck)) {
                isDeclaredRoute = true;
            }
        });

        // Nếu link trươc khi login không chứa "login" và là link đã khai báo trong route thì sẽ dùng link đó nếu không thì dùng link trang home
        if (!$window.location.href.includes("login") && isDeclaredRoute) {
            $window.sessionStorage.setItem("pageBackLoginSuccess", $window.location.href);
        } else {
            var pageBackLoginSuccess = ($window.sessionStorage.getItem("pageBackLoginSuccess") != null) ? $window.sessionStorage.getItem("pageBackLoginSuccess") : null;
            if (!pageBackLoginSuccess || pageBackLoginSuccess.includes("login")) {
                $window.sessionStorage.setItem("pageBackLoginSuccess", $location.absUrl().split('/')[2]);
            }
        }
    }

    // Lấy bài viết trước và sau của bài viết (previous and next)
    $scope.checkPrevAndNextBlog = function (listBLog) {
        if (listBLog != null && listBLog != undefined) {
            for (let i = 0; i < listBLog.length; i++) {
                if (listBLog[i].id == blogId) {
                    if (i == 0) {
                        $scope.blogIdPrev = listBLog[listBLog.length - 1].id; // Bài viết trước đó
                        $scope.blogIdNext = listBLog[i + 1].id; // Bài viết sau đó
                    } else if (i == (listBLog.length - 1)) {
                        $scope.blogIdPrev = listBLog[i - 1].id; // Bài viết trước đó
                        $scope.blogIdNext = listBLog[0].id; // Bài viết sau đó
                    } else {
                        $scope.blogIdPrev = listBLog[i - 1].id; // Bài viết trước đó
                        $scope.blogIdNext = listBLog[i + 1].id; // Bài viết sau đó
                    }
                }
            }
        }
    };

    $scope.calculateTimeAgo = TimeService.calculateTimeAgo;

    function getCommentData() {
        $scope.commentData.username = $scope.username;
        $scope.commentData.blogId = blogId;
    }

    $scope.sendComment = function () {
        getCommentData();
        CommentService.sendComment($scope.commentData)
            .then(function (resp) {
                console.log(resp)
                if (resp.status === 200) {
                    ToastService.showSuccessToast('Đã gửi thành công.');
                }
            })
            .catch(function (error) {
                console.log(error)
                ToastService.showErrorToast(error);
            });
    };

});

