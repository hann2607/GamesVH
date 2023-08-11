app.factory('TimeService', function () {
    var calculateTimeAgo = function (createDate) {
        var created = new Date(createDate);
        var timeDiff = Date.now() - created.getTime();

        // Tính toán khoảng thời gian theo các đơn vị khác nhau
        var secondsAgo = Math.floor(timeDiff / 1000);
        var minutesAgo = Math.floor(timeDiff / (1000 * 60));
        var hoursAgo = Math.floor(timeDiff / (1000 * 60 * 60));
        var daysAgo = Math.floor(timeDiff / (1000 * 60 * 60 * 24));
        var monthsAgo = Math.floor(timeDiff / (1000 * 60 * 60 * 24 * 30));
        var yearsAgo = Math.floor(timeDiff / (1000 * 60 * 60 * 24 * 365));

        // Xác định định dạng dựa trên khoảng thời gian
        if (secondsAgo < 60) {
            return secondsAgo + ' giây trước';
        } else if (minutesAgo < 60) {
            return minutesAgo + ' phút trước';
        } else if (hoursAgo < 24) {
            return hoursAgo + ' giờ trước';
        } else if (daysAgo < 30) {
            return daysAgo + ' ngày trước';
        } else if (monthsAgo < 12) {
            return monthsAgo + ' tháng trước';
        } else {
            return yearsAgo + ' năm trước';
        }
    };

    return {
        calculateTimeAgo: calculateTimeAgo
    };
});
