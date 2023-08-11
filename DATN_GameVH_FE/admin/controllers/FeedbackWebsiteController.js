app.controller('FeedbackWebsiteController', FeedbackWebsiteController);
function FeedbackWebsiteController($scope, FeedbackWebsiteService) {

    $scope.feedbackWebsites = [];

    $scope.getDataFeedbackWebsite = function () {
        FeedbackWebsiteService.getAll()
            .then(function (resp) {
                $scope.feedbackWebsites = resp.data;

                $scope.feedbackWebsites.sort(function (a, b) {
                    return new Date(b.createDate) - new Date(a.createDate);
                });

                console.log($scope.feedbackWebsites)

                for (let i = 0; i < $scope.feedbackWebsites.length; i++) {
                    $scope.feedbackWebsites[i].createDate = convertToVietnamTime($scope.feedbackWebsites[i].createDate);
                }

                $(document).ready(function () {
                    $scope.loadDataTableFeedbackWebsite($scope.feedbackWebsites);
                });
            })
            .catch(function (error) {
                console.error("Lỗi khi lấy danh sách đánh giá!");
            });
    };
    $scope.getDataFeedbackWebsite();

    $scope.loadDataTableFeedbackWebsite = function (feedbacks) {
        var table = $('#tableFeedbackWebsite');

        if ($.fn.DataTable.isDataTable(table)) {
            table.DataTable().destroy();
        }

        table.DataTable({
            searching: false,
            "language": {
                "lengthMenu": "Hiển thị _MENU_ hàng",
                "info": "Hiển thị từ _START_ đến _END_ trên tổng số _TOTAL_ hàng",
                "paginate": {
                    "first": "Đầu",
                    "previous": "Trước",
                    "next": "Tiếp",
                    "last": "Cuối"
                },
                "emptyTable": "Không có dữ liệu"
            },
            data: feedbacks, // Dữ liệu được truyền vào DataTables
            columns: [
                {
                    data: null,
                    render: function (data, type, row, meta) {
                        // Render giao diện cho cột "#"
                        return meta.row + 1;
                    }
                },
                { data: 'id', class: 'text-center' }, // Cột "Mã đánh giá"
                { data: 'username', class: 'text-center' }, // Cột "Tên đăng nhập"
                { data: 'fullname', class: 'text-center' }, // Cột "Họ và tên"
                { data: 'createDate', class: 'text-center' }, // Cột "Ngày đánh giá"
                { data: 'content', class: 'text-center text-wrap' }, // Cột "Nội dung"
            ]
        });
    };

    function convertToVietnamTime(utcTimeStr) {
        const utcTime = new Date(utcTimeStr);
        const vietnamTime = new Date(utcTime.toLocaleString('en-US', { timeZone: 'Asia/Ho_Chi_Minh' }));

        const day = String(vietnamTime.getDate()).padStart(2, '0');
        const month = String(vietnamTime.getMonth() + 1).padStart(2, '0');
        const year = vietnamTime.getFullYear();

        const formattedTime = `${vietnamTime.toLocaleTimeString('en-US', { hour12: false })} ${day}-${month}-${year}`;

        return formattedTime;
    }
};