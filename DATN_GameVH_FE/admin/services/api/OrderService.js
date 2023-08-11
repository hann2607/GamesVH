app.factory("OrderService", function ($http) {
  const baseUrl = host + "/api/orderdata";
  return {
    getAll: function (filters) {
      const queries = {
        page: filters.page || 0,
        size: filters.size || 500,
        username: filters.username || null,
        phone: filters.phone || null,
        createdAt: filters.createdAt || null,
      };
      console.log(queries);
      return $http.get(baseUrl, { params: queries });
    },
    getOne(id) {
      return $http.get(`${baseUrl}/full/${id}`);
    },
    getTop5() {
      return $http.get(baseUrl + "/getTop5");
    },
    updateStatus(orderId, newStatus) {
      return $http.put(`${baseUrl}/status/${orderId}`, newStatus);
    },
  };
});
