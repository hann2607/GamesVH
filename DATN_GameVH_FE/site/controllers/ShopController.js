app.controller("ShopController", function (PageService, ProductService, CategoryService, $scope, $routeParams, $location, $window) {
	$scope.type = $routeParams.type;
	$scope.category = $routeParams.category;
	$scope.search = $routeParams.search;
	$scope.itemsPerPage = 9; // Số lượng phần tử hiển thị trên mỗi trang
	$scope.currentPage = 1; // Trang hiện tại
	$scope.totalPages = 0;
	$scope.displayedItems = [];
	$scope.products = [];
	$scope.categories = [];
	$scope.typePageShop = 'shop';
	$scope.tempProducts = [];

	// Tạo mảng giá để filter
	$scope.priceRanges = [
		{ range: "0 - 1.000.000 VND", min: 0, max: 1000000, selected: false },
		{ range: "1.000.000 - 5.000.000 VND", min: 1000000, max: 5000000, selected: false },
		{ range: "5.000.000 - 10.000.000 VND", min: 5000000, max: 10000000, selected: false },
		{ range: "Trên 10.000.000 VND", min: 10000000, max: Infinity, selected: false }
	];

	if ($scope.type != null && $scope.type != undefined) {
		$scope.selectedType = $scope.type;
	} else {
		$scope.selectedType = '0';
	}

	$scope.checkLink = function () {
		var link = $window.location.href || '';

		if (link.indexOf("shop-4cols") !== -1) {
			$scope.itemsPerPage = 12;
			$scope.typePageShop = "shop-4cols";
		} else if (link.indexOf("shop-2cols") !== -1) {
			$scope.itemsPerPage = 6;
			$scope.typePageShop = "shop-2cols";
		} else if (link.indexOf("shop-list") !== -1) {
			$scope.itemsPerPage = 4;
			$scope.typePageShop = "shop-list";
		} else {
			$scope.itemsPerPage = 9;
			$scope.typePageShop = "shop";
		}
	};

	$scope.checkLink();

	$scope.resetFilter = function () {
		var gameElements = document.querySelectorAll(".game");
		// Sử dụng forEach để duyệt qua từng phần tử
		gameElements.forEach(function (element) {
			// Kiểm tra giá trị "checked" của từng phần tử
			if (element.checked) {
				element.checked = false;
			}
		});

		var pkElements = document.querySelectorAll(".pk");
		// Sử dụng forEach để duyệt qua từng phần tử
		pkElements.forEach(function (element) {
			// Kiểm tra giá trị "checked" của từng phần tử
			if (element.checked) {
				element.checked = false;
			}
		});

		$scope.priceRanges.forEach(function (element) {
			// Kiểm tra giá trị "checked" của từng phần tử
			if (element.selected) {
				element.selected = false;
			}
		})

		$scope.products = $scope.tempProducts;
		$scope.getListProductOnPage();
	}

	$scope.filter = function () {
		var arrFilter = []; // Lưu các loại sản phẩm người dùng chọn để lọc
		var arrRangePriceSelected = []; // Lưu các khoảng giá người dùng chọn để lọc
		var filteredProducts = []; // mảng sản phẩm đã lọc theo loại sản phẩm
		var filteredProductsPrice = []; // mảng sản phẩm đã lọc theo giá sản phẩm
		$scope.products = $scope.tempProducts; // làm mới lại danh sách sản phẩm

		// Duyệt để lấy ra các loại game người dùng chọn để filter
		var gameElements = document.querySelectorAll(".game");
		// Sử dụng forEach để duyệt qua từng phần tử
		gameElements.forEach(function (element) {
			// Kiểm tra giá trị "checked" của từng phần tử
			if (element.checked) {
				arrFilter.push(element.getAttribute("data-category-id"));
			}
		});

		// Duyệt để lấy ra các loại phụ kiện người dùng chọn để filter
		var pkElements = document.querySelectorAll(".pk");
		// Sử dụng forEach để duyệt qua từng phần tử
		pkElements.forEach(function (element) {
			// Kiểm tra giá trị "checked" của từng phần tử
			if (element.checked) {
				arrFilter.push(element.getAttribute("data-category-id"));
			}
		});

		// Duyệt để lấy ra khoảng giá người dùng chọn để filter
		$scope.priceRanges.forEach(function (element) {
			if (element.selected) {
				arrRangePriceSelected.push(element);
			}
		})

		// Check nếu có loại sản phẩm thì lọc theo loại
		if (arrFilter.length > 0) {
			filteredProducts = $scope.products.filter(function (product) {
				return arrFilter.includes(product.categoryId);
			});
		}

		if (filteredProducts.length > 0) {
			// Lọc theo giá
			var filteredProductsPrice = filteredProducts.filter(function (product) {
				return $scope.priceRanges.some(function (priceRange) {
					return priceRange.selected && (product.salePrice - (product.salePrice * product.offer)) >= priceRange.min && (product.salePrice - (product.salePrice * product.offer)) <= priceRange.max;
				});
			});

			// Check nếu có lọc theo giá thì hiển thị
			if (arrRangePriceSelected.length > 0) {
				$scope.products = filteredProductsPrice || [];
				$scope.getListProductOnPage();
			} else {
				// Hiển thị lọc theo loại sản phẩm
				$scope.products = filteredProducts || [];
				$scope.getListProductOnPage();
			}
		} else {
			// Lọc theo giá
			var filteredProductsPrice = $scope.products.filter(function (product) {
				return $scope.priceRanges.some(function (priceRange) {
					return priceRange.selected && (product.salePrice - (product.salePrice * product.offer)) >= priceRange.min && (product.salePrice - (product.salePrice * product.offer)) <= priceRange.max;
				});
			});
			// Hiển thị lọc theo giá
			$scope.products = filteredProductsPrice || [];
			$scope.getListProductOnPage();
		}
	}

	$scope.loadData = function () {
		if ($scope.type == null || $scope.type == undefined) {
			ProductService.getAllProductDTO().then(function (response) {
				$scope.products = response.data;
				$scope.tempProducts = $scope.products;

				$scope.getListProductOnPage();
			}).catch(function (error) {
				console.error('Lỗi khi lấy tất cả sản phẩm DTO:', error);
			});
		} else {
			if ($scope.category == null || $scope.category == undefined) {
				if ($scope.type == "Game") {
					ProductService.getAllProductDTOByType($scope.type).then(function (response) {
						$scope.products = response.data;
						$scope.tempProducts = $scope.products;

						// Tìm kiếm sản phẩm
						$scope.searchProducts = $scope.searchProductInArr($scope.products);
						if ($scope.searchProducts) {
							$scope.products = $scope.searchProducts;
						}

						$scope.getListProductOnPage();
					}).catch(function (error) {
						console.error('Lỗi khi lấy danh sách game:', error);
					});
				} else {
					ProductService.getAllProductDTOByType($scope.type).then(function (response) {
						$scope.products = response.data;
						$scope.tempProducts = $scope.products;

						// Tìm kiếm sản phẩm
						$scope.searchProducts = $scope.searchProductInArr($scope.products);
						if ($scope.searchProducts) {
							$scope.products = $scope.searchProducts;
						}

						$scope.getListProductOnPage();
					}).catch(function (error) {
						console.error('Lỗi khi lấy danh sách phụ kiện:', error);
					});
				}
			} else {
				ProductService.getAllProductDTOByTypeAndCategory($scope.type, $scope.category).then(function (response) {
					$scope.products = response.data;
					$scope.tempProducts = $scope.products;

					$scope.searchProducts = $scope.searchProductInArr($scope.products);
					if ($scope.searchProducts) {
						$scope.products = $scope.searchProducts;
					}

					$scope.getListProductOnPage();
				}).catch(function (error) {
					console.error('Lỗi khi lấy tất cả sản phẩm DTO theo loại và danh mục:', error);
				});
			}
		}

		// Lấy danh sách danh mục
		CategoryService.getAll().then(function (response) {
			$scope.categories = response.data;
		}).catch(function (error) {
			console.error('Lỗi khi lấy tất cả danh mục:', error);
		});
	};

	$scope.loadData();

	$scope.fillByType = function (select) {
		// Kiểm tra giá trị select và thiết lập đường dẫn mới
		if (select.selectedType === 'Game') {
			$location.path('/' + $scope.typePageShop + '/Game');
		} else if (select.selectedType === 'PK') {
			$location.path('/' + $scope.typePageShop + '/PK');
		} else {
			$location.path('/' + $scope.typePageShop);
		}
	};

	$scope.getListProductOnPage = function () {
		// Tổng số trang
		$scope.totalPages = PageService.calctotalPage($scope.itemsPerPage, $scope.products);

		// Lấy danh sách sản phẩm cho trang hiện tại
		$scope.displayedItems = PageService.getDisplayedItems($scope.itemsPerPage, $scope.currentPage, $scope.products);

		// Danh sách số trang hiển thị
		$scope.getPageRange = function (totalPages) {
			const maxPages = 10; // Số trang tối đa hiển thị liên tiếp
			const currentPage = $scope.currentPage;

			if (totalPages <= maxPages) {
				return Array(totalPages).fill().map((_, index) => index + 1);
			} else {
				let pageRange = [];
				if (currentPage <= 3) {
					pageRange = Array(5).fill().map((_, index) => index + 1);
					pageRange.push('...');
					pageRange.push(totalPages);
				} else if (currentPage >= totalPages - 2) {
					pageRange.push(1);
					pageRange.push('...');
					pageRange = pageRange.concat(Array(5).fill().map((_, index) => totalPages - 4 + index));
				} else {
					pageRange.push(1);
					pageRange.push('...');
					pageRange = pageRange.concat(Array(3).fill().map((_, index) => currentPage - 1 + index));
					pageRange.push('...');
					pageRange.push(totalPages);
				}
				return pageRange;
			}
		};

	};

	$scope.previousPage = function () {
		if ($scope.currentPage > 1) {
			$scope.currentPage--;
		} else {
			$scope.currentPage = $scope.totalPages;
		}
		$scope.getListProductOnPage();
	};

	$scope.nextPage = function () {
		if ($scope.currentPage < $scope.totalPages) {
			$scope.currentPage++;
		} else {
			$scope.currentPage = 1;
		}
		$scope.getListProductOnPage();
	};

	$scope.get_ByPage = function (page) {
		$scope.currentPage = page;
		$scope.getListProductOnPage();
	};
});
