app.controller("CartController", function (ProductService, ToastService, $scope, $window) {

	$scope.cart = [];
	$scope.TotalPrice = 0;

	function updateCart() {
		$scope.cart = ($window.localStorage.getItem("carts") != null) ? JSON.parse($window.localStorage.getItem("carts")) : [];
		$scope.TotalPrice = 0;
		if ($scope.cart.length > 0) {
			$scope.cart.forEach(function (data) {
				$scope.TotalPrice += (data.salePrice - (data.salePrice * data.offer)) * data.qty;
			});
		}
	}

	// Lắng nghe sự thay đổi trong local storage
	$scope.$watch(function () {
		return $window.localStorage.getItem("carts");
	}, function (newVal, oldVal) {
		if (newVal !== oldVal) {
			updateCart();
		}
	});

	$scope.load_all = function () {
		updateCart();
	};

	$scope.load_all();

	$scope.addCart = function (event) {
		var productId = event.currentTarget.getAttribute('data-product-id');
		$scope.cart = ($window.localStorage.getItem("carts") != null) ? JSON.parse($window.localStorage.getItem("carts")) : [];
		$scope.isActiveOnLocalstorage = false;
		$scope.productCart = {};

		// Check trên localstorage đã có product đó chưa
		$scope.cart.forEach(function (data) {
			if (data.id == productId) {
				$scope.isActiveOnLocalstorage = true;
				$scope.productCart = data;
			}
		});

		// Nếu tồn tại thì Qty +1, game thì Qty luôn luôn là 1
		if ($scope.isActiveOnLocalstorage) {
			ProductService.getProduct(productId).then(function (response) {
				if (response.data.category.type == "PK" && response.data.available && response.data.qty > $scope.productCart.qty) {
					$scope.cart.forEach(function (data) {
						if (data.id == response.data.id) {
							data.qty += 1;
							ToastService.showSuccessToast('Thêm vào giỏ hàng thành công!');
							$window.localStorage.setItem("carts", JSON.stringify($scope.cart));
						}
					});
				} else {
					ToastService.showErrorToast('Sản phẩm đã tồn tại trong giỏ hàng!');
				}
			}).catch(function (error) {
				console.error('Lỗi khi lấy sản phẩm theo Id:', error);
			});
		} else {
			// Chưa tồn tại thì tạo mới set Qty = 1
			ProductService.getProductDTO(productId).then(function (response) {
				ProductService.getProduct(productId).then(function (product) {
					if (product.data.available && product.data.qty > 0) {
						response.data["qty"] = 1;
						$scope.cart.push(response.data);
						ToastService.showSuccessToast('Thêm vào giỏ hàng thành công!');
						$window.localStorage.setItem("carts", JSON.stringify($scope.cart));
					}
				}).catch(function (error) {
					console.error('Lỗi khi lấy sản phẩm theo Id:', error);
				});
			}).catch(function (error) {
				console.error('Lỗi khi lấy sản phẩm theo Id:', error);
			});
		}

		$scope.load_all();
	}

	$scope.removeCart = function (event) {
		// remove product
		var productId = event.currentTarget.getAttribute('data-cart-id');
		$scope.cart = ($window.localStorage.getItem("carts") != null) ? JSON.parse($window.localStorage.getItem("carts")) : [];
		$scope.cart.forEach(function (data, index) {
			if (data.id == productId) {
				$scope.cart.splice(index, 1);
				ToastService.showSuccessToast('Sản phẩm đã được xóa!');
				$window.localStorage.setItem("carts", JSON.stringify($scope.cart));
			}
		});
		$scope.load_all();
	}

	// $scope.clear_all = function(){
	// 	var url = `${host}/clearCart`;
	// 	$http.post(url).then(resp => {
	// 		$scope.cart = resp.data;
	//         $scope.load_all();
	// 	}).catch(error => {
	// 		console.log("Error", error)
	// 	})
	// }
}).filter('vndFormat', function () {
	return function (input) {
		if (!input) return '';

		// Chuyển đổi số về dạng chuỗi và đảm bảo nó là một số
		var number = parseFloat(input);

		// Kiểm tra xem có phải là một số hợp lệ hay không
		if (isNaN(number)) return input;

		// Định dạng số về VD: "100,000 VND"
		var formattedNumber = number.toLocaleString('vi-VN');
		formattedNumber += ' VND';

		return formattedNumber;
	};
});