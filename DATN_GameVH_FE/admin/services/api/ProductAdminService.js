app.factory('ProductAdminService', function($http) {
    var baseUrl = host + '/api/product';
    var baseUrlCa = host + '/api/category';

    return {
        getProductDTO: function(productId) {
            return $http.get(baseUrl + '/getProductAdminDTO/' + productId);
        },
        getProduct: function(productId) {
            return $http.get(baseUrl + '/' + productId);
        },
        getAllCategories: function() {
            return $http.get(baseUrlCa + '/getAll');
        },
        getAllProducts: function() {
            return $http.get(baseUrl + '/getAll');
        },
        getAllFeedback: function() {
            return $http.get(baseUrl + '/getAllFeedback');
        },
        getFeedbackProduct: function(productId) {
            return $http.get(baseUrl + '/getProduct/' + productId);
        },
        uploadImage: function(imageFile) {
            return $http.post(baseUrl + '/upload', imageFile, {
                headers: {
                    'Content-Type': undefined
                }
            });
        },
        createProduct: function(productData) {
            return $http.post(baseUrl + '/createProduct', productData);
        },
        updateProduct: function(productData) {
            return $http.put(baseUrl + '/updateProduct', productData);
        },

        deleteFeedback: function(feedbackIdtId) {
            return $http.delete(baseUrl + '/delete' + feedbackIdtId);
        },
        getListProductSearch: function(productName, productType, categoryName) {
            return $http.get(baseUrl + '/products/search?productName=' + productName + '&productType=' + productType + '&categoryName=' + categoryName);
        },
        updateFeedbackStatus: function(feedbackId, status) {
            return $http.put(baseUrl + '/updateFeedback/' + feedbackId, status);
        },
        deleteFeedbackById: function(feedbackId) {
            return $http.delete(baseUrl + '/deleteFeedback/' + feedbackId)
        },
        getTop5: function() {
            return $http.get(baseUrl + "/getTop5feedback");
        },
    };
});