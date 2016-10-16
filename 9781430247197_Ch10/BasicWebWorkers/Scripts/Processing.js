importScripts("HelperFunctions.js");

addEventListener("message", ReceiveMessageFromPage, true);

function ReceiveMessageFromPage(evt) {
    throw "Unexpected Error !!!";
    var date = new Date();
    var currentDate = null;
    do {
        currentDate = new Date();
    }
    while (currentDate - date < 10000);
    postMessage("Page said : " + evt.data + "\r\n Worker Replied : Hello Page!" );
}





