jconfirm.defaults = {
    title: '提示',
    titleClass: '',
    useBootstrap: false,
    boxWidth: '90vw',
    bgOpacity: '.6',
    animateFromElement: false,
    animation: 'top',
    closeAnimation: 'bottom',
    theme: 'se7en',
    backgroundDismiss: true,
    buttons: {
        ok: {
            text: '确定'
        },
        close: {
            text: '取消'
        }
    }
}
$(document).ready(function () {
    $('#window').on('click', function (e) {
        $(this).removeClass('show')
    })
    var certifySwiper = new Swiper('#certify .swiper-container', {
        watchSlidesProgress: true,
        slidesPerView: 'auto',
        centeredSlides: true,
        loop: true,
        loopedSlides: 5,
        autoplay: true,
        autoplay: {
            disableOnInteraction: false,
        },
        on: {
            progress: function (progress) {
                for (i = 0; i < this.slides.length; i++) {
                    var slide = this.slides.eq(i);
                    var slideProgress = this.slides[i].progress;
                    modify = 1;
                    if (Math.abs(slideProgress) > 1) {
                        modify = (Math.abs(slideProgress) - .7) * 0.4 + .6;
                    }
                    translate = slideProgress * modify * 100 + 'px';
                    scale = 1 - Math.abs(slideProgress) / 9;
                    zIndex = 999 - Math.abs(Math.round(10 * slideProgress));
                    slide.transform('translateX(' + translate + ') scale(' + scale + ')');
                    slide.css('zIndex', zIndex);
                    slide.css('opacity', 1);
                    if (Math.abs(slideProgress) > 3) {
                        slide.css('opacity', 0);
                    }
                }
            },
            setTransition: function (transition) {
                for (var i = 0; i < this.slides.length; i++) {
                    var slide = this.slides.eq(i)
                    slide.transition(transition);
                }

            }
        }

    })
    var certifySwiper2 = new Swiper('#certify2 .swiper-container', {
        watchSlidesProgress: true,
        slidesPerView: 'auto',
        centeredSlides: true,
        loop: true,
        loopedSlides: 6,
        autoplay: true,
        autoplay: {
            disableOnInteraction: false,
        },
    })

    if (browser.versions.ios || browser.versions.iPhone || browser.versions.iPad) {
        $('#noAndroid').show()
        $('.ios_show').show()
    } else if (browser.versions.android) {
        $('#noAndroid').hide()
        $('.and_show').show()
    } else {
        $('.ios_show').show()
    }

    setTimeout(function () {
        $('#time1').html(Math.ceil(Math.random() * 9) + 'ms')
    }, 1000)
    setTimeout(function () {
        $('#time2').html(Math.ceil(Math.random() * 9) + 'ms')
    }, 1500)
    setTimeout(function () {
        $('#time3').html(Math.ceil(Math.random() * 9) + 'ms')
    }, 2000)
    setTimeout(function () {
//      $.confirm({
//          content: '是否立即安装APP，领取豪礼？',
//          buttons: {
//              ok: {
//                  text: '确定',
//                  action: function () {
//                      DownSoft()
//                  }
//              }
//          }
//      })
    },5000)
});
var browser = {
    versions: function () {
        var u = navigator.userAgent,
            app = navigator.appVersion;
        return {
            trident: u.indexOf('Trident') > -1,
            presto: u.indexOf('Presto') > -1,
            webKit: u.indexOf('AppleWebKit') > -1,
            gecko: u.indexOf('Gecko') > -1 && u.indexOf('KHTML') == -1,
            mobile: !!u.match(/AppleWebKit.*Mobile.*/) || !!u.match(/AppleWebKit/),
            ios: !!u.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/),
            android: u.indexOf('Android') > -1 || u.indexOf('Linux') > -1,
            iPhone: u.indexOf('iPhone') > -1 || u.indexOf('Mac') > -1,
            iPad: u.indexOf('iPad') > -1,
            webApp: u.indexOf('Safari') == -1
        };
    }()
}

function downApp() {
    if (browser.versions.ios || browser.versions.iPhone || browser.versions.iPad) {
        location.href = app_url.ios
    } else if (browser.versions.android) {
        location.href = app_url.andriod
    } else {}
}

function showXinRen() {
    if (document.getElementById("xinren_list").style.display == "none") {
        document.getElementById("xinren_list").style.display = "block"
        document.getElementById("game_list").style.display = "none"
    } else {
        document.getElementById("xinren_list").style.display = "none"
        document.getElementById("game_list").style.display = "block"
    }
}


function is_weixin() {
    var ua = navigator.userAgent.toLowerCase();
    if (ua.match(/MicroMessenger/i) == "micromessenger" || ua.match(/qq\//i) == "qq/") {
        return true;
    } else {
        return false;
    }
}

function showPc() {
    $('#pc').fadeIn()
}

function hidePc() {
    $('#pc').fadeOut()
}

function downApps() {
    if (browser.versions.ios || browser.versions.iPhone || browser.versions.iPad) {
        showXR()
    }
    DownSoft();
}

function showXR() {
    $('#xrBox').addClass('show')
}

function showXR1() {
    if(browser.versions.iPhone || browser.versions.iPad || browser.versions.ios) {
        $('#xrBox').addClass('show')
    }
}

function hideXrBox() {
    $('#xrBox').removeClass('show')
}