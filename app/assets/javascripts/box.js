$(function() {
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
                        $( "<ol></ol>" )
                            .addClass( "list-group" )
                            .appendTo( "#ajax-content" );
                        for(var i = 0; i < content.length; i++){
                            //Create list element
                            var ideList = $( "<li></li>" );
                            ideList.addClass("list-group-item").addClass("ib-list-click");
                            ideList.appendTo("#ajax-content .list-group");
                            //Add to list element link and text
                            var link = $("<a>"+ (i+1) +'. '+ content[i].title+"</a>");
                            link.attr("href", content[i].base_uri);
                            link.appendTo(ideList);
                            //Add triangle icon
                            var right = $('<div></div>').addClass('ib-right').appendTo(ideList);
                            var icon = $("<span></span>").addClass('caret').appendTo(right);
                            //Add descriptiom
                            var description = $('<div></div>')
                                                .addClass('ib-idea-description')
                                                .text(content[i].description)
                                                .appendTo(ideList)
                                                .hide();
                            ideList.click(function(e){
                                if( $(e.target).is('a') ) {
                                    return true; // True, because we don't want to cancel the 'a' click.
                                }
                                $(this).find('.ib-idea-description').slideToggle();
                            });

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
        //if($('li.active a').attr('id') !== id) {
            setTab(id);
        //}
    }

    refreshPage()

});
