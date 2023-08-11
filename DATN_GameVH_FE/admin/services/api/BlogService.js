app.factory('BlogService', function ($http) {
    var baseUrl = host + '/api/blog';

    return {
        getAllBlog: function () {
            return $http.get(baseUrl + '/getAll');
        },

        uploadImage: function (image) {
            // Check if the image is not empty before making the request
            var formData = new FormData();
            formData.append('image', image);

            // Use $http.post to send the image data as a FormData and return the promise
            return $http.post(baseUrl + '/upload-imageBlog', formData, {
                transformRequest: angular.identity,
                headers: { 'Content-Type': undefined }
            })
        },
        createBlog: function (blogData) {
            return $http.post(baseUrl + '/create', blogData)
        },
        getBlogById: function (id) {
            return $http.get(baseUrl + '/' + id);
        },
        deleteBlog: function (blogId) {
            return $http.delete(baseUrl + '/' + blogId)
        },
        getCommentsByBlogId: function (blogId) {
            // Gọi API để lấy danh sách bình luận từ server
            return $http.get(baseUrl + '/getComment/' + blogId);
        },
        deleteCommentById: function (commentId) {
            // Make a DELETE request to the API endpoint with the commentId
            return $http.delete(baseUrl + '/deleteComment/' + commentId)
        },
        updateCommentStatus: function (commentId, newStatus) {
            // Make a PUT or PATCH request to the API endpoint with commentId and newStatus as query parameters
            return $http.put(baseUrl + '/updateCommentStatus/' + commentId + '?status=' + newStatus);
        }
    }
});
