app.controller("ProductDetailController", function (ProductService, FeedbackService, $scope, $routeParams, $timeout, $rootScope) {
    $scope.product = {}; // Thông tin sản phẩm sẽ được hiển thị trên trang chi tiết
    $scope.thumbnails = []; // Mảng hình ảnh thumbnail của sản phẩm
    $scope.feedbacks = []; // Tất cả các feedback đã được duyệt của sản phẩm
    $scope.sameProduct = []; // Mảng sản phẩm cùng loại
    $scope.productIdPrev; // Sản phẩm trước đó
    $scope.productIdNext; // Sản phẩm sau đó
    var productId = $routeParams.productId; // ID của sản phẩm được truyền vào qua URL

    // Lấy sản phẩm theo ID để hiển thị trên trang chi tiết
    ProductService.getProductDTO(productId).then(function (response) {
        $scope.product = response.data;
        $scope.thumbnails = $scope.product.thumbnail.split('***');
    }).catch(function (error) {
        console.error('Lỗi khi lấy sản phẩm DTO:', error);
    });

    // Lấy tất cả các sản phẩm cùng loại
    ProductService.getProduct(productId).then(function (product) {
        if (product.data.type == "Game") {
            // Lấy tất cả sản phẩm game
            ProductService.getListGame().then(function (response) {
                $scope.sameProduct = response.data;
                $scope.checkPrevAndNextProduct($scope.sameProduct);
                $scope.randomizeArray($scope.sameProduct);
                $scope.checkCarouselInitialization();
            }).catch(function (error) {
                console.error('Lỗi khi lấy danh sách game:', error);
            });
        } else {
            // Lấy tất cả sản phẩm phụ kiện
            ProductService.getListAccessory().then(function (response) {
                $scope.sameProduct = response.data;
                $scope.checkPrevAndNextProduct($scope.sameProduct);
                $scope.randomizeArray($scope.sameProduct);
                $scope.checkCarouselInitialization();
            }).catch(function (error) {
                console.error('Lỗi khi lấy danh sách phụ kiện:', error);
            });
        }
    }).catch(function (error) {
        console.error('Lỗi khi lấy sản phẩm:', error);
    });

    // Lấy sản phẩm trước và sau của sản phẩm (previous and next)
    $scope.checkPrevAndNextProduct = function (listProduct) {
        if (listProduct != null && listProduct != undefined) {
            for (let i = 0; i < listProduct.length; i++) {
                if (listProduct[i].id == productId) {
                    if (i == 0) {
                        $scope.productIdPrev = listProduct[listProduct.length - 1].id; // Sản phẩm trước đó
                        $scope.productIdNext = listProduct[i + 1].id; // Sản phẩm sau đó
                    } else if (i == (listProduct.length - 1)) {
                        $scope.productIdPrev = listProduct[i - 1].id; // Sản phẩm trước đó
                        $scope.productIdNext = listProduct[0].id; // Sản phẩm sau đó
                    } else {
                        $scope.productIdPrev = listProduct[i - 1].id; // Sản phẩm trước đó
                        $scope.productIdNext = listProduct[i + 1].id; // Sản phẩm sau đó
                    }
                }
            }
        }
    };

    // Lấy tất cả các feedback đã được duyệt của sản phẩm
    FeedbackService.getFeedbackByProduct(productId).then(function (response) {
        $scope.feedbacks = response.data;
    }).catch(function (error) {
        console.error('Lỗi khi lấy feedback:', error);
    });

    // Sắp xếp các sản phẩm trong mảng ngẫu nhiên
    $scope.randomizeArray = function (jsonArray) {
        var currentIndex = jsonArray.length, temporaryValue, randomIndex;
        while (0 !== currentIndex) {
            randomIndex = Math.floor(Math.random() * currentIndex);
            currentIndex -= 1;
            temporaryValue = jsonArray[currentIndex];
            jsonArray[currentIndex] = jsonArray[randomIndex];
            jsonArray[randomIndex] = temporaryValue;
        }
    };

    $scope.checkCarouselInitialization = function () {
        if ($scope.sameProduct.length > 0) {
            $timeout(function () {
                $rootScope.$broadcast('carouselInitialized');
            });
        }
    };

    $scope.$on('carouselInitialized', function () {
        $scope.initCarousel();
    });

    $scope.initCarousel = function () {
        $timeout(function () {
            $('.owl-carousel').owlCarousel({
                // Cấu hình của carousel
                nav: false,
                dots: true,
                margin: 20,
                loop: false,
                responsive: {
                    "0": {
                        items: 2
                    },
                    "480": {
                        items: 2
                    },
                    "768": {
                        items: 3
                    },
                    "992": {
                        items: 4
                    },
                    "1200": {
                        items: 5,
                        nav: true
                    }
                }
            });
        }, 0);
    };

}).filter('vndFormat', function () {
    // Filter định dạng tiền tệ
    return function (input) {
        if (!input) return '';
        var number = parseFloat(input);
        if (isNaN(number)) return input;
        var formattedNumber = number.toLocaleString('vi-VN');
        formattedNumber += ' VND';
        return formattedNumber;
    };
}).filter('dateFormat', function () {
    // Filter định dạng ngày tháng năm
    return function (dateString) {
        var date = new Date(dateString);
        var day = date.getDate();
        var month = date.getMonth() + 1;
        var year = date.getFullYear();
        day = (day < 10) ? '0' + day : day;
        month = (month < 10) ? '0' + month : month;
        var formattedDate = day + '/' + month + '/' + year;
        return formattedDate;
    };
});

