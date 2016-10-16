importScripts("HelperFunctions.js");

addEventListener("message", ReceiveMessageFromPage, false);

function ReceiveMessageFromPage(evt) {
    GetOrders(evt.data);
}

function GetOrders(settings) {
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "/Home/GetOrders");
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.onreadystatechange = function () {
        if (xhr.readyState == 4) {
            var data = JSON.parse(xhr.responseText);
            var orderAmount = 0;
            var finalData = new Array();
            var currOrderId = data[0].OrderID;
            for (var i = 0; i < data.length; i++) {
                if (data[i].OrderID != currOrderId || i == (data.length - 1)) {
                    if (i == (data.length - 1)) {
                        orderAmount += (data[i].Quantity * data[i].UnitPrice);
                    }
                    finalData.push({ CustomerID: data[i].CustomerID, OrderID: currOrderId, OrderAmount: orderAmount, OrderDate: data[i].OrderDate });
                    currOrderId = data[i].OrderID;
                    orderAmount = 0;
                }
                orderAmount += (data[i].Quantity * data[i].UnitPrice);
                
            }
            postMessage(finalData);
        }
    }
    var param = JSON.stringify(settings);
    xhr.send(param);
}




