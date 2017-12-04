

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


    $(document).ready(function () {
        var $miaobian = $('.Xcontent08>div');
        var $huantu = $('.Xcontent06>img');
        var $miaobian1 = $('.Xcontent26>div');
        $miaobian.mousemove(function () {
            miaobian(this);
        });
        $miaobian1.click(function () {
            miaobian1(this);
        });

        function miaobian(thisMb) {
            for (var i = 0; i < $miaobian.length; i++) {
                $miaobian[i].style.borderColor = '#dedede';
            }
            thisMb.style.borderColor = '#cd2426';

            $huantu[0].src = thisMb.children[0].src;
        }

        function miaobian1(thisMb1) {
            for (var i = 0; i < $miaobian1.length; i++) {
                $miaobian1[i].style.borderColor = '#dedede';
            }
//		thisMb.style.borderColor = '#cd2426';
            $miaobian.css('border-color', '#dedede');
            thisMb1.style.borderColor = '#cd2426';
            $huantu[0].src = thisMb1.children[0].src;
        }

        $(".Xcontent33").click(function () {
            var value = parseInt($('.input').val()) + 1;
            $('.input').val(value);
        })

        $(".Xcontent32").click(function () {
            var num = $(".input").val()
            if (num > 0) {
                $(".input").val(num - 1);
            }

        })

    })

//hover 触发两个事件，鼠标移上去和移走
//mousehover 只触发移上去事件
$(".top-nav ul li").hover(function () {
    $(this).addClass("hover").siblings().removeClass("hover");
    $(this).find("li .nav a").addClass("hover");
    $(this).find(".con").show();
}, function () {
    //$(this).css("background-color","#f5f5f5");
    $(this).find(".con").hide();
    //$(this).find(".nav a").removeClass("hover");
    $(this).removeClass("hover");
    $(this).find(".nav a").removeClass("hover");
})