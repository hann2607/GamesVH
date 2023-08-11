app.controller("DashboardController", DashboardController);

function DashboardController(
    $scope,
    $window,
    DashboardService,
    ProductService,
    OrderService,
    ProductAdminService,
    SweetAlert
) {
    $scope.userName;
    $scope.products = [];
    $scope.orders = [];
    $scope.recordTotal = {};
    $scope.feedback = [];
    $scope.init = function() {
        $scope.userName = $window.localStorage.getItem("userName");
        ProductService.getTop5()
            .then(function(response) {
                const data = response.data;
                $scope.products = data;
            })
            .catch(function(error) {
                console.error("Lỗi khi lấy danh sản phẩm:", error);
            });
        OrderService.getTop5()
            .then(function(response) {
                const data = response.data;
                $scope.orders = data;
            })
            .catch(function(error) {
                console.error("Lỗi khi lấy danh sách đơn hàng:", error);
            });
        ProductService.getTotalRecord()
            .then(function(response) {
                const data = response.data;
                $scope.recordTotal = data;
            })
            .catch(function(error) {
                console.error("Lỗi khi lấy danh sản phẩm:", error);
            });
        ProductAdminService.getTop5()
            .then(function(response) {
                $scope.feedback = response.data;
            })
            .catch(function(error) {
                console.error("Lỗi khi lấy danh đánh giá:", error);
            });
        ProductService.getAllDataChart()
            .then(function(response) {
                const data = response.data;
                Morris.Bar({
                    element: "bar-charts1",
                    data: data.products,
                    xkey: "monthYear",
                    ykeys: ["totalRecord"],
                    labels: ["TotalRecord"],
                    lineColors: ["#f43b48"],
                    lineWidth: "3px",
                    barColors: ["#f43b48"],
                    resize: true,
                    redraw: true,
                });

                // Line Chart

                Morris.Line({
                    element: "line-charts1",
                    data: data.payments,
                    xkey: "monthYear",
                    ykeys: ["totalRecord"],
                    labels: ["TotalRecord"],
                    lineColors: ["#f43b48"],
                    lineWidth: "3px",
                    resize: true,
                    redraw: true,
                });
            })
            .catch(function(error) {
                console.error("Lỗi khi lấy danh sản phẩm:", error);
            });
    };
    $scope.init();
}