app.factory("CategoryService", function ($http) {
  const baseUrl = host + "/api/category";
  return {
    getAll: function () {
      return $http.get(baseUrl + "/getAll");
    },
    createCategory(category) {
      return $http.post(baseUrl, category);
    },
    editCategory(id, category) {
      return $http.put(`${baseUrl}/${id}`, category);
    },
    deleteCategory(id) {
      return $http.delete(`${baseUrl}/${id}`);
    },
  };
});
