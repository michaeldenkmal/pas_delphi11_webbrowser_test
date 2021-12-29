function callNative(data, nameOfRetFunc, fnAfter){
    //window.chrome.webview.postMessage({ data: 'Message from Edge Chromium', url: window.document.URL });
    window.chrome.webview.postMessage({ data:data, nameOfRetFunc:nameOfRetFunc });
    global_cb = fnAfter;
}


var global_cb =null;

function btn_submit() {
    callNative ("test","delphi_callback", data=> {
        const jretvalue = $("#retvalue");
        if (jretvalue.length==0) {
            throw "oaenvüsave";
        }
        const jsdata = JSON.parse(data);
        jretvalue.val(jsdata.value);    
    });
    //evt.preventDefault();
}


function delphi_callback(data) {
    global_cb(data);
}

$(document).ready(function() {
    $("#btn_submit").click(function() {
        btn_submit();
    })
});