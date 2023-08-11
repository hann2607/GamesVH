app.controller("ProductController", function(ProductAdminService, ToastService, $http, $scope,
    $compile, $filter, $timeout) {

    $scope.product = {}; // Thông tin sản phẩm sẽ được hiển thị trên trang chi tiết

    $scope.categories = [];
    $scope.feedback = [];

    //Modal edit
    $scope.posterEdit = {}; // Poster form Edit
    $scope.thumbnails = []; // array thumbnail edit
    $scope.editProduct = {};

    //Modal add
    $scope.editMode = false; // Mặc định là chế độ "Add"
    $scope.thumbnailsList = []; // array thumbnail add
    $scope.addProductForm = {};
    $scope.addProductForm.available = "true";

    $scope.temProduct = {};


    /*----GET DATA CATEGORY----*/
    // Lấy danh sách category
    ProductAdminService.getAllCategories()
        .then(function(response) {
            $scope.categories = response.data;
        })
        .catch(function(error) {
            console.error('Lỗi khi lấy danh sách category:', error);
        });
    /*----GET DATA CATEGORY----*/

    /*----LOAD DATA TABLE FEEDBACK----*/
    $scope.getFeedbackForProduct = function(productId) {
        ProductAdminService.getFeedbackProduct(productId)
            .then(function(response) {
                $scope.feedback = response.data;
                $('#comment_Product').modal('show');
                $scope.loadProductFeedback();
            })
            .catch(function(error) {
                console.error('Lỗi khi lấy danh sách phản hồi:', error);
            });
    };


    $scope.loadProductFeedback = function() {
        var feedbackTableBody = $('#feedbackTableBody');
        feedbackTableBody.empty();

        $scope.feedback.forEach(function(feedback) {

            var starIcons = '';
            for (var i = 1; i <= 5; i++) {
                starIcons += '<span class="fa fa-star' + (feedback.star >= i ? ' checked' : '') + '"></span>';
            }

            var feedbackRow = '<tr>' +
                '<td>' + feedback.id + '</td>' +
                '<td>' + feedback.account.username + '</td>' +
                '<td class="d-flex text-wrap">' + feedback.content + '</td>' +
                '<td>' + starIcons + '</td>' +
                '<td>' + feedback.createDate + '</td>' +
                '<td>' +
                '<div class="dropdown action-label">' +
                '<a class="btn btn-white btn-sm btn-rounded dropdown-toggle" href="#" data-toggle="dropdown" aria-expanded="false">' +
                '<i class="fa fa-dot-circle-o text-' + (feedback.status ? 'success' : 'danger') + '"></i> ' +
                (feedback.status ? 'Đã Duyệt' : 'Chưa Duyệt') +
                '</a>' +
                '<div class="dropdown-menu">' +
                '<a class="dropdown-item" href="#" ng-click="updateFeedbackStatus(' + feedback.id + ',' + feedback.product.id + ',1)"><i class="fa fa-dot-circle-o text-success"></i>Đã Duyệt</a>' +
                '<a class="dropdown-item" href="#" ng-click="updateFeedbackStatus(' + feedback.id + ',' + feedback.product.id + ',0)"><i class="fa fa-dot-circle-o text-danger"></i>Chưa Duyệt</a>' +
                '</div>' +
                '</div>' +
                '</td>' +
                '<td class="text-right">' +
                '<div class=" text-right">' +
                '<button href="#" ng-click="deleteFeedback(' + feedback.id + ',' + feedback.product.id + ')" data-toggle="modal" data-target="#delete_comment" class="border btn-danger">Xóa</button>' +
                '</div>' +
                '</td>' +
                '</tr>';
            // Thêm feedbackRow vào feedbackTableBody
            feedbackTableBody.append(feedbackRow);

            // Biên dịch các sự kiện ng-click trong feedbackRow
            var rowElement = feedbackTableBody.find('tr:last-child');
            $compile(rowElement)($scope);
        });
    };
    /*----END LOAD DATA TABLE FEEDBACK----*/


    /*----UPDATE FEEDBACK----*/
    $scope.updateFeedbackStatus = function(feedbackId, productId, status) {
        // Gọi phương thức trong Service để cập nhật trạng thái feedback
        ProductAdminService.updateFeedbackStatus(feedbackId, status)
            .then(function(response) {
                console.log("Feedback đã được cập nhật:", response.data);
                ToastService.showSuccessToast("Cập Nhập Trạng Thái Đánh Giá Thành Công!");
                $scope.getFeedbackForProduct(productId);
            })
            .catch(function(error) {
                console.error("Lỗi khi cập nhật feedback:", error);
            });
    };
    /*----END UPDATE FEEDBACK----*/

    /*----DELETE FEEDBACK----*/
    $scope.deleteFeedback = function(feedbackId, productId) {
        ProductAdminService.deleteFeedbackById(feedbackId)
            .then(function(resp) {
                // Xử lý thành công, data chứa dữ liệu thành công từ service
                ToastService.showSuccessToast("Xóa Đánh Giá Thành Công!");
                $scope.getFeedbackForProduct(productId);
            })
            .catch(function(error) {
                // Xử lý lỗi, error chứa dữ liệu lỗi từ service
            });
    };
    /*----END DELETE FEEDBACK----*/


    /*----LOAD DATA TABLE PRODUCT----*/
    // Lấy tất cả sản phẩm
    $scope.getAllProducts = function() {
        ProductAdminService.getAllProducts().then(function(response) {
            $scope.product = response.data;
            $scope.temProduct = $scope.product;
            // Kiểm tra nếu có search thì sẽ fill data dạng search
            var selectElement = document.getElementById("searchTitle").value;
            var searchName = document.getElementById("productNameSearch").value.toLowerCase();
            var searchCreateDate = document.getElementById("searchCreateDate").value;
            console.log(selectElement || searchName)
                // if (selectElement || searchName) {
                //     $scope.searchProduct();
                // }

            $(document).ready(function() {
                $scope.loadDataTableProduct($scope.product);
            });
        }).catch(function(error) {
            console.error('Lỗi khi lấy danh sách sản phẩm:', error);
        });
    }
    $scope.getAllProducts();

    $scope.loadDataTableProduct = function(products) {
            var table = $('#tableProduct');


            if ($.fn.DataTable.isDataTable(table)) {
                table.DataTable().destroy();
            }

            table.DataTable({
                searching: false,
                "language": {
                    "lengthMenu": "Hiển thị _MENU_ hàng",
                    "info": "Hiển thị từ _START_ đến _END_ trên tổng số _TOTAL_ hàng",
                    "paginate": {
                        "first": "Đầu",
                        "previous": "Trước",
                        "next": "Tiếp",
                        "last": "Cuối"
                    },
                    "emptyTable": "Không có dữ liệu"
                },
                data: products, // Dữ liệu được truyền vào DataTables
                columns: [{
                        data: null,
                        render: function(data, type, row, meta) {
                            // Render giao diện cho cột "#"
                            // return meta.row + 1;
                            return row.id;
                        }
                    },
                    {
                        data: null, // Cột "Poster"
                        render: function(data, type, row) {
                            // Render giao diện cho cột "Poster"
                            var posterUrl = row.poster ? row.poster : '1xbZ557bXhtiEG-sPP4TRXf007THuPsns';
                            var imageUrl = 'https://drive.google.com/uc?id=' + posterUrl;
                            return '<h2 class="table-poster"><a href="#" class="poster"><img alt="" src="' + imageUrl + '" data-zoom-image="' + imageUrl + '" alt="product image"></a></h2>';
                        }

                    },
                    {
                        data: null, // Cột "Name"
                        render: function(data, type, row) {
                            // Render giao diện cho cột "Name"
                            return '<td><a href="#" class="text-dark" data-toggle="modal" data-target="#edit_Product">' + row.name + '</a></td>';
                        }
                    },
                    { data: 'originPrice', render: function(data) { return $filter('vndFormat')(data); } }, // Cột "Origin Price"
                    { data: 'salePrice', render: function(data) { return $filter('vndFormat')(data); } }, // Cột "Sale Price"
                    { data: 'offer', render: function(data) { return (data * 100) + "%"; } }, // Cột "Offer"
                    { data: 'source' }, // Cột "Source"
                    {
                        data: 'createDate', // Cột "Created Date"
                        render: function(data, type, row) {
                            // Sử dụng filter date để định dạng lại giá trị ngày tạo
                            var formattedCreateDate = $filter('date')(row.createDate, 'dd/MM/yyyy');
                            return formattedCreateDate;
                        }
                    },
                    { data: 'type' }, // Cột "Type"
                    { data: 'qty' }, // Cột "Qty"
                    {
                        data: null, // Cột "Action"
                        // render: function(data, type, row) {
                        //     // Render giao diện cho cột "Action"
                        //     return '<div class="dropdown dropdown-action"><a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false"><i class="material-icons font-weight-bold">⋮</i></a><div class="dropdown-menu dropdown-menu-right"><a class="dropdown-item" href="#" ng-click="editProductClicked(' + row.id + ')" data-toggle="modal" data-target="#edit_Product"><i class="fa fa-pencil m-r-5"></i>Edit</a><a class="dropdown-item" href="#" data-toggle="modal" data-target="#delete_Product"><i class="fa fa-trash-o m-r-5"></i>Delete</a><a class="dropdown-item" href="#" data-toggle="modal" data-target="#comment_Product"><i class="fa fa-pencil-square-o m-r-5"></i>Comment</a></div></div>';
                        // }

                        render: function(data, type, row) {
                            // Render giao diện cho cột "Action"
                            return '<div class="dropdown dropdown-action text-center">' +
                                '<a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false">' +
                                '<i class="material-icons font-weight-bold">⋮</i>' +
                                '</a>' +
                                '<div class="dropdown-menu dropdown-menu-right">' +
                                '<a class="dropdown-item edit-product" href="#" data-product-id="' + row.id + '" data-toggle="modal" data-target="#edit_Product">' +
                                '<i class="fa fa-pencil m-r-5"></i>Chỉnh Sửa' +
                                '</a>' +
                                // Call the loadProductFeedback function with the product ID
                                '<a class="dropdown-item view-feedback" href="#" data-product-id="' + row.id + '" data-toggle="modal" data-target="#comment_Product">' +
                                '<i class="fa fa-pencil-square-o m-r-5"></i>Đánh Giá' +
                                '</a>' +
                                '</div>' +
                                '</div>';
                        }

                    }
                ]
            });
            // Thêm sự kiện click vào phần tử chỉnh sửa
            $(document).on('click', '.edit-product', function() {
                var productId = $(this)[0].dataset.productId;
                $scope.editProductClicked(productId);
            });
            $(document).on('click', '.view-feedback', function() {
                var productId = $(this)[0].dataset.productId;
                $scope.getFeedbackForProduct(productId);
            });

        }
        /*----END LOAD DATA TABLE PRODUCT----*/

    /*----ERROR FORM EDIT----*/
    $scope.typeEdit = function() {
        $scope.isValidTypeFormEdit = false;
    }

    $scope.categoryEdit = function() {
            $scope.isValidCategoryFormEdit = false;
        }
        /*----END ERROR FORM EDIT----*/

    /*----UPDATE PRODUCT----*/
    // Hàm xử lý khi nhấp vào nút "Edit" trong cột "Action"
    $scope.editProductClicked = function(productId) {
        ProductAdminService.getProduct(productId)
            .then(function(response) {
                $scope.editProduct = response.data;
                $scope.thumbnails = extractThumbnails($scope.editProduct.thumbnail);
                $scope.posterEdit = {
                    href: "https://drive.google.com/uc?id=",
                    key: $scope.editProduct.poster,
                    file: ""
                }
                $('#edit_Product').modal('show');
                if ($scope.editProduct.available) {
                    $scope.editProduct.available = "true";
                } else {
                    $scope.editProduct.available = "false";
                }
            })
            .catch(function(error) {
                console.error('Lỗi khi lấy thông tin sản phẩm:', error);
            });
    };

    // Gắn kết sự kiện click cho các phần tử chỉnh sửa
    angular.element(document).on('click', '.edit-product', function() {
        var productId = angular.element(this).data('product-id');
        $scope.editProductClicked(productId);
    });

    $scope.updateProduct = function(productId) {
        if ($scope.formEditProduct.$valid) {
            var result = $scope.product.filter(function(item) {
                var productName = item.name.toLowerCase(); // Chuyển giá trị thuộc tính title thành chữ thường
                var tempProductId = item.id;
                return productName == $scope.editProduct.name.toLowerCase() && tempProductId != productId;
            });
            if (result.length == 0) {
                ToastService.showInfoToast("Đang xử lý!", "Xin vui lòng đợi trong giây lát!");
                $scope.categories.forEach(function(category) {
                    if ($scope.editProduct.category.id == category.id) {
                        $scope.editProduct.category = category;
                    }
                });
                // Chuyển đổi offer về Float
                $scope.editProduct.offer = parseFloat($scope.editProduct.offer);

                // Chuyển đổi available về Boolean
                $scope.editProduct.available = $scope.editProduct.available === "true";

                // Khởi tạo status = true
                $scope.editProduct.status = true;

                console.log($scope.editProduct)

                // Gán lại key image cho product 
                ProductAdminService.getProduct(productId)
                    .then(function(product) {
                        $scope.editProduct.thumbnail = product.data.thumbnail;
                        $scope.editProduct.poster = product.data.poster;
                        // Update product với poster và thumbnail key mới
                        ProductAdminService.updateProduct($scope.editProduct)
                            .then(function(response) {
                                productResult = response.data;
                                if ($scope.posterEdit.file) {
                                    var formData = new FormData();
                                    var modifiedFileName = productResult.id + "-poster";
                                    formData.append('image', $scope.posterEdit.file, modifiedFileName);
                                    // Upload poster
                                    ProductAdminService.uploadImage(formData)
                                        .then(function(poster) {
                                            for (let i = 0; i <= $scope.thumbnails.length; i++) {
                                                if (i == $scope.thumbnails.length) {
                                                    $('#edit_Product').modal('hide');
                                                    ToastService.showSuccessToast("Cập nhập thông tin sản phẩm thành công!");

                                                    $scope.getAllProducts();
                                                    break;
                                                }
                                                var thumbnail = $scope.thumbnails[i];
                                                if (thumbnail.file) {
                                                    var formDataThumb = new FormData();
                                                    var modifiedFileNameThumb = productResult.id + "-thumb" + i;
                                                    formDataThumb.append('image', thumbnail.file, modifiedFileNameThumb);
                                                    ProductAdminService.uploadImage(formDataThumb)
                                                        .then(function(thumb) {})
                                                        .catch(function(error) {});
                                                }
                                            }
                                        })
                                        .catch(function(error) {
                                            ToastService.showErrorToast("Tải ảnh thu nhỏ không thành công!");
                                        });
                                } else {
                                    for (let i = 0; i <= $scope.thumbnails.length; i++) {
                                        if (i == $scope.thumbnails.length) {
                                            $('#edit_Product').modal('hide');
                                            ToastService.showSuccessToast("Cập nhập thông tin sản phẩm thành công!");

                                            $scope.getAllProducts();
                                            break;
                                        }
                                        var thumbnail = $scope.thumbnails[i];
                                        if (thumbnail.file) {
                                            var formDataThumb = new FormData();
                                            var modifiedFileNameThumb = productResult.id + "-thumb" + i;
                                            formDataThumb.append('image', thumbnail.file, modifiedFileNameThumb);
                                            ProductAdminService.uploadImage(formDataThumb)
                                                .then(function(thumb) {})
                                                .catch(function(error) {});
                                        }
                                    }
                                }
                            })
                            .catch(function(error) {
                                ToastService.showErrorToast("Cập nhập thông tin sản phẩm không thành công!");
                            });
                    })
                    .catch(function(error) {
                        ToastService.showErrorToast("Cập nhập thông tin sản phẩm không thành công!");
                    });
            } else {
                ToastService.showErrorToast("Tên sản phẩm đã tồn tại!");
            }
        } else {
            if (!$scope.editProduct.type || $scope.editProduct.type == "") {
                $scope.isValidTypeFormEdit = true;
            }

            if (!$scope.editProduct.category || !$scope.editProduct.category.id) {
                $scope.isValidCategoryFormEdit = true;
            }
        }
    }

    /*----END UPDATE PRODUCT----*/

    /*----ERROR FORM ADD----*/
    $scope.typeAdd = function() {
        $scope.isValidTypeFormAdd = false;
    }

    $scope.categoryAdd = function() {
            $scope.isValidCategoryFormAdd = false;
        }
        /*----END ERROR FORM ADD----*/

    /*----ADD PRODUCT----*/
    $scope.addProduct = function() {
        if ($scope.formAddProduct.$valid) {
            if ($scope.product.poster) {
                if ($scope.thumbnailsList.length < 3) {
                    ToastService.showErrorToast("Vui lòng chọn 3 hình thu nhỏ!");
                } else {
                    var result = $scope.product.filter(function(item) {
                        var productName = item.name.toLowerCase(); // Chuyển giá trị thuộc tính title thành chữ thường
                        return productName == $scope.addProductForm.name.toLowerCase();
                    });
                    if (result.length == 0) {
                        ToastService.showInfoToast("Đang xử lý!", "Xin vui lòng đợi trong giây lát!");
                        $scope.categories.forEach(function(category) {
                            if ($scope.addProductForm.category.id == category.id) {
                                $scope.addProductForm.category = category;
                            }
                        });
                        // Chuyển đổi offer về Float
                        $scope.addProductForm.offer = parseFloat($scope.addProductForm.offer);

                        // Chuyển đổi available về Boolean
                        $scope.addProductForm.available = $scope.addProductForm.available === "true";

                        // Khởi tạo status = true
                        $scope.addProductForm.status = true;

                        // Lấy ngày hiện tại
                        var currentDate = new Date();

                        // Lấy giá trị ngày, tháng, năm
                        var year = currentDate.getFullYear();
                        var month = String(currentDate.getMonth() + 1).padStart(2, '0'); // Tháng bắt đầu từ 0, nên cộng thêm 1 và định dạng số thành chuỗi
                        var day = String(currentDate.getDate()).padStart(2, '0');

                        // Tạo chuỗi ngày tháng dạng "YYYY-MM-DD"
                        var formattedDate = year + '-' + month + '-' + day;

                        // Khởi tạo createDate bằng ngày hiện tại
                        $scope.addProductForm.createDate = formattedDate;

                        $scope.addProductForm.poster = generateRandomString(14);
                        $scope.addProductForm.thumbnail = generateRandomString(14);

                        // Add product
                        ProductAdminService.createProduct($scope.addProductForm)
                            .then(function(product) {
                                var productResult = product.data;
                                if (productResult) {
                                    var formData = new FormData();
                                    var modifiedFileName = productResult.id + "-poster";
                                    formData.append('image', $scope.product.poster, modifiedFileName);
                                    // Upload poster
                                    ProductAdminService.uploadImage(formData)
                                        .then(function(poster) {
                                            var posterResult = poster.data.fileId;
                                            productResult.poster = posterResult;
                                            var thumbnailKey = "";
                                            var index = 0;
                                            for (let i = 0; i <= $scope.thumbnailsList.length; i++) {
                                                // Upload thumbnail
                                                if (i == $scope.thumbnailsList.length) {
                                                    $scope.getAllProducts();
                                                    // Load lại data table
                                                    $scope.resetForm();
                                                    $('#add_Product').modal('hide');
                                                    ToastService.showSuccessToast("Thêm sản phẩm thành công!");
                                                } else {
                                                    var length = $scope.thumbnailsList.length;
                                                    var thumbnail = $scope.thumbnailsList[i];
                                                    var formDataThumb = new FormData();
                                                    var modifiedFileNameThumb = productResult.id + "-thumb" + i;
                                                    formDataThumb.append('image', thumbnail, modifiedFileNameThumb);
                                                    ProductAdminService.uploadImage(formDataThumb)
                                                        .then(function(thumb) {
                                                            var thumbResult = thumb.data.fileId;
                                                            if (index == length - 1) {
                                                                thumbnailKey += thumbResult;
                                                            } else {
                                                                thumbnailKey += thumbResult + "***";
                                                            }
                                                            index++;
                                                            productResult.thumbnail = thumbnailKey;
                                                            // Update product với poster và thumbnail key mới
                                                            ProductAdminService.updateProduct(productResult)
                                                                .then(function(response) {
                                                                    $scope.getAllProducts();
                                                                })
                                                                .catch(function(error) {});
                                                        })
                                                        .catch(function(error) {});
                                                }
                                            }
                                        })
                                        .catch(function(error) {
                                            ToastService.showErrorToast("Tải ảnh áp phích thất bại!");
                                        });
                                } else {
                                    ToastService.showErrorToast("Thêm sản phẩm thất bại!");
                                }
                            })
                            .catch(function(error) {
                                ToastService.showErrorToast("Thêm sản phẩm thất bại!");
                            });
                    } else {
                        ToastService.showErrorToast("Tên sản phẩm đã tồn tại!");
                    }
                }
            } else {
                ToastService.showErrorToast("Vui lòng chọn hình ảnh áp phích!");
            }
        } else {
            if (!$scope.addProductForm.type || $scope.addProductForm.type == "") {
                $scope.isValidTypeFormAdd = true;
            }

            if (!$scope.addProductForm.category || !$scope.addProductForm.category.id) {
                $scope.isValidCategoryFormAdd = true;
            }
        }
    };

    $scope.callClearThumbnailsInDirective = function() {
        var dropzoneDirectiveScope = angular.element(document.querySelector('dropzone')).scope();
        if (dropzoneDirectiveScope && typeof dropzoneDirectiveScope.clearThumbnails === 'function') {
            dropzoneDirectiveScope.clearThumbnails();
        }
    };

    $scope.resetForm = function() {
        // Reset giá trị của biến addProductForm thành một object rỗng hoặc giá trị mặc định
        $scope.addProductForm = {};

        // Reset giá trị của biến Available 
        $scope.addProductForm.available = "true";

        // Set trạng thái pristine của form về true
        $scope.formAddProduct.$setPristine();

        // Set trạng thái Untouched của form về true
        $scope.formAddProduct.$setUntouched();

        // Clear poster image
        var dropifPreviews = document.getElementsByClassName('dropify-preview');
        // Lặp qua từng phần tử và xóa class "dropify-preview"
        for (var i = 0; i < dropifPreviews.length; i++) {
            dropifPreviews[i].style.display = "none";
        }

        // Tìm các phần tử có class "dropify-wrapper"
        var dropifyWrappers = document.querySelectorAll('.dropify-wrapper');

        // Lặp qua từng phần tử và xóa class "has-preview"
        for (var i = 0; i < dropifyWrappers.length; i++) {
            dropifyWrappers[i].classList.remove('has-preview');
        }

        $scope.product.poster = "";

        // Clear thumbnail
        var refreshThumbButton = document.getElementById("refreshThumbnail");
        refreshThumbButton.click();
    };


    function generateRandomString(length) {
        const characters = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
        let result = '';
        const charactersLength = characters.length;
        for (let i = 0; i < length; i++) {
            result += characters.charAt(Math.floor(Math.random() * charactersLength));
        }
        return result;
    }

    // Gán sự kiện khi thay đổi poster thì lấy file ra
    document.getElementById("posterImage").addEventListener("change", function(event) {
        var selectedFile = event.target.files[0];

        if (selectedFile) {
            $scope.product.poster = selectedFile;
        }
    });
    /*----END ADD PRODUCT----*/

    /*----SEARCH----*/
    $scope.searchProduct = function() {
        var selectElement = document.getElementById("searchTitle").value;
        var searchName = document.getElementById("productNameSearch").value.toLowerCase();
        var searchCreateDate = document.getElementById("searchCreateDate").value;
        $scope.product = $scope.temProduct;


        if (selectElement) {
            var result = $scope.product.filter(function(item) {
                var ProductType = item.type; // Chuyển giá trị thuộc tính title thành chữ thường
                return ProductType.indexOf(selectElement) !== -1;
            });
            $scope.product = result;
        }

        if (searchCreateDate) {
            searchCreateDate = convertDateFormat(searchCreateDate);
            console.log(searchCreateDate)
            var result = $scope.product.filter(function(item) {
                var createDate = item.createDate;
                console.log(createDate)
                return createDate.indexOf(searchCreateDate) !== -1;
            });
            $scope.product = result;
        }

        if (searchName) {
            var result = $scope.product.filter(function(item) {
                var ProductName = item.name.toLowerCase(); // Chuyển giá trị thuộc tính user created thành chữ thường
                return ProductName.indexOf(searchName) !== -1;
            });
            $scope.product = result;
        }


        $(document).ready(function() {
            $scope.loadDataTableProduct($scope.product);
        });
    }

    $scope.searchWithEnter = function(event) {
        if (event.keyCode === 13) {
            $scope.searchProduct();
        }
    }


    $scope.refreshSearch = function() {
        document.getElementById("searchTitle").value = "";
        document.getElementById("productNameSearch").value = "";
        document.getElementById("searchCreateDate").value = "";

        $scope.getAllProducts();
        $scope.loadDataTableProduct($scope.product)
    }

    function convertDateFormat(inputDate) {
        // Tách ngày, tháng, năm từ chuỗi đầu vào
        const dateParts = inputDate.split('/');
        const day = dateParts[0];
        const month = dateParts[1];
        const year = dateParts[2];

        // Ghép lại thành dạng ngày/tháng/năm mới
        const newDateFormat = `${year}-${month}-${day}`;

        return newDateFormat;
    }
    /*----END SEARCH----*/


    /*----IMAGE----*/
    // Hàm để trích xuất các thumbnail từ chuỗi productThumbnail
    function extractThumbnails(productThumbnail) {
        if (!productThumbnail) return [];
        const thumbnailsExtract = productThumbnail.split("***");
        const thumbnails = [];
        if (thumbnailsExtract.length > 0) {
            for (let i = 0; i < thumbnailsExtract.length; i++) {
                var jsonImg = {
                    href: "https://drive.google.com/uc?id=",
                    key: thumbnailsExtract[i],
                    file: ""
                }
                thumbnails.push(jsonImg);
            }
        }
        return thumbnails;
    }

    // Hàm xử lý sự kiện khi click vào nút "upload-button".
    $scope.handleUploadClick = function(index) {
        // Lấy ra input file-upload thông qua ID.
        var fileInput;
        if (index || index == 0) {
            fileInput = document.getElementById('thumbnail' + index);
        } else {
            fileInput = document.getElementById('fileInput');
        }
        fileInput.addEventListener('change', function() {
            // Lấy danh sách các file đã chọn từ input file-upload.
            var selectedFiles = this.files;
            if (selectedFiles.length > 0) {
                // Lấy file đầu tiên trong danh sách (vì input file-upload cho phép multiple selection).
                var selectedFile = selectedFiles[0];

                // Tạo một đường dẫn tạm thời cho ảnh từ file đã chọn.
                var tempPhotoUrl = URL.createObjectURL(selectedFile);
                $scope.$apply(function() {
                    // Cập nhật đường dẫn mới vào biến "currentPhotoUrl" để thay đổi ảnh hiển thị.
                    if (index || index == 0) {
                        $scope.thumbnails[index].href = "";
                        $scope.thumbnails[index].key = tempPhotoUrl;
                        $scope.thumbnails[index].file = selectedFile;
                    } else {
                        $scope.posterEdit = {
                            href: "",
                            key: tempPhotoUrl,
                            file: selectedFile
                        }
                    }
                });
            }
        });
        // Khi click vào nút "upload-button", kích hoạt sự kiện click cho input file-upload.
        fileInput.click();
    };
    /*----END IMAGE----*/

    /*----EXPORT REPORT----*/
    $scope.downloadExcel = function() {
        $http({
            url: host + '/api/product/downloadExcel', // Địa chỉ API endpoint của Spring Boot backend
            method: 'GET',
            responseType: 'arraybuffer'
        }).then(function(response) {
            var blob = new Blob([response.data], { type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet' });
            var url = window.URL.createObjectURL(blob);
            var a = document.createElement('a');
            a.href = url;
            // Lấy ngày hiện tại và định dạng
            var currentDate = new Date();
            var formattedDate = currentDate.getFullYear() + '-' + (currentDate.getMonth() + 1) + '-' + currentDate.getDate();

            a.download = 'ReportSanpham_' + formattedDate + '.xlsx';
            a.click();
            window.URL.revokeObjectURL(url);
        }, function(error) {
            console.error('Lỗi khi tải xuống tệp Excel:', error);
        });
    };
    /*----END EXPORT REPORT----*/


}).filter('vndFormat', function() {
    // Filter định dạng tiền tệ
    return function(input) {
        if (!input) return '';
        var number = parseFloat(input);
        if (isNaN(number)) return input;
        var formattedNumber = number.toLocaleString('vi-VN');
        formattedNumber += ' VND';
        return formattedNumber;
    };
}).filter('dateFormat', function() {
    // Filter định dạng ngày tháng năm
    return function(dateString) {
        var date = new Date(dateString);
        var day = date.getDate();
        var month = date.getMonth() + 1;
        var year = date.getFullYear();
        day = (day < 10) ? '0' + day : day;
        month = (month < 10) ? '0' + month : month;
        var formattedDate = day + '/' + month + '/' + year;
        return formattedDate;
    };
});