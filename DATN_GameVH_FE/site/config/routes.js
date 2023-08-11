app.config(function($routeProvider, $locationProvider) {
    $locationProvider.html5Mode({
        enabled: true,
        requireBase: false
    });
    $locationProvider.hashPrefix('');

    $routeProvider
        .when('/', {
            templateUrl: '/views/home.html',
            pageTitle: 'TRANG CHỦ'
        })
        .when('/index.html', {
            redirectTo: '/'
        })
        .when('/wishlist', {
            templateUrl: '/views/wishlist.html',
            pageTitle: 'DANH SÁCH YÊU THÍCH'
        })
        .when('/product/detail/:productId', {
            templateUrl: '/views/product-detail.html',
            pageTitle: 'CHI TIẾT SẢN PHẨM'
        })
        .when('/viewCart', {
            templateUrl: '/views/cart.html',
            pageTitle: 'GIỎ HÀNG'
        })
        .when('/checkout', {
            templateUrl: '/views/checkout.html',
            pageTitle: 'THANH TOÁN'
        })
        .when('/shop', {
            templateUrl: '/views/shop.html',
            pageTitle: 'CỬA HÀNG'
        })
        .when('/shop/:type', {
            templateUrl: '/views/shop.html',
            pageTitle: 'CỬA HÀNG'
        })
        .when('/shop/:type/:category', {
            templateUrl: '/views/shop.html',
            pageTitle: 'CỬA HÀNG'
        })
        .when('/shop-list', {
            templateUrl: '/views/shop-list.html',
            pageTitle: 'CỬA HÀNG'
        })
        .when('/shop-list/:type', {
            templateUrl: '/views/shop-list.html',
            pageTitle: 'CỬA HÀNG'
        })
        .when('/shop-list/:type/:category', {
            templateUrl: '/views/shop-list.html',
            pageTitle: 'CỬA HÀNG'
        })
        .when('/shop-2cols', {
            templateUrl: '/views/shop-2cols.html',
            pageTitle: 'CỬA HÀNG'
        })
        .when('/shop-2cols/:type', {
            templateUrl: '/views/shop-2cols.html',
            pageTitle: 'CỬA HÀNG'
        })
        .when('/shop-2cols/:type/:category', {
            templateUrl: '/views/shop-2cols.html',
            pageTitle: 'CỬA HÀNG'
        })
        .when('/shop-4cols', {
            templateUrl: '/views/shop-4cols.html',
            pageTitle: 'CỬA HÀNG'
        })
        .when('/shop-4cols/:type', {
            templateUrl: '/views/shop-4cols.html',
            pageTitle: 'CỬA HÀNG'
        })
        .when('/shop-4cols/:type/:category', {
            templateUrl: '/views/shop-4cols.html',
            pageTitle: 'CỬA HÀNG'
        })
        .when('/profile', {
            templateUrl: '/views/profile.html',
            pageTitle: 'TÀI KHOẢN CỦA TÔI'
        })
        .when('/aboutus', {
            templateUrl: '/views/about.html',
            pageTitle: 'VỀ CHÚNG TÔI'
        })
        .when('/contact', {
            templateUrl: '/views/contact.html',
            pageTitle: 'LIÊN HỆ'
        })
        .when('/feedback', {
            templateUrl: '/views/about.html',
            pageTitle: 'GÓP Ý'
        })
        .when('/blog', {
            templateUrl: '/views/blog-list.html',
            pageTitle: 'BÀI VIẾT'
        })
        .when('/blog/detail/:blogId', {
            templateUrl: '/views/blog-detail.html',
            pageTitle: 'CHI TIẾT BÀI VIẾT'
        })
        .when('/checkoutResult', {
            templateUrl: '/views/checkoutResult.html',
            pageTitle: 'THANH TOÁN THÀNH CÔNG'
        })
        .otherwise({
            templateUrl: '/views/404.html',
            pageTitle: 'KHÔNG TÌM THẤY TRANG',
            controller: 'GoogleSigninController'
        })
}).run(function($rootScope, $route) {
    $rootScope.$on('$routeChangeSuccess', function() {
        $rootScope.pageTitle = $route.current.pageTitle;
    });
});