app.factory('PageService', function () {
    return {
        getDisplayedItems: function (totalItemOnOnePage, currentPage, arrItems) {
            var startIndex = (currentPage - 1) * totalItemOnOnePage;
            var endIndex = startIndex + totalItemOnOnePage;
            return arrItems.slice(startIndex, endIndex);
        },
        calctotalPage: function (totalItemOnOnePage, arrItems) {
            return Math.ceil(arrItems.length / totalItemOnOnePage);
        }
    };
});
