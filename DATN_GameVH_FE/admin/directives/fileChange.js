app.directive("fileChange", function () {
  return {
    restrict: "A",
    link: function (scope, element, attrs) {
      var onChangeFunc = scope.$eval(attrs.fileChange);
      element.bind("change", onChangeFunc);
    },
  };
});
