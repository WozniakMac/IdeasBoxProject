function addLikesButtons(element) {

    var AUTH_TOKEN = $('meta[name=csrf-token]').attr('content');

    //Functions
    function likeIdea(ideaUrl) {
        $.ajax({
            type: 'post',
            dataType: 'script',
            data: "user_id=" + CURRENT_USER + "&authenticity_token=" + AUTH_TOKEN,
            url: ideaUrl + '/like'
        })
    }

    function dislikeIdea(ideaUrl) {
        $.ajax({
            type: 'post',
            dataType: 'script',
            data: "user_id=" + CURRENT_USER + "&authenticity_token=" + AUTH_TOKEN,
            url: ideaUrl + '/dislike'
        })
    }

    function unlikeIdea(ideaUrl) {
        $.ajax({
            type: 'post',
            dataType: 'script',
            data: "user_id=" + CURRENT_USER + "&authenticity_token=" + AUTH_TOKEN,
            url: ideaUrl + '/unlike'
        })
    }

    function addButtonsToElement(element){
        //get every one element button pannel
        //LIKE
        var ideaUrl = element.attr('data-idea-url');
        var buttonGrup = $('<div></div>').addClass('btn-group').appendTo(element);
        var likeButton = $('<button></button>')
            .addClass('ib-like-button btn btn-success')
            .html('<span class="glyphicon glyphicon-thumbs-up" aria-hidden="true"></span> ')
            .appendTo(buttonGrup);
        likeButton.click(function(){
            likeIdea(ideaUrl);
        });
        $('<span>'+element.attr('data-idea-like-counter')+'</span>')
            .addClass("badge")
            .appendTo(likeButton);

        if(element.attr('data-idea-liked')==1 || CURRENT_USER == null){
            likeButton.attr('disabled','disabled');
        }
        //DISLIKE
        var dislikeButton = $('<button></button>')
            .addClass('ib-dislike-button btn btn-warning')
            .html('<span class="glyphicon glyphicon-thumbs-down" aria-hidden="true"></span> ')
            .appendTo(buttonGrup);
        dislikeButton.click(function(){
            dislikeIdea(ideaUrl);
        });
        $('<span>'+element.attr('data-idea-dislike-counter')+'</span>')
            .addClass("badge")
            .appendTo(dislikeButton);

        if(element.attr('data-idea-disliked')==1 || CURRENT_USER == null){
            dislikeButton.attr('disabled','disabled');
        }


        //var unlikeButton = $('<button></button>')
        //    .addClass('ib-unlike-button btn btn-default')
        //    .html('<span class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span>')
        //    .appendTo(element);
        //unlikeButton.click(function(){
        //    unlikeIdea(ideaUrl);
        //});
    }

    //Get div where will be buttons
    function addButtonsToAllElements() {
        var buttonsPanel = $('.ib-like-buttons-panel');
        buttonsPanel.each(addButtonsToElement($(this)));
    }

    if(typeof element !== 'undefined'){
        addButtonsToElement(element);
    }else{
        addButtonsToAllElements();
    }
}