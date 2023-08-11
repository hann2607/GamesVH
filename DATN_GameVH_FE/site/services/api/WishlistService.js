app.factory('WishlistService', function($http) {
    var baseUrl = host + '/api/favorite';

    return {
        getWishlist: function(accountId) {
            return $http.get(baseUrl + '/getAll/' + accountId);
        },

        addWishlist: function(favoriteData) {
            return $http.post(baseUrl + '/addWishlist/', favoriteData);
        },

        updateFavorite: function(favoriteData) {
            return $http.put(baseUrl + '/updateWishlist', favoriteData); // Sửa lại đường dẫn thành /updateWishlist/
        },

        removeFromWishlist: function(productId) {
            return $http.delete(baseUrl + '/removeWishlist/' + productId);
        },
    };
});