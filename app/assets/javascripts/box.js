$(function() {
    //Like button

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

    //END Like buttons

    //Vars
    $body = $("body");


    //Loadng
    $(document).on({
        ajaxStart: function() { $body.addClass("loading");    },
        ajaxStop: function() { $body.removeClass("loading"); }
    });

    //Buffered ajax send
    function BufferedAjax() {
        this.buffer = new Object();
    }

    BufferedAjax.prototype.getRequest = function(url, functionToRun){
        var key = "key" + url.replace(/\W/g, '');
        var buff = this;

        if(key in this.buffer){
            functionToRun(this.buffer[key]);
        }else{
            var res;
            var x = $.ajax({url: url,
                    success: function(result){
                        buff.buffer[key] =  result;
                        functionToRun(result);
                    },
                    error: function(result){
                        $("#ajax-content").text(I18n.t("box.javascript.error"));
                    }
            });
        }
    }

    var navTabs = $("#tabs");
    var buffered = new BufferedAjax();

    function setTab(id){
        var elementById = $('#'+id);
        navTabs.find("li.active").removeClass("active");
        elementById.parent().addClass("active");
        var url = elementById.attr('href')+".json";
        window.history.pushState({ page: id },id,'##'+id);
        var key = "key" + url.replace(/\W/g, '');
        buffered.getRequest(url, function(content){
            switch(id){
                case 'about':
                {
                    $("#ajax-content").text(content.description);
                    break;
                }
                default:
                {
                    if (content.length == 0) {
                        $("#ajax-content").text(I18n.t("box.javascript.nothing"));
                    } else {
                        $("#ajax-content").html("");
                        //$("#ajax-content").text(JSON.stringify(content));
                        $( "<ol></ol>" )
                            .addClass( "list-group" )
                            .appendTo( "#ajax-content" );
                        for(var i = 0; i < content.length; i++){
                            //Create list element
                            var ideList = $( "<li></li>" );
                            ideList.addClass("list-group-item").addClass("ib-list-click");
                            ideList.attr('id','idea-'+content[i].id);
                            ideList.appendTo("#ajax-content .list-group");
                            //Add to list element link and text
                            var link = $("<a>"+ (i+1) +'. '+ content[i].title+"</a>");
                            link.attr("href", content[i].base_uri);
                            link.appendTo(ideList);
                            var right = $('<div></div>').addClass('ib-right').appendTo(ideList);
                            var likepanel = $("<div></div>").addClass('ib-like-buttons-panel').appendTo(right);
                            //Add triangle icon
                            //var icon = $("<div></div>").addClass('caret').appendTo(right);
                            //Add descriptiom
                            var description = $('<div></div>')
                                                .addClass('ib-idea-description')
                                                .text(content[i].description)
                                                .appendTo(ideList)
                                                .hide();
                            ideList.click(function(e){
                                if( $(e.target).is('a') || $(e.target).is('button') || $(e.target).is('span') ) {
                                    return true; // True, because we don't want to cancel the 'a' click.
                                }
                                $(this).find('.ib-idea-description').slideToggle();
                            });
                            likepanel.attr('data-idea-url',content[i].base_uri);
                            likepanel.attr('data-idea-like-counter',content[i].like_counter);
                            likepanel.attr('data-idea-dislike-counter',content[i].dislike_counter);
                            likepanel.attr('data-idea-liked',content[i].liked);
                            likepanel.attr('data-idea-disliked',content[i].disliked);
                            addLikesButtons(likepanel);

                        }
                    }
                    break;
                }

            }
            navTabs.find("#ajax-content").fadeIn();
        });
    }

    navTabs.find("a").click(function(e) {
        e.preventDefault();
        navTabs.find("div.elem").hide();
        setTab($(this).attr('id'));
    });


    function refreshPage(){
        var id = location.hash.split('##')[1] ? location.hash.split('##')[1] : 'about';
        if($('li.active a').attr('id') !== id) {
            setTab(id);
        }
    }

    refreshPage();

});
