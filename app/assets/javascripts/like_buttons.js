/**
 * Created by maciej on 28.08.15.
 */

$(function() {

    function addLikesButtons() {

        var AUTH_TOKEN = $('meta[name=csrf-token]').attr('content');

        //Functions
        function likeIdea(ideaUrl) {
            $.ajax({
                type: 'post',
                dataType: 'text',
                data: "user_id=" + CURRENT_USER + "&authenticity_token=" + AUTH_TOKEN,
                url: ideaUrl + '/like'
            })
        }

        function dislikeIdea(ideaUrl) {
            $.ajax({
                type: 'post',
                dataType: 'text',
                data: "user_id=" + CURRENT_USER + "&authenticity_token=" + AUTH_TOKEN,
                url: ideaUrl + '/dislike'
            })
        }

        function unlikeIdea(ideaUrl) {
            $.ajax({
                type: 'post',
                dataType: 'text',
                data: "user_id=" + CURRENT_USER + "&authenticity_token=" + AUTH_TOKEN,
                url: ideaUrl + '/unlike'
            })
        }

        //Get div where will be buttons
        var buttonsPanel = $('.ib-like-buttons-panel');
        buttonsPanel.each(function () {
            //get every one element button pannel
            var ideaUrl = $(this).attr('data-idea-url');
            var likeButton = $('<button></button>')
                .addClass('ib-like-button btn')
                .appendTo(this)
                .click(likeIdea(ideaUrl));
            var dislikeButton = $('<button></button>')
                .addClass('ib-dislike-button btn')
                .appendTo(this)
                .click(dislikeIdea(ideaUrl));
            var unlikeButton = $('<button></button>')
                .addClass('ib-unlike-button btn')
                .appendTo(this)
                .click(unlikeIdea(ideaUrl));

        });
    }

});