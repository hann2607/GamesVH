app.factory("AccountService", function ($http) {
  const baseUrl = host + "/api/account";
  return {
    getEmployees: function (filters) {
      const queries = {
        page: filters.page || 0,
        size: filters.size || 200,
        username: filters.username || null,
        email: filters.email || null,
        name: filters.name || null,
        roleId: filters.roleId || null,
      };
      return $http.get(baseUrl, { params: queries });
    },
    createEmployee: function (employeeData, image) {
      console.log(image);
      const formData = new FormData();
      formData.append(
        "account",
        JSON.stringify({
          ...employeeData,
          status: true,
          roleIds: ["STAF"],
        })
      );
      formData.append("image", image);

      return $http.post(baseUrl, formData, {
        transformRequest: angular.identity,
        headers: { "Content-Type": undefined },
      });
    },
    updateEmployee: function (username, employeeData, image) {
      var url = baseUrl + "/" + username;
      const formData = new FormData();
      formData.append(
        "account",
        JSON.stringify({
          ...employeeData,
          status: true,
        })
      );
      formData.append("image", image);
      return $http.put(url, formData, {
        transformRequest: angular.identity,
        headers: { "Content-Type": undefined },
      });
    },
    toggleStatus(username) {
      return $http.put(baseUrl + "/status/" + username);
    },
    deleteEmployee: function (username) {
      var url = baseUrl + "/" + username;
      return $http.delete(url);
    },
    getCustomers: function (filters) {
      const queries = {
        page: filters.page || 0,
        size: filters.size || 200,
        username: filters.username || null,
        email: filters.email || null,
        name: filters.name || null,
        roleId: filters.roleId || null,
      };
      return $http.get(baseUrl, { params: queries });
    },
  };
});
