/*$(function(){
    // 导航左侧栏js效果 start
    $(".pullDownList li").hover(function(){
        $(".yMenuListCon").fadeIn();
        var index=$(this).index(".pullDownList li");
        if (!($(this).hasClass("menulihover")||$(this).hasClass("menuliselected"))) {
            $($(".yBannerList")[index]).css("display","block").siblings().css("display","none");
            $($(".yBannerList")[index]).removeClass("ybannerExposure");
            setTimeout(function(){
                $($(".yBannerList")[index]).addClass("ybannerExposure");
            },60)
        }else{
        }
        $(this).addClass("menulihover").siblings().removeClass("menulihover");
        $(this).addClass("menuliselected").siblings().removeClass("menuliselected");
        $($(".yMenuListConin")[index]).fadeIn().siblings().fadeOut();
    },function(){

    })
    $(".pullDown").mouseleave(function(){
        $(".yMenuListCon").fadeOut();
        $(".yMenuListConin").fadeOut();
        $(".pullDownList li").removeClass("menulihover");

    })
    // 导航左侧栏js效果  end

})*/


    /*$(".pullDownList li dl").delegate("dt","mouseenter",function () {
        $($(".yMenuListConin")[index]).find("dl").removeChild("dd");
        var $parentId=$(this).attr("name")
        $.ajax({
            url:"/category",
            data:{
                "action":'findAllCategory',
                "parentId":$parentId
            },
            type:"get",
            success:function(data){
                $($(".yMenuListConin")[index]).empty();

                $(data).each(function(){
                    /!*if(this.parentId==1){
                        $($(".yMenuListConin")[index]).prepend($("<dl><dt><a href='' >"+this.name+"&nbsp;&nbsp;></a></dt></dl><br/>"))
                    }else{*!/
                       /!* $($(".yMenuListConin")[index]).find("dl").append($("<dd><a href=''>"+this.name+"&nbsp;&nbsp;></a></dd>"))*!/




                })
            },
            dataType:"json"
        })
        return false;
    })*/











var intDiff = parseInt(90000);//倒计时总秒数量

function timer(intDiff) {
    window.setInterval(function () {
        var day = 0,
            hour = 0,
            minute = 0,
            second = 0;//时间默认值
        if (intDiff > 0) {
            day = Math.floor(intDiff / (60 * 60 * 24));
            hour = Math.floor(intDiff / (60 * 60)) - (day * 24);
            minute = Math.floor(intDiff / 60) - (day * 24 * 60) - (hour * 60);
            second = Math.floor(intDiff) - (day * 24 * 60 * 60) - (hour * 60 * 60) - (minute * 60);
        }
        if (minute <= 9) minute = '0' + minute;
        if (second <= 9) second = '0' + second;
        $('#day_show').html(day + "天");
        $('#hour_show').html('<s id="h"></s>' + hour + '时');
        $('#minute_show').html('<s></s>' + minute + '分');
        $('#second_show').html('<s></s>' + second + '秒');
        intDiff--;
    }, 1000);
}

$(function () {
    timer(intDiff);
});//倒计时结束

$(function () {
    /*======右按钮======*/
    $(".you").click(function () {
        nextscroll();
    });

    function nextscroll() {
        var vcon = $(".v_cont");
        var offset = ($(".v_cont li").width()) * -1;
        vcon.stop().animate({marginLeft: offset}, "slow", function () {
            var firstItem = $(".v_cont ul li").first();
            vcon.find(".flder").append(firstItem);
            $(this).css("margin-left", "0px");
        });
    };
    /*========左按钮=========*/
    $(".zuo").click(function () {
        var vcon = $(".v_cont");
        var offset = ($(".v_cont li").width() * -1);
        var lastItem = $(".v_cont ul li").last();
        vcon.find(".flder").prepend(lastItem);
        vcon.css("margin-left", offset);
        vcon.animate({marginLeft: "0px"}, "slow")
    });
});
//hover 触发两个事件，鼠标移上去和移走
//mousehover 只触发移上去事件
$(".top-nav ul li").hover(function(){
    $(this).addClass("hover").siblings().removeClass("hover");
    $(this).find("li .nav a").addClass("hover");
    $(this).find(".con").show();
},function(){
    //$(this).css("background-color","#f5f5f5");
    $(this).find(".con").hide();
    //$(this).find(".nav a").removeClass("hover");
    $(this).removeClass("hover");
    $(this).find(".nav a").removeClass("hover");
})

/*hover(function(){

},function(){

})*/