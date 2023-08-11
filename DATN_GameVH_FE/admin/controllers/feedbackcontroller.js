app.controller('FeedbackDropdownController', function($scope, ProductAdminService) {
    $scope.updateFeedbackStatus = function(status, feedback) {
        var feedbackId = feedback.id;
        ProductAdminService.updateFeedbackStatus(feedbackId, status)
            .then(function(response) {
                console.log("Feedback đã được cập nhật:", response.data);
                // Cập nhật trạng thái mới vào biến feedback.status
                feedback.status = status;
            })
            .catch(function(error) {
                console.error("Lỗi khi cập nhật feedback:", error);
            });
    };
});