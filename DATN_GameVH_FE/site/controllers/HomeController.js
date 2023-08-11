app.controller("HomeController", function (ProductService, BlogService, TimeService, $scope, $timeout, $rootScope) {
    $scope.activeTab = 'products-trending-tab';
    $scope.topSellings = [];
    $scope.topNewReleases = [];
    $scope.topRates = [];
    $scope.listGames = [];
    $scope.listAccessories = [];
    $scope.listBlogs = [];
    $scope.calculateTimeAgo = TimeService.calculateTimeAgo;

    $scope.loadData = function () {
        ProductService.getTop6Selling().then(function (response) {
            $scope.topSellings = response.data;
            $scope.checkCarouselInitialization();
        }).catch(function (error) {
            console.error('Lỗi khi lấy top 6 sản phẩm bán chạy nhất:', error);
        });

        ProductService.getTop6NewRelease().then(function (response) {
            $scope.topNewReleases = response.data;
            $scope.checkCarouselInitialization();
        }).catch(function (error) {
            console.error('Lỗi khi lấy top 6 sản phẩm mới nhất:', error);
        });

        ProductService.getTop6Rated().then(function (response) {
            $scope.topRates = response.data;
            $scope.checkCarouselInitialization();
        }).catch(function (error) {
            console.error('Lỗi khi lấy top 6 sản phẩm đánh giá cao nhất:', error);
        });

        ProductService.getListGame().then(function (response) {
            $scope.listGames = response.data;
            $scope.randomizeArray($scope.listGames);
        }).catch(function (error) {
            console.error('Lỗi khi lấy danh sách game:', error);
        });

        ProductService.getListAccessory().then(function (response) {
            $scope.listAccessories = response.data;
            $scope.randomizeArray($scope.listAccessories);
            $scope.checkCarouselInitialization();
        }).catch(function (error) {
            console.error('Lỗi khi lấy danh sách phụ kiện:', error);
        });

        BlogService.getAllBlog().then(function (response) {
            $scope.listBlogs = response.data;
            $scope.checkCarouselInitialization();
        }).catch(function (error) {
            console.error('Lỗi khi lấy danh sách phụ kiện:', error);
        });
    };

    $scope.loadData();

    $scope.checkCarouselInitialization = function () {
        if ($scope.topSellings.length > 0 && $scope.topNewReleases.length > 0 && $scope.topRates.length > 0) {
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

            $('.owl-carousel-2-items').owlCarousel({
                "nav": false,
                "dots": true,
                "margin": 0,
                "loop": false,
                "items": 1
            });
        }, 0);
    };



    $scope.changeTab = function (tabId) {
        $scope.activeTab = tabId;
    };

    $scope.randomizeArray = function (jsonArray) {
        var currentIndex = jsonArray.length, temporaryValue, randomIndex;

        // Trong khi còn phần tử chưa được duyệt hết
        while (0 !== currentIndex) {

            // Lấy phần tử còn lại
            randomIndex = Math.floor(Math.random() * currentIndex);
            currentIndex -= 1;

            // Hoán đổi phần tử hiện tại với phần tử ngẫu nhiên
            temporaryValue = jsonArray[currentIndex];
            jsonArray[currentIndex] = jsonArray[randomIndex];
            jsonArray[randomIndex] = temporaryValue;
        }
    };

    $scope.setActive = function (url) {
        $scope.activeUrl = url;
    };

}).filter('vndFormat', function () {
    return function (input) {
        if (!input) return '';

        // Chuyển đổi số về dạng chuỗi và đảm bảo nó là một số
        var number = parseFloat(input);

        // Kiểm tra xem có phải là một số hợp lệ hay không
        if (isNaN(number)) return input;

        // Định dạng số về VD: "100,000 VND"
        var formattedNumber = number.toLocaleString('vi-VN');
        formattedNumber += ' VND';

        return formattedNumber;
    };
});
