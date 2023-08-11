app.controller("HeaderController", function (AccountService, ProductService, $scope, $window) {
    $scope.account = null; // Biến lưu thông tin account 

    AccountService.checkLogin().then(function (account) {
        // Người dùng đã đăng nhập
        $scope.account = account;
    }).catch(function (error) {
    });

    ProductService.getAllProductDTO().then(function (response) {
        $scope.products = response.data;

        var products = $scope.products;

        autocomplete(document.getElementById("search"), products);

        function autocomplete(inp, arr) {
            /*the autocomplete function takes two arguments,
            the text field element and an array of possible autocompleted values:*/
            var currentFocus;
            /*execute a function when someone writes in the text field:*/
            inp.addEventListener("input", function (e) {
                var a, b, i, val = this.value;
                /*close any already open lists of autocompleted values*/
                closeAllLists();
                if (!val) { return false; }
                currentFocus = -1;
                /*create a DIV element that will contain the items (values):*/
                a = document.createElement("DIV");
                a.setAttribute("id", this.id + "autocomplete-list");
                a.setAttribute("class", "autocomplete-items");
                /*append the DIV element as a child of the autocomplete container:*/
                this.parentNode.appendChild(a);
                /*for each item in the array...*/

                var record = 0;
                for (i = 0; i < arr.length; i++) {
                    if (record == 6) {
                        break;
                    }
                    /*check if the item starts with the same letters as the text field value:*/
                    if (arr[i].name.toUpperCase().includes(val.toUpperCase())) {
                        record++;
                        var searchIndex = arr[i].name.toUpperCase().indexOf(val.toUpperCase());

                        // Tạo biến để lưu tên sản phẩm với phần tìm kiếm in đậm
                        var highlightedName = arr[i].name.substring(0, searchIndex) +
                            '<strong>' + arr[i].name.substring(searchIndex, searchIndex + val.length) + '</strong>' +
                            arr[i].name.substring(searchIndex + val.length);
                        /*create a DIV element for each matching element:*/
                        b = document.createElement("DIV");
                        b.classList.add("autocomplete-item"); // Thêm class để tùy chỉnh CSS

                        // Hiển thị tấm hình sản phẩm và tên sản phẩm
                        b.innerHTML = `
                        <a href="/product/detail/${arr[i].id}">
                        <img src="${'https://drive.google.com/uc?id=' + arr[i].poster}" alt="${arr[i].name}" class="product-image">
                        <span>
                        <span class="product-name">
                        ${highlightedName}
                        </span> <br />
                        <span class="new-price">${arr[i].offer > 0 ? formatNumber(arr[i].salePrice - (arr[i].salePrice * arr[i].offer)) + ' VND' : formatNumber(arr[i].salePrice) + ' VND'}</span> <br />
                        <span class="old-price">${arr[i].offer > 0 ? formatNumber(arr[i].salePrice) + ' VND' : ''}</span>
                        </span>
                        
                        </a>
                        `;

                        /*execute a function when someone clicks on the item value (DIV element):*/
                        b.addEventListener("click", function (e) {
                            document.getElementById("search").value = "";
                            /*insert the value for the autocomplete text field:*/
                            inp.value = this.getElementsByTagName("input")[0].value;
                            /*close the list of autocompleted values,
                            (or any other open lists of autocompleted values:*/
                            closeAllLists();
                        });
                        a.appendChild(b);
                    }
                }
            });
            /*execute a function presses a key on the keyboard:*/
            inp.addEventListener("keydown", function (e) {
                var x = document.getElementById(this.id + "autocomplete-list");
                if (x) x = x.getElementsByTagName("div");
                if (e.keyCode == 40) {
                    /*If the arrow DOWN key is pressed,
                    increase the currentFocus variable:*/
                    currentFocus++;
                    /*and and make the current item more visible:*/
                    addActive(x);
                } else if (e.keyCode == 38) { //up
                    /*If the arrow UP key is pressed,
                    decrease the currentFocus variable:*/
                    currentFocus--;
                    /*and and make the current item more visible:*/
                    addActive(x);
                } else if (e.keyCode == 13) {
                    /*If the ENTER key is pressed, prevent the form from being submitted,*/
                    e.preventDefault();
                    if (currentFocus > -1) {
                        /*and simulate a click on the "active" item:*/
                        document.getElementById("search").value = "";
                        if (x) x[currentFocus].querySelector('a').click();
                    }
                }
            });
            function addActive(x) {
                /*a function to classify an item as "active":*/
                if (!x) return false;
                /*start by removing the "active" class on all items:*/
                removeActive(x);
                if (currentFocus >= x.length) currentFocus = 0;
                if (currentFocus < 0) currentFocus = (x.length - 1);
                /*add class "autocomplete-active":*/
                x[currentFocus].classList.add("autocomplete-active");
            }
            function removeActive(x) {
                /*a function to remove the "active" class from all autocomplete items:*/
                for (var i = 0; i < x.length; i++) {
                    x[i].classList.remove("autocomplete-active");
                }
            }
            function closeAllLists(elmnt) {
                /*close all autocomplete lists in the document,
                except the one passed as an argument:*/
                var x = document.getElementsByClassName("autocomplete-items");
                for (var i = 0; i < x.length; i++) {
                    if (elmnt != x[i] && elmnt != inp) {
                        x[i].parentNode.removeChild(x[i]);
                    }
                }
            }
            /*execute a function when someone clicks in the document:*/
            document.addEventListener("click", function (e) {
                closeAllLists(e.target);
            });
        }
    }).catch(function (error) {
        console.error('Lỗi khi lấy tất cả sản phẩm DTO:', error);
    });

    function formatNumber(number) {
        return number.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ".");
    }
});
