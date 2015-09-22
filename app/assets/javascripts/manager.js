$(function() {

    var elemPerPage = 4;

    //FRESH
    var paginationFreshTopOptions = {
        name: "pagination-fresh-top",
        paginationClass: "pagination-fresh-top",
        outerWindow: 2,
        innerWindow: 2
    };
    var paginationFreshBottomOptions = {
        name: "pagination-fresh-bottom",
        paginationClass: "pagination-fresh-bottom",
        outerWindow: 2,
        innerWindow: 2
    };
    var listFreshOptions = {
        valueNames: [ 'ib-idea-title','ib-idea-description','ib-idea-data' ],
        page: elemPerPage,
        plugins: [
            ListPagination(paginationFreshTopOptions),
            ListPagination(paginationFreshBottomOptions)
        ]
    };

    var listObjFresh = new List('ib-ideas-fresh', listFreshOptions);

    //Popular
    var paginationPopularTopOptions = {
        name: "pagination-popular-top",
        paginationClass: "pagination-popular-top",
        outerWindow: 2,
        innerWindow: 2
    };
    var paginationPopularBottomOptions = {
        name: "pagination-popular-bottom",
        paginationClass: "pagination-popular-bottom",
        outerWindow: 2,
        innerWindow: 2
    };
    var listPopularOptions = {
        valueNames: [ 'ib-idea-title','ib-idea-description','ib-idea-data' ],
        page: elemPerPage,
        plugins: [
            ListPagination(paginationPopularTopOptions),
            ListPagination(paginationPopularBottomOptions)
        ]
    };

    var listObjPopular = new List('ib-ideas-popular', listPopularOptions);

    //Planned
    var paginationPlannedTopOptions = {
        name: "pagination-planned-top",
        paginationClass: "pagination-planned-top",
        outerWindow: 2,
        innerWindow: 2
    };
    var paginationPlannedBottomOptions = {
        name: "pagination-planned-bottom",
        paginationClass: "pagination-planned-bottom",
        outerWindow: 2,
        innerWindow: 2
    };
    var listPlannedOptions = {
        valueNames: [ 'ib-idea-title','ib-idea-description','ib-idea-data' ],
        page: elemPerPage,
        plugins: [
            ListPagination(paginationPlannedTopOptions),
            ListPagination(paginationPlannedBottomOptions)
        ]
    };

    var listObjPlanned = new List('ib-ideas-planned', listPlannedOptions);

    //Inprogress
    var paginationInprogressTopOptions = {
        name: "pagination-inprogress-top",
        paginationClass: "pagination-inprogress-top",
        outerWindow: 2,
        innerWindow: 2
    };
    var paginationInprogressBottomOptions = {
        name: "pagination-inprogress-bottom",
        paginationClass: "pagination-inprogress-bottom",
        outerWindow: 2,
        innerWindow: 2
    };
    var listInprogressOptions = {
        valueNames: [ 'ib-idea-title','ib-idea-description','ib-idea-data' ],
        page: elemPerPage,
        plugins: [
            ListPagination(paginationInprogressTopOptions),
            ListPagination(paginationInprogressBottomOptions)
        ]
    };

    var listObjInprogress = new List('ib-ideas-inprogress', listInprogressOptions);

    //Completed
    var paginationCompletedTopOptions = {
        name: "pagination-completed-top",
        paginationClass: "pagination-completed-top",
        outerWindow: 2,
        innerWindow: 2
    };
    var paginationCompletedBottomOptions = {
        name: "pagination-completed-bottom",
        paginationClass: "pagination-completed-bottom",
        outerWindow: 2,
        innerWindow: 2
    };
    var listCompletedOptions = {
        valueNames: [ 'ib-idea-title','ib-idea-description','ib-idea-data' ],
        page: elemPerPage,
        plugins: [
            ListPagination(paginationCompletedTopOptions),
            ListPagination(paginationCompletedBottomOptions)
        ]
    };

    var listObjCompleted = new List('ib-ideas-completed', listCompletedOptions);

    //Canceled
    var paginationCanceledTopOptions = {
        name: "pagination-canceled-top",
        paginationClass: "pagination-canceled-top",
        outerWindow: 2,
        innerWindow: 2
    };
    var paginationCanceledBottomOptions = {
        name: "pagination-canceled-bottom",
        paginationClass: "pagination-canceled-bottom",
        outerWindow: 2,
        innerWindow: 2
    };
    var listCanceledOptions = {
        valueNames: [ 'ib-idea-title','ib-idea-description','ib-idea-data' ],
        page: elemPerPage,
        plugins: [
            ListPagination(paginationCanceledTopOptions),
            ListPagination(paginationCanceledBottomOptions)
        ]
    };

    var listObjCanceled = new List('ib-ideas-canceled', listCanceledOptions);

    $('.ib-box-description').addClass('ib-box-description-hide');

    $('.ib-box-desc-rozwin').click(function(){
        $('.ib-box-description').toggleClass('ib-box-description-hide');
        $('.ib-desc-roz').toggleClass('hide');
        $('.ib-desc-zw').toggleClass('hide');
    });

});