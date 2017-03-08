$(document).ready(function () {
    $('#visible-pages-example').twbsPagination({
        totalPages: 30,
        visiblePages: 7,
        version: '1.1',
        onPageClick: function (event, page) {
            $('#page-content').text('Page ' + page);
        }

    });

});

