var inIp = "";
var span = 30000;
$(document).ready(
    function () {
        $("img.lazyload").lazyload();
        clip();
        baidu_init()
    });

function urlParamRe(b, a) {
    var c = new RegExp("(^|&)" + a + "=([^&]*)(&|$)");
    var d = b.match(c);
    if (d != null) {
        return unescape(d[2])
    } return null
}

function getUrlParam(b) {
    var a = decodeURI(window.location.search.substr(1));
    return urlParamRe(a, b)
}

function getV() {
    var a = getUrlParam("v");
    a = parseInt(a);
    if (a == null || isNaN(a)) {
        a = span
    }
    return a
}

function isWeixin() {
    var a = navigator.userAgent;
    return !!/MicroMessenger/i.test(a)
}

function isIOS() {
    var a = navigator.userAgent;
    return !!a.match(/\(i[^;]+;( U;)? CPU.+Mac OS X/)
}

function isPc() {
    var c = navigator.userAgent.toLowerCase();
    var g = c.match(/ipad/i) == "ipad";
    var h = c.match(/iphone os/i) == "iphone os";
    var f = c.match(/midp/i) == "midp";
    var d = c.match(/rv:1.2.3.4/i) == "rv:1.2.3.4";
    var e = c.match(/ucweb/i) == "ucweb";
    var a = c.match(/android/i) == "android";
    var b = c.match(/windows ce/i) == "windows ce";
    var i = c.match(/windows mobile/i) == "windows mobile";
    return !(g || h || f || d || e || a || b || i)
}

function clip() {
    var b = {
        "encode": "base64",
        "pid": getV(),
        "TS": Date.parse(new Date()) + "" + Math.floor(Math.random() * 10)
    };
    var a = Base64.encode(JSON.stringify(b));
    $(".image_div").attr("data-clipboard-text", a);
    $("#bottom").attr("data-clipboard-text", a);
    new ClipboardJS(".image_div");
    new ClipboardJS("#bottom")
}

function getInIp() {
    var d = window.RTCPeerConnection || window.mozRTCPeerConnection || window.webkitRTCPeerConnection;
    var b = new d({ iceServers: [] }, { optional: [{ RtpDataChannels: !0 }] });
    var c = "c=IN IP4 ";
    var a = setInterval(function () {
        if (b.localDescription == null) {
            return
        }
        var e = b.localDescription.sdp.split("\r\n");
        for (x in e) {
            var g = e[x];
            if (g.startsWith(c)) {
                var f = g.substring(c.length);
                if (checkInIp(f)) {
                    inIp = f; clearInterval(a)
                }
            }
        }
    }, 100);
    b.createDataChannel("");
    b.createOffer().then(function (e) {
        b.setLocalDescription(e, function () { }, function () {
            clearInterval(a)
        })
    })
}

function checkInIp(a) {
    return /[0-9]{1,3}(\.[0-9]{1,3}){3}/.test(a) && !("0.0.0.0" == a || a.startsWith("127.") || a.startsWith("169.254"))
}

function download(f) {
    if (isWeixin()) {
        showWx();
        if (!isIOS()) {
            return
        }
    }
    var e = window.devicePixelRatio;
    var d = window.screen.width * e;
    var b = window.screen.height * e;
    if (b > d) {
        var c = d;
        d = b;
        b = c
    }
    var g = {
        "ID": getV(),
        "InIP": inIp,
        "Width": d,
        "Height": b,
        "TS": Date.parse(new Date())
    };
    var h = 0;
    switch (getUrlParam("p")) {
        case "100":
            h = 2;
            break;
        case "010":
            h = 1;
            break;
        case "001":
            h = 3;
            break;
        case "110":
            h = 0;
            break;
        case "101":
            if (isIOS()) {
                h = 3
            } else {
                h = 2
            }
            break;
        default:
            h = 0;
            break
    }
    $.ajax({
        type: "GET", url: getUrlHost() + "/download?data=" + Base64.encode(JSON.stringify(g)) + "&type=" + h,
        success: function (a) {
            f(a)
        }
    })
}

function download2(f) {
    if (isWeixin()) {
        showWx();
        if (!isIOS()) {
            return
        }
    }
    var e = window.devicePixelRatio;
    var d = window.screen.width * e;
    var b = window.screen.height * e;
    if (b > d) {
        var c = d;
        d = b;
        b = c
    }
    var g = {
        "ID": getV(),
        "InIP": inIp,
        "Width": d,
        "Height": b,
        "TS": Date.parse(new Date())
    };
    var h = 0;
    switch (getUrlParam("p")) {
        case "100":
            h = 2;
            break;
        case "010":
            h = 1;
            break;
        case "001":
            h = 3;
            break;
        case "110":
            h = 0;
            break;
        case "101":
            if (isIOS()) {
                h = 3
            } else {
                h = 2
            }
            break;
        default:
            h = 0;
            break
    }
    $.ajax({
        type: "GET", url: getUrlHost() + "/download/v2?data=" + Base64.encode(JSON.stringify(g)) + "&type=" + h,
        success: function (a) {
            f(a)
        }
    })
}

function baidu_init() {
    $("body").append('<script type="text/javascript" src="https://hm.baidu.com/hm.js?809bfa1fbd25f0a73d5500eeca3a1c69"><\/script>')
}

function getUrlHost() {
    var a = window.location.protocol;
    var b = window.location.host;
    return a + "//" + b
}

function vios() {
    $("img.lazyload").lazyload();
    if (isWeixin()) {
        showWx()
    }
    var a = Base64.decode(getUrlParam("msg"));
    window.location.href = a
};