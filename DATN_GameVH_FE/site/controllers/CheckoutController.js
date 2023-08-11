// Angular js
app.controller("CheckoutController", function (AccountService, OrderService, CouponOwnerService, MomoService, IPService,
	PaypalService, ZaloPayService, VNPayService, SendMailService, LocationService, ToastService, $scope, $window, $http) {

	$scope.cart = [];
	$scope.TotalPrice = 0;
	$scope.paymentMethod = "cod"; // mặc định chọn COD
	$scope.form = {};
	$scope.baseUrlHere = "http://localhost:3000";
	$scope.locations = [];

	// Validate coupon
	$scope.isValidCoupon = false; // báo lỗi chung
	$scope.isValidMinSpendCoupon = false; // báo lỗi đơn hàng tối thiểu
	$scope.isValidDateCoupon = false; // báo lỗi ngày của giảm giá
	$scope.DateCouponError = "";

	// Location
	const hostLocation = "https://provinces.open-api.vn/api/";
	$scope.selectedDistrict = false;
	$scope.selectedWard = false;
	$scope.provinces = [];
	$scope.districts = [];
	$scope.wards = [];
	var provinceId;
	var wardId;
	var districtId;

	$scope.account = {}; // Biến lưu thông tin account 
	$scope.username = null;

	// Trở về trang đăng nhập
	$scope.logout = function () {
		$window.localStorage.removeItem("username");
		$window.sessionStorage.removeItem("username");
		$window.sessionStorage.setItem("messageLogin", "Bạn đã đăng xuất!");
		$window.location.href = 'login.html';
	};

	AccountService.checkLogin().then(function (account) {
		// Người dùng đã đăng nhập
		$scope.account = account;
		if ($scope.account) {
			if ($scope.account.fullname) {
				$scope.form.fullname = $scope.account.fullname;
			}
			if ($scope.account.email) {
				$scope.form.email = $scope.account.email;
			}

			LocationService.getByUsername($scope.account.username).then(function (location) {
				$scope.locations = location.data;
				if ($scope.locations.length > 0) {
					$scope.locations.forEach(function (item) {
						if (item.addressDefault) {
							$scope.form.address = cutStringToRetainAddress(item.address);
							$scope.form.phone = item.phone;
							$scope.form.province = parseInt(item.province);
							$scope.form.district = parseInt(item.district);
							$scope.form.ward = parseInt(item.ward);
							$scope.updateLocation();
						}
					});
				}
			}).catch(function (error) {
			});
		}
	}).catch(function (error) {
		// Người dùng chưa đăng nhập hoặc có lỗi
		if (error === "Người dùng chưa đăng nhập") {
			// Xử lý logic khi người dùng chưa đăng nhập
			$window.localStorage.removeItem("username");
			$window.sessionStorage.removeItem("username");
			$window.sessionStorage.setItem("messageLogin", "Vui lòng đăng nhập!");
			$window.location.href = 'login.html';
		}
	});

	function cutStringToRetainAddress(inputString) {
		// Tìm vị trí của dấu phẩy thứ 4 tính từ cuối
		var lastIndex = inputString.lastIndexOf(',');

		if (lastIndex !== -1) {
			// Tìm vị trí của dấu phẩy thứ 3 tính từ cuối
			var thirdLastIndex = inputString.lastIndexOf(',', lastIndex - 1);

			if (thirdLastIndex !== -1) {
				// Tìm vị trí của dấu phẩy thứ 2 tính từ cuối
				var secondLastIndex = inputString.lastIndexOf(',', thirdLastIndex - 1);

				if (secondLastIndex !== -1) {
					// Cắt chuỗi từ đầu đến vị trí của dấu phẩy thứ 2
					var result = inputString.substring(0, secondLastIndex);
					return result;
				}
			}
		}

		// Trả về chuỗi gốc nếu không tìm thấy đủ 4 dấu phẩy
		return inputString;
	}

	function getCartData() {
		$scope.cart = ($window.localStorage.getItem("carts") != null) ? JSON.parse($window.localStorage.getItem("carts")) : [];
		$scope.TotalPrice = 0;
		if ($scope.cart.length > 0) {
			$scope.cart.forEach(function (data) {
				$scope.TotalPrice += (data.salePrice - (data.salePrice * data.offer)) * data.qty;
			});
		} else {
			$window.location.href = "/";
		}
	}
	$scope.load_all = function () {
		getCartData();
	};

	$scope.load_all();

	// Check nhập mã giảm giá
	$scope.checkCoupon = function () {
		$scope.updateStatusCoupon();
		if ($scope.form.coupon && $scope.account) {
			CouponOwnerService.getCoupon($scope.account.username, $scope.form.coupon).then(function (coupon) {
				$scope.coupon = coupon.data;
				if ($scope.coupon) {
					var today = new Date();
					// Kiểm tra xem coupon còn hạn hay không ?
					if (today < new Date($scope.coupon.mfgDate)) {
						$scope.DateCouponError = "Mã giảm giá chưa đến ngày áp dụng!";
						$scope.isValidDateCoupon = true;
						$scope.coupon = null;
						getCartData();
					} else if (today > new Date($scope.coupon.expDate)) {
						$scope.DateCouponError = "Mã giảm giá đã hết hạn!";
						$scope.isValidDateCoupon = true;
						$scope.coupon = null;
						getCartData();
					} else {
						// Lấy tổng tiền
						$scope.cart = ($window.localStorage.getItem("carts") != null) ? JSON.parse($window.localStorage.getItem("carts")) : [];
						$scope.TotalPrice = 0;
						if ($scope.cart.length > 0) {
							$scope.cart.forEach(function (data) {
								$scope.TotalPrice += (data.salePrice - (data.salePrice * data.offer)) * data.qty;
							});
						}
						// Kiểm tra tổng tiền với đơn giá tối thiểu
						if ($scope.TotalPrice >= $scope.coupon.minSpend) {
							// Tính lại tổng tiền
							if ($scope.TotalPrice > $scope.coupon.value) {
								$scope.TotalPrice -= $scope.coupon.value;
							} else {
								$scope.TotalPrice = 0;
							}
						} else {
							$scope.isValidMinSpendCoupon = true;
							$scope.coupon = null;
							getCartData();
						}
					}
				} else {
					$scope.isValidCoupon = true;
					$scope.coupon = null;
					getCartData();
				}
			}).catch(function (error) {
			});
		} else {
			$scope.isValidCoupon = true;
			$scope.coupon = null;
			getCartData();
		}
	}

	$scope.updateStatusCoupon = function () {
		$scope.isValidCoupon = false;
		$scope.isValidMinSpendCoupon = false;
		$scope.isValidDateCoupon = false;
		$scope.DateCouponError = "";
	};

	$scope.clearCoupon = function () {
		$scope.updateStatusCoupon();

		$scope.coupon = null;
		getCartData();
	};

	// Xử lý event thanh toán
	$scope.checkout = function () {
		if ($scope.orderForm.$valid) {
			// Show loading
			document.getElementById("loading").removeAttribute("hidden");
			// Xử lý logic khi form đã được điền đúng

			// Tạo một đối tượng ngày hiện tại
			var today = new Date();

			if ($scope.paymentMethod === "cod") {
				// thánh toán khi nhận hàng
				// Tạo mã đơn hàng
				var OrderId = today.getTime() + Math.floor(Math.random() * 1000);
				var OrderIdLimited = OrderId.toString().substring(0, 17);

				// Call hàm tạo cod order
				var returnUrl = $scope.baseUrlHere + "/checkoutResult";
				$scope.createOrderOnDB(OrderIdLimited, returnUrl);
			} else if ($scope.paymentMethod === "momo") {
				// thánh toán qua momo
				// Tạo mã đơn hàng
				var OrderId = today.getTime() + Math.floor(Math.random() * 1000);
				var OrderIdLimited = OrderId.toString().substring(0, 17);

				// Tạo data và call hàm tạo momo order
				var returnUrl = $scope.baseUrlHere + "/checkoutResult";
				var totalPrice = $scope.TotalPrice;
				var OrerInfo = "Thanh toán đơn hàng " + OrderIdLimited;
				$scope.createMomoData(OrderIdLimited, returnUrl, totalPrice, OrerInfo);
			} else if ($scope.paymentMethod === "vnpay") {
				// thánh toán qua vnpay
				var totalPrice = $scope.TotalPrice;
				IPService.getIPAddress()
					.then(function (ipAddress) {
						var userIP = ipAddress.data;
						VNPayService.createOrder(totalPrice, userIP.ip).then(function (resp) {
							$scope.vnpay = resp.data;
							// Tìm vị trí của vnp_TxnRef trong chuỗi (Mã hóa đơn)
							var startIndex = $scope.vnpay.url.indexOf("vnp_TxnRef=");

							if (startIndex !== -1) {
								// Cắt chuỗi từ vị trí của vnp_TxnRef
								var substring = $scope.vnpay.url.substring(startIndex);

								// Tìm vị trí của ký tự '&' tiếp theo sau vnp_TxnRef
								var endIndex = substring.indexOf("&");

								if (endIndex !== -1) {
									// Cắt chuỗi từ vị trí của vnp_TxnRef đến vị trí của ký tự '&'
									var vnp_TxnRef = substring.substring(0, endIndex);

									// Lấy giá trị của vnp_TxnRef bằng cách loại bỏ phần prefix "vnp_TxnRef="
									vnp_TxnRef = vnp_TxnRef.replace("vnp_TxnRef=", "");

									// Tạo order trên database
									$scope.createOrderOnDB(vnp_TxnRef, $scope.vnpay.url);
								}
							}
						})
					})
					.catch(function (error) {
						// hidden loading
						document.getElementById("loading").setAttribute("hidden", true);
						ToastService.showshowErrorToast("Thanh toán thất bại!");
					});

			} else if ($scope.paymentMethod === "paypal") {
				// thánh toán qua paypal
				$scope.createPaypalOrder($scope.cart);
			}
		}
	}

	/*Hàm tạo order trên database
		orderId :  String - Mã đơn hàng theo phương thức thanh toán
		returnUrl : String - Link trả về sau khi thanh toán thành công (cổng thanh toán trừ COD)
	*/
	$scope.createOrderOnDB = function (orderId, returnUrl) {
		// Ghép chuỗi địa chỉ nhận hàng
		printResult();
		$scope.form.address = $scope.form.address + ", " + $scope.selectedLocation;

		// Tạo một đối tượng ngày hiện tại
		var today = new Date();

		// Lấy thông tin ngày, tháng, năm
		var year = today.getFullYear();
		var month = (today.getMonth() + 1).toString().padStart(2, '0'); // Tháng trong JavaScript bắt đầu từ 0
		var day = today.getDate().toString().padStart(2, '0');

		// Kết hợp thông tin ngày, tháng, năm thành chuỗi định dạng yêu cầu
		var formattedDate = year + '-' + month + '-' + day;

		// Tạo data cho bảng orderData để gửi về server
		$scope.data = {
			"orderId": orderId,
			"fullname": $scope.form.fullname,
			"createDate": formattedDate,
			"address": $scope.form.address,
			"paymentType": $scope.paymentMethod,
			"shippingFee": 0,
			"couponCode": $scope.coupon ? $scope.coupon.code : null,
			"email": $scope.form.email,
			"phone": $scope.form.phone,
			"orderStatus": "Đang chờ xử lý",
			"paymentStatus": false,
			"note": $scope.form.note ? $scope.form.note : null,
			"totalPrice": $scope.TotalPrice,
			"qty": $scope.cart.length,
			"account": $scope.account
		}

		// Tạo data cho bảng orderDetail để gửi về server
		$scope.dataCart = [];
		$scope.cart.forEach(function (data) {
			$scope.dataCart.push({
				"id": data.id,
				"qty": data.qty
			});
		});

		$scope.requestData = {
			orderData: $scope.data,
			listCartDTO: $scope.dataCart
		};

		// Gọi service để tạo order
		OrderService.createOrder($scope.requestData).then(function (order) {
			$scope.order = order.data;
			if ($scope.order != null) {
				var MailInfo = {
					"to": $scope.order.email,
					"subject": "Thông báo xác nhận đơn hàng " + $scope.order.orderId
				}
				SendMailService.sendMailCheckout($scope.order.orderId, MailInfo).then(function (mailStatus) {
					$window.localStorage.removeItem("carts");
					$window.location.href = returnUrl;
				}).catch(function (error) {
					// hidden loading
					document.getElementById("loading").setAttribute("hidden", true);
					ToastService.showshowErrorToast("Thanh toán thất bại!");
				});
			}
		}).catch(function (error) {
			// hidden loading
			document.getElementById("loading").setAttribute("hidden", true);
			ToastService.showshowErrorToast("Thanh toán thất bại!");
		});
	}

	// $scope.zaloPayData = {
	// 	appUser: "ZaloPayDemo",
	// 	appTime: 1660717311101,
	// 	amount: 10000,
	// 	appTransID: "220817_1660717311101",
	// 	bankCode: "zalopayapp",
	// 	embedData: "{}",
	// 	items: [],
	// 	callbackUrl: "<http://localhost:3000/checkout>",
	// 	description: "ZaloPayDemo - Thanh toán cho đơn hàng #220817_1660717311101",
	// };

	// $scope.createZaloPayData = function () {
	// 	ZaloPayService.createPayment($scope.zaloPayData)
	// 		.then(function (response) {
	// 			// Xử lý kết quả từ API backend
	// 			if (response.data && response.data.return_code === 1) {
	// 				// Giao dịch thành công
	// 				console.log("Payment successful");
	// 			} else {
	// 				// Giao dịch thất bại
	// 				console.log("Payment failed");
	// 			}
	// 		})
	// 		.catch(function (error) {
	// 			// Xử lý lỗi
	// 			console.error("Error:", error);
	// 		});
	// };

	/*Tạo data cho momo
	inpOrderId: String  - Mã hóa đơn momo
	inpReturnUrl : String  - link trả về khi thanh toán
	inpAmount : Double  - tổng tiền của đơn hàng
	inpOrderInfo : String  - Mô tả của đơn hàng
	*/
	$scope.createMomoData = function (inpOrderId, inpReturnUrl, inpAmount, inpOrderInfo) {
		// Thông tin của momo business
		var accessKey = "hglxIRUGLnBd5h50";
		var partnerCode = "MOMOX7V920220806";
		var secretKey = "UMJQIJnOpNPnzQrDtWcRdLYu4oVt4UrV";
		var partnerName = "GamesVH";

		var date = new Date().getTime();

		// Thông tin của đơn hàng
		var requestId = date + "id";
		var orderId = inpOrderId; // Mã hóa đơn
		var autoCapture = true;
		var requestType = "captureWallet";
		var notifyUrl = inpReturnUrl;
		var returnUrl = inpReturnUrl; // thanh toán thành công về đâu
		var amount = inpAmount; // Giá đơn hàng
		var orderInfo = inpOrderInfo; // Thông tin thanh toán
		var extraData = "ew0KImVtYWlsIjogImh1b25neGRAZ21haWwuY29tIg0KfQ==";
		var lang = "vi";

		// Tạo signature
		var signature = "accessKey=" + accessKey + "&amount=" + amount + "&extraData=" + extraData + "&ipnUrl=" + notifyUrl + "&orderId=" + orderId + "&orderInfo=" + orderInfo + "&partnerCode=" + partnerCode + "&redirectUrl=" + returnUrl + "&requestId=" + requestId + "&requestType=" + requestType;
		var hash = CryptoJS.HmacSHA256(signature, secretKey);
		signature = CryptoJS.enc.Hex.stringify(hash);

		// Tạo data gửi về cho server
		var data = {
			"partnerCode": partnerCode,
			"partnerName": partnerName,
			"storeId": partnerCode,
			"requestType": requestType,
			"ipnUrl": notifyUrl,
			"redirectUrl": returnUrl,
			"orderId": orderId,
			"amount": amount,
			"lang": lang,
			"autoCapture": autoCapture,
			"orderInfo": orderInfo,
			"requestId": requestId,
			"extraData": extraData,
			"signature": signature
		}

		// Call API Momo
		MomoService.createOrder(data).then(function (response) {
			$scope.momo = response.data;
			$scope.createOrderOnDB(inpOrderId, $scope.momo.payUrl);
		}).catch(function (error) {
			// hidden loading
			document.getElementById("loading").setAttribute("hidden", true);
			ToastService.showshowErrorToast("Thanh toán thất bại!");
		});
	}

	// Tạo data cho Paypal
	$scope.createPaypalOrder = function (cart) {
		$scope.item = [];
		$scope.totalPricePaypal = 0;

		// Tạo list sản phẩm
		if (cart.length > 0) {
			cart.forEach(function (data) {
				$scope.item.push({
					"name": data.name,
					"description": "",
					"quantity": data.qty,
					"unit_amount": {
						"currency_code": "USD",
						"value": $scope.formatNumberPaypal($scope.vndToUsd((data.salePrice - (data.salePrice * data.offer))))
					}
				});
				$scope.totalPricePaypal += $scope.vndToUsd((data.salePrice - (data.salePrice * data.offer))) * data.qty;
			});
		}

		// Tạo data để gửi cho paypal
		$scope.dataPaypal = {
			"intent": "CAPTURE",
			"purchase_units": [
				{
					"payee": {
						"email_address": "GamesVH@gmail.com",
						"merchant_id": "RX4J9SUKTAE6A"
					},
					"items": $scope.item,
					"amount": {
						"currency_code": "USD",
						"value": $scope.coupon ? $scope.formatNumberPaypal($scope.totalPricePaypal) - $scope.vndToUsd($scope.coupon.value) : $scope.formatNumberPaypal($scope.totalPricePaypal),
						"breakdown": {
							"item_total": {
								"currency_code": "USD",
								"value": $scope.formatNumberPaypal($scope.totalPricePaypal)
							}, "discount": {
								"currency_code": "USD",
								"value": $scope.coupon ? $scope.vndToUsd($scope.coupon.value) : 0
							}
						}
					}
				}
			],
			"application_context": {
				"return_url": $scope.baseUrlHere + "/checkoutResult",
				"cancel_url": $scope.baseUrlHere
			}
		}

		// Call API Paypal
		PaypalService.createPaypalOrder($scope.dataPaypal).then(function (paypal) {
			$scope.paypal = paypal.data;

			// Tạo order trên DB
			$scope.createOrderOnDB($scope.paypal.id, $scope.paypal.links[1].href);
		}).catch(function (error) {
			// hidden loading
			document.getElementById("loading").setAttribute("hidden", true);
			ToastService.showshowErrorToast("Thanh toán thất bại!");
		});
	}

	// Hàm chuyển đổi tiền tệ VND --> USD
	$scope.vndToUsd = function (amountVnd) {
		// Tỷ giá VND sang USD
		var exchangeRate = 0.000042; // Ví dụ: 1 VND = 0.000042 USD

		// Chuyển đổi
		var amountUsd = amountVnd * exchangeRate;

		// Làm tròn đến 2 chữ số thập phân
		amountUsd = amountUsd.toFixed(2);

		return amountUsd;
	};

	// Hàm format Number Decimal
	$scope.formatNumberPaypal = function (number) {
		return Math.round(number * 100) / 100;
	}


	// API Location
	$scope.getLocation = function (api, scopeVariable) {
		$http.get(api)
			.then(function (response) {
				angular.copy(response.data, scopeVariable);
			})
	};

	$scope.callApiGetAll = function (api) {
		$http.get(api)
			.then(function (response) {
				$scope.provinces = response.data;
			}).catch(function (error) { });
	};

	$scope.callApiGetAll(hostLocation + "?depth=1");

	$scope.callApiDistrict = function (api) {
		$http.get(api)
			.then(function (response) {
				$scope.districts = response.data.districts;
			}).catch(function (error) { });;
	};

	$scope.callApiWard = function (api) {
		$http.get(api)
			.then(function (response) {
				$scope.wards = response.data.wards;
			}).catch(function (error) { });;
	};

	$scope.updateProvince = function () {
		provinceId = $scope.form.province;
		// Gọi hàm để lấy dữ liệu quận/huyện của thành phố đã chọn
		$scope.callApiDistrict(hostLocation + "p/" + provinceId + "?depth=2");
		printResult();
		$scope.selectedDistrict = true;
		$scope.selectedWard = false;
		$scope.form.district = null;
		$scope.form.ward = null;
	};

	$scope.updateDistrict = function () {
		districtId = $scope.form.district
		// Gọi hàm để lấy dữ liệu Xã/Phường của quận/huyện đã chọn
		$scope.callApiWard(hostLocation + "d/" + districtId + "?depth=2");
		printResult();
		$scope.selectedWard = true;
	};

	$scope.updateWard = function () {
		wardId = $scope.form.ward
		printResult();
	};

	$scope.updateLocation = function () {
		$scope.selectedDistrict = true;
		$scope.selectedWard = true;

		// Gọi API để lấy danh sách tỉnh/thành phố
		$scope.callApiGetAll(hostLocation);
		// Gọi API để lấy danh sách quận/huyện
		$scope.getLocation(hostLocation + "d/", $scope.districts);
		// Gọi API để lấy danh sách xã/phường
		$scope.getLocation(hostLocation + "w/", $scope.wards);
	}

	var printResult = () => {
		if (provinceId != "" && districtId != "" && wardId != "") {
			let result = $("#ward option:selected").text() + ", " + $("#district option:selected").text() + ", " + $("#province option:selected").text();
			$scope.selectedLocation = result;
		}
	}
});
