app.controller('BlogController', BlogController);
function BlogController($scope, $filter, $document, $window, BlogService, ToastService) {

    $scope.blogs = [];
    $scope.comments = [];
    $scope.submitButtonText = "Thêm";
    $scope.blogData = {
        username: $scope.username = $window.localStorage.getItem("username") || $window.sessionStorage.getItem("username"),
        image: null
    };
    $scope.tempBlogs = [];

    // Khởi tạo biến để lưu trữ tạm
    $scope.blogIdToDelete = null;


    $scope.getDataBlog = function () {
        BlogService.getAllBlog()
            .then(function (resp) {
                $scope.blogs = resp.data;
                $scope.tempBlogs = $scope.blogs;

                // Kiểm tra nếu có search thì sẽ fill data dạng search
                var searchTitle = document.getElementById("searchTitle").value.toLowerCase();
                var searchUsername = document.getElementById("searchUsername").value.toLowerCase();
                var searchCreateDate = document.getElementById("searchCreateDate").value;
                if (searchTitle || searchUsername || searchCreateDate) {
                    $scope.searchBlog();
                }
                $(document).ready(function () {
                    $scope.loadDataTableBlog($scope.blogs);
                });
            })
            .catch(function (error) {
                console.error("Lỗi khi lấy danh sách bài viết:", error);
            });
    };
    $scope.getDataBlog();

    $scope.loadDataTableBlog = function (blogs) {
        var table = $('#tableBlog');

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
            data: blogs, // Dữ liệu được truyền vào DataTables
            columns: [
                {
                    data: null,
                    render: function (data, type, row, meta) {
                        // Render giao diện cho cột "#"
                        return meta.row + 1;
                    }
                },
                {
                    data: 'title', // Chỉnh lại thành 'tittle' để đúng với key trong dữ liệu
                    render: function (data, type, row) {
                        // Kiểm tra nếu tiêu đề dài hơn 52 ký tự, thì hiển thị chỉ 52 ký tự và thêm dấu '...'
                        var maxLength = 52;
                        var trimmedTitle = data.length > maxLength ? data.substring(0, maxLength) + '...' : data;
                        return trimmedTitle;
                    }
                }, // Cột "Tittle"
                { data: 'username', class: 'text-center' }, // Cột "Contract ID"
                {
                    data: 'createDate', class: 'text-center', // Cột "createDate"
                    render: function (data, type, row) {
                        // Sử dụng filter date để định dạng lại giá trị
                        var fmtCreateDate = $filter('date')(row.createDate, 'dd/MM/yyyy');
                        return fmtCreateDate;
                    }
                }, // Cột "createDate"
                {
                    data: 'status', class: 'text-center', // Chỉnh lại thành 'status' để đúng với key trong dữ liệu
                    render: function (data, type, row) {
                        // Kiểm tra giá trị của status và hiển thị thích hợp
                        if (data === 1) {
                            return '<span class="badge bg-inverse-success">Public</span>';
                        } else {
                            return '<span class="badge bg-inverse-danger">Private</span>';
                        }
                    }
                }, // Cột "Status"
                { data: 'commentCount', class: 'text-center' },
                {
                    data: null,
                    class: 'text-center',
                    render: function (data, type, row) {
                        var commentButton = (row.commentCount !== 0) ? '<a class="dropdown-item" id="comment-blog" data-blog-id="' + row.id + '" data-blog-title="' + row.title + '"><i class="fa fa-comments" aria-hidden="true"></i> Bình Luận</a>' : '';
                        return '<div class="dropdown dropdown-action">' +
                            '<a href="#" class="action-icon dropdown-toggle" data-toggle="dropdown" aria-expanded="false">' +
                            '<i class="material-icons font-weight-bold">⋮</i></a>' +
                            '<div class="dropdown-menu dropdown-menu-right">' +
                            '<a class="dropdown-item" id="edit-blog" data-toggle="modal" data-target="#edit_Blog" data-blog-id="' + row.id + '"><i class="fa fa-pencil-square-o" aria-hidden="true"></i>Chỉnh Sửa</a>' +
                            '<a class="dropdown-item" id="delete-blog" data-toggle="modal" data-target="#delete_Blog" data-blog-id="' + row.id + '"><i class="fa fa-trash" aria-hidden="true"></i>Xóa</a>' +
                            commentButton +
                            '</div></div>';
                    }
                }
            ]
        });
        // Gắn trình xử lý sự kiện click vào phần tử chỉnh sửa
        $(document).on('click', '#edit-blog', function () {
            var blogId = $(this).data('blog-id');
            $scope.getBlogById(blogId);
        });
        $(document).on('click', '#delete-blog', function () {
            var blogId = $(this).data('blog-id');
            $scope.selectBlogtoDelete(blogId);
        });
        $(document).on('click', '#comment-blog', function () {
            var blogId = $(this).data('blog-id');
            var blogTitle = $(this).data('blog-title');
            $scope.titleModelComment = blogTitle;
            $scope.getCommentByBlogId(blogId);
        });
    };

    $scope.searchBlog = function () {
        var searchTitle = document.getElementById("searchTitle").value.toLowerCase();
        var searchUsername = document.getElementById("searchUsername").value.toLowerCase();
        var searchCreateDate = document.getElementById("searchCreateDate").value;

        $scope.blogs = $scope.tempBlogs;

        if (searchTitle) {
            var result = $scope.blogs.filter(function (item) {
                var blogTitle = item.title.toLowerCase(); // Chuyển giá trị thuộc tính title thành chữ thường
                return blogTitle.indexOf(searchTitle) !== -1;
            });
            $scope.blogs = result;
        }

        if (searchUsername) {
            var result = $scope.blogs.filter(function (item) {
                var userCreated = item.username.toLowerCase(); // Chuyển giá trị thuộc tính user created thành chữ thường
                return userCreated.indexOf(searchUsername) !== -1;
            });
            $scope.blogs = result;
        }

        if (searchCreateDate) {
            searchCreateDate = convertDateFormat(searchCreateDate);
            var result = $scope.blogs.filter(function (item) {
                var createDate = item.createDate;
                return createDate.indexOf(searchCreateDate) !== -1;
            });
            $scope.blogs = result;
        }

        $(document).ready(function () {
            $scope.loadDataTableBlog($scope.blogs);
        });
    }

    $scope.searchWithEnter = function (event) {
        if (event.keyCode === 13) {
            $scope.searchBlog();
        }
    }

    $scope.refreshSearch = function () {
        document.getElementById("searchTitle").value = "";
        document.getElementById("searchUsername").value = "";
        document.getElementById("searchCreateDate").value = "";

        $scope.getDataBlog();
        $scope.loadDataTableBlog($scope.blogs);
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

    $scope.newBlog = function () {
        // Đánh dấu form là untouched và pristine để xóa thông báo lỗi

        $scope.blogData = {
            createDate: new Date(),
            username: "lethithuy",
            image: null,
            content: ''
        };
        // Làm trống trình soạn thảo Summernote
        $('#blogContent').summernote('code', $scope.blogData.content);

        // Làm trống Dropify bằng cách gán giá trị cho input
        $('.dropify-clear').trigger('click');

        $scope.formattedDate = $filter('date')($scope.blogData.createDate, 'dd/MM/yyyy');
        $scope.editImg = true;
        $scope.showBlogContentError = false;
        $scope.BlogForm.$setPristine();
        $scope.BlogForm.$setUntouched();
        $scope.BlogForm.$setValidity('required', true);
    };



    // Khởi tạo biến để kiểm tra tính hợp lệ của trường "Summernote" và điều khiển hiển thị thông báo
    $scope.isBlogContentValid = true;
    $scope.showBlogContentError = false;

    // Hàm kiểm tra tính hợp lệ của trường "Summernote" và lấy giá trị
    $scope.checkAndSetBlogContent = function () {
        // Lấy đối tượng trình soạn thảo Summernote
        var summernoteElement = $('#blogContent');

        // Lấy nội dung (giá trị) của trình soạn thảo Summernote dưới dạng mã HTML
        var content = summernoteElement.summernote('code');

        // Kiểm tra nội dung có dữ liệu hay không
        $scope.isBlogContentValid = !!content.trim() && content !== '<p><br></p>';

        // Nếu nội dung hợp lệ, gán giá trị vào biến $scope.blogData.content
        if ($scope.isBlogContentValid) {
            $scope.blogData.content = content;
            // Ẩn thông báo lỗi nếu trường "Summernote" hợp lệ
            $scope.showBlogContentError = false;
        } else {
            // Hiển thị thông báo lỗi nếu trường "Summernote" không hợp lệ
            $scope.showBlogContentError = true;
        }
    };

    var BlogIMG;
    // Hàm xử lý khi người dùng chọn file
    $document.find('#BlogIMG').on('change', function (event) {
        // Lấy file từ sự kiện change
        BlogIMG = event.target.files[0];

        // Bắt buộc phải sử dụng $apply() để thông báo rằng $scope đã thay đổi
        $scope.$apply();
    });

    $scope.addOrUpdate = function () {
        $scope.checkAndSetBlogContent();
        if ($scope.editImg === true) { // Tầng kiểm tra có sự thay đổi về hình ảnh
            if ($scope.BlogForm.$valid) { // Tầng kiểm tra form hợp lệ
                if (BlogIMG) { // Tầng kiểm tra có hình ảnh để upload ảnh lên cloud
                    ToastService.showInfoToast("Đang xử lí", "Vui lòng đợi trong giây lát")
                    BlogService.uploadImage(BlogIMG)
                        .then(function (resp) {
                            $scope.blogData.image = resp.data.fileId
                            // Cập nhật dữ liệu ảnh và tiến hành thêm  data vào DB
                            if ($scope.blogData.image != null) {// Tầng kiểm tra sau khi ảnh đã upload và tiến hành thêm  data vào DB
                                BlogService.createBlog($scope.blogData)
                                    .then(function (resp) {
                                        // Xử lý thành công, hiển thị thông báo thành công
                                        if ($scope.editImg = true) {// Tầng kiểm tra thao tác để hiển thị thông báo
                                            ToastService.showSuccessToast("Cập nhật bài viết thành công")
                                        } else {
                                            ToastService.showSuccessToast("Tạo bài viết thành công")
                                        }
                                        $scope.getDataBlog();
                                        setTimeout(function () {
                                            $('#add_Blog').modal('hide');
                                        }, 1000);
                                    })
                                    .catch(function (error) {
                                        ToastService.showErrorToast("Xảy ra lỗi khi tạo bài viết")
                                    });
                            }
                        })
                        .catch(function (error) {
                            ToastService.showErrorToast("Xảy ra lỗi khi đăng tải ảnh")
                        });
                } else {
                    ToastService.showWarningToast("Vui lòng tải lên ảnh bìa")// Log thông báo lỗi từ service
                }
            } else {
                ToastService.showErrorToast("Vui lòng điền đầy đủ thông tin bài viết");
            }
        } else {
            if ($scope.BlogForm.$valid) { // Tầng kiểm tra form hợp lệ
                BlogService.createBlog($scope.blogData)
                    .then(function (resp) {
                        // Xử lý thành công, hiển thị thông báo thành công
                        ToastService.showSuccessToast("Cập nhật bài viết thành công")
                        $scope.getDataBlog();
                        setTimeout(function () {
                            $('#add_Blog').modal('hide');
                        }, 1000);
                    })
                    .catch(function (error) {
                        ToastService.showErrorToast("Xảy ra lỗi khi cập nhật bài viết")
                    });
            } else {
                ToastService.showErrorToast("Vui lòng điền đầy đủ thông tin bài viết");
            }
        }
    }

    $scope.editImg = false;
    $scope.isHovered = false;

    $scope.showEditImage = function () {
        $scope.isHovered = true;
    };

    $scope.hideEditImage = function () {
        $scope.isHovered = false;
    };
    $scope.editImage = function () {
        $scope.editImg = true;
    }

    $scope.getBlogById = function (blogId) {
        BlogService.getBlogById(blogId)
            .then(function (response) {
                // Xử lý thành công, lấy dữ liệu blog từ response.data
                $scope.submitButtonText = "Edit";
                $scope.blogData = response.data;
                $scope.formattedDate = $filter('date')($scope.blogData.createDate, 'dd/MM/yyyy');
                $scope.editImg = false;
                $scope.showBlogContentError = false;
                // Đặt nội dung vào Summernote
                $('#blogContent').summernote('code', $scope.blogData.content);
                // Hiển thị modal để chỉnh sửa blog
                $('#add_Blog').modal('show');
            })
            .catch(function (error) {
                // Xử lý lỗi, hiển thị thông báo lỗi từ response.data
                ToastService.showErrorToast(error.data);
            });
    };

    // Hàm để chọn blog mà bạn muốn xóa
    $scope.selectBlogtoDelete = function (blogId) {
        $scope.blogIdToDelete = blogId;
    };

    $scope.deleteBlog = function () {
        if ($scope.blogIdToDelete) {
            BlogService.deleteBlog($scope.blogIdToDelete)
                .then(function (resp) {
                    // Xử lý thành công, data chứa dữ liệu thành công từ service
                    ToastService.showSuccessToast("Xóa bài viết thành công"); // Hiển thị thông báo thành công
                    $scope.getDataBlog();
                    setTimeout(function () {
                        $('#delete_Blog').modal('hide');
                    }, 500);
                })
                .catch(function (error) {
                    // Xử lý lỗi, error chứa dữ liệu lỗi từ service
                    ToastService.showErrorToast("Lỗi khi xóa bài viết")// Log thông báo lỗi từ service
                });
        } else {
            ToastService.showWarningToast('Vui lòng chọn blog để xóa.')
        }
    };

    $scope.getCommentByBlogId = function (blogId) {
        // Gọi hàm của BlogService để lấy danh sách bình luận dựa vào blogId
        BlogService.getCommentsByBlogId(blogId)
            .then(function (resp) {
                // Xử lý thành công, lấy danh sách bình luận từ response.data (giả sử response.data là mảng các bình luận)
                $scope.comments = resp.data;
                // Nếu có dữ liệu bình luận, hiển thị modal

                $(document).ready(function () {
                    $scope.loadDataTableComment($scope.comments);
                    $('#comment_Blog').modal('show');
                });
            })
            .catch(function (error) {
                // Xử lý lỗi (nếu có)
                ToastService.showErrorToast("Đã xảy ra lỗi khi lấy bình luận");
            });
    };

    $scope.temporaryComment = {
        commentId: null,
        blogId: null
    };

    $scope.loadDataTableComment = function (comments) {
        var table = $('#tableComment');

        if ($.fn.DataTable.isDataTable(table)) {
            table.DataTable().destroy();
        }

        table.DataTable({
            searching: false,
            data: comments, // Dữ liệu được truyền vào DataTables
            columns: [
                {   // Cột "#"
                    data: null,
                    render: function (data, type, row, meta) {
                        // Render giao diện cho cột "#"
                        return meta.row + 1;
                    }
                },
                { data: 'username', class: 'text-center' }, // Cột "username"
                {
                    data: 'content',
                    render: function (data, type, row) {
                        return '<p class="text-wrap" style="width: 24rem;">' + row.content + '</p>';
                    }
                },
                {   // Cột "createDate"
                    data: 'createDate', class: 'text-center',
                    render: function (data, type, row) {
                        // Sử dụng filter date để định dạng lại giá trị
                        var fmtCreateDate = $filter('date')(row.createDate, 'dd/MM/yyyy');
                        return fmtCreateDate;
                    }

                },
                {
                    data: 'status',
                    class: 'text-center',
                    render: function (data, type, row) {
                        var statusLabel;
                        if (data === 1) {
                            statusLabel = '<span class="badge text-success"><i class="fa fa-check text-success" aria-hidden="true"></i> Hiện</span>';
                        } else if (data === 0) {
                            statusLabel = '<span class="badge text-danger"><i class="fa fa-times text-danger" aria-hidden="true"></i> Ẩn</span>';
                        } else {
                            statusLabel = '<span class="badge bg-inverse-warning">Không xác định</span>';
                        }

                        // Dropdown menu cho cột "Status" với sự kiện onclick gọi hàm changeCommentStatus
                        return `
                            <div class="dropdown action-label">
                                <a class="btn btn-white btn-sm btn-rounded dropdown-toggle" href="#"
                                    data-toggle="dropdown" aria-expanded="false">
                                    ${statusLabel}
                                </a>
                                <div class="dropdown-menu">
                                    <a class="dropdown-item" href="#" onclick="angular.element(this).scope().changeCommentStatus(${row.id}, ${row.blogId}, 1)">
                                        <span class="badge text-success"><i class="fa fa-check text-success" aria-hidden="true"></i> Hiện</span>
                                    </a>
                                    <a class="dropdown-item" href="#" onclick="angular.element(this).scope().changeCommentStatus(${row.id}, ${row.blogId}, 0)">
                                        <span class="badge text-danger"><i class="fa fa-times text-danger" aria-hidden="true"></i> Ẩn</span>
                                    </a>
                                </div>
                            </div>
                        `;
                    }
                },
                {
                    // Cột "Action"
                    data: null,
                    class: 'text-right',
                    render: function (data, type, row) {
                        // Render giao diện cho cột "Action" và truyền dữ liệu id vào
                        return `
                        <div class="text-right">
                            <a class="btn btn-danger text-white" id="delete-comment-btn"
                            data-comment-id="${row.id}" data-blog-id="${row.blogId}"
                            data-target="#delete_Comment" data-toggle="modal">
                                <i class="fa fa-trash" aria-hidden="true"></i> Xóa
                            </a>
                        </div>
                      `;
                    },
                }
            ]
        });
        $(document).one('click', '#delete-comment-btn', function () {
            var commentId = $(this).data('comment-id');
            var blogId = $(this).data('blog-id');
            $scope.deleteComment(commentId, blogId);
        });
    };

    $scope.deleteComment = function (commentId, blogId) {
        BlogService.deleteCommentById(commentId)
            .then(function (resp) {
                // Xử lý thành công, data chứa dữ liệu thành công từ service
                ToastService.showSuccessToast("Xóa bình luận thành công"); // Hiển thị thông báo thành công
                $(document).ready(function () {
                    $scope.getCommentByBlogId(blogId);
                });
            })
            .catch(function (error) {
                // Xử lý lỗi, error chứa dữ liệu lỗi từ service
            });
    };

    $scope.changeCommentStatus = function (commentId, blogId, newStatus) {
        // Call CommentService để gọi API endpoint và cập nhật trạng thái của comment
        BlogService.updateCommentStatus(commentId, newStatus)
            .then(function (response) {
                // Xử lý khi cập nhật thành công, nếu cần
                ToastService.showSuccessToast("Cập nhật trạng thái bình luận thành công");
                // Tùy chỉnh cập nhật lại dữ liệu trong DataTables (nếu cần).
                $scope.getCommentByBlogId(blogId);
            })
            .catch(function (error) {
                // Xử lý khi có lỗi, nếu cần
                ToastService.showErrorToast("Lỗi khi cập nhật trạng thái bình luận")
            });
    };
};