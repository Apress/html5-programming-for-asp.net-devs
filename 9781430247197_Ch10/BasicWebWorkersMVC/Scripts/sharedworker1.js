
//var connections = 0; // count active connections
//self.addEventListener("connect", function (e) {
//    var port = e.ports[0];
//    connections++;
//    port.addEventListener("message", function (e) {
//        port.postMessage("Hello " + e.data + " (port #" + connections + ")");
//    }, false);
//    port.start();
//}, false);





importScripts("HelperFunctions.js");

addEventListener("connect", ReceiveMessageFromPage, false);

var port;

function ReceiveMessageFromPage(evt) {
    port = evt.ports[0];
    port.addEventListener("message", SendMessageToPage, false);
    port.start();
}

function SendMessageToPage(evt) {
    GetCustomerData(evt.data);
}

function GetCustomerData(customerId) {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "/Home/GetOrders");
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4) {
            var data=JSON.stringify(xhr.responseText);
            port.postMessage(xhr.responseText);
        }
    }
    var param = '{ "customerid": "' + customerId + '"}';

    xhr.send(param);

}





