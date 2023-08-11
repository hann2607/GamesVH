app.factory('EmployeeService', function($http) {
    var baseUrl = host + '/api/employees';
  
    return {
      getEmployees: function() {
        return $http.get(baseUrl + '/getAll');
      }
    //   createEmployee: function(employeeData) {
    //     return $http.post(baseUrl, employeeData);
    //   },
    //   updateEmployee: function(employeeId, employeeData) {
    //     var url = baseUrl + '/' + employeeId;
    //     return $http.put(url, employeeData);
    //   },
    //   deleteEmployee: function(employeeId) {
    //     var url = baseUrl + '/' + employeeId;
    //     return $http.delete(url);
    //   }
    };
  });
  