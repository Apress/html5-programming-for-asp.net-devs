<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ShoppingCart.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="StyleSheet.css" rel="stylesheet" type="text/css" />
    <script src="scripts/jquery-1.4.4.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        var srcElement;

        $(document).ready(function () {

            $("#Button2").click(function () {
                $("div .bag div").remove();
            });

            $("#Button1").click(function () {
                var data = new Array();
                $("div .bag div").each(function (index) {
                    data[index] = "'" + this.innerHTML + "'";
                });
                $.ajax({
                    type: 'POST',
                    url: 'shoppingcart.aspx/PlaceOrder',
                    contentType: "application/json; charset=utf-8",
                    data: '{ products:[' + data.join() + ']}',
                    dataType: 'json',
                    success: function (results) { alert(results.d); },
                    error: function () { alert('error'); }
                });
            });

            $("div .product").each(function () {
                this.addEventListener('dragstart', OnDragStart, false);
            });

            var cart = $("#divCart").get(0);
            cart.addEventListener('dragenter', OnDragEnter, false);
            cart.addEventListener('dragleave', OnDragLeave, false);
            cart.addEventListener('dragover', OnDragOver, false);
            cart.addEventListener('drop', OnDrop, false);
            cart.addEventListener('dragend', OnDragEnd, false);

        })

        function OnDragStart(e) {
            this.style.opacity = '0.4';
            srcElement = this;
            e.dataTransfer.effectAllowed = 'move';
            var product=$(this).find("header")[0].innerHTML;
            e.dataTransfer.setData('text/html', product);
        }

        function OnDragOver(e) {
            if (e.preventDefault) {
                e.preventDefault();
            }
            $(this).addClass('highlight');
            e.dataTransfer.dropEffect = 'move';
        }

        function OnDragEnter(e) {
            $(this).addClass('highlight');
        }

        function OnDragLeave(e) {
            $(this).removeClass('highlight');
        }

        function OnDrop(e) {
            if (e.preventDefault) {
                e.preventDefault();
            }     
            srcElement.style.opacity = '1';
            $(this).removeClass('highlight');
            var count = $(this).find("div[data-product-name='" + e.dataTransfer.getData('text/html') + "']").length;
            if (count <= 0) {
                $(this).append("<div class='selectedproduct' data-product-name='" + e.dataTransfer.getData('text/html') + "'>" + e.dataTransfer.getData('text/html') + "</div>");
            }
            else {
                alert("This product is already added to your cart!");
            }
            return false;
        }

        function OnDragEnd(e) {
            $("div .bag").removeClass('highlight');
            this.style.opacity = '1';
        }    
    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
        <asp:EntityDataSource 
            ID="EntityDataSource1" 
            runat="server" 
            ConnectionString="name=ShoppingCartEntities" 
            DefaultContainerName="ShoppingCartEntities" 
            EnableFlattening="False" 
            EntitySetName="Products">
        </asp:EntityDataSource>


        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="EntityDataSource1">
          <ItemTemplate>
              <div class="product" draggable="true">
                  <header><%# Eval("Name") %></header>
                  <div><asp:Image runat="server" ID="img1" ImageUrl='<%# Eval("ImageUrl") %>' /></div>
                  <div><%# Eval("Description") %></div>
                  <br />
                  <div class="cost"><%# Eval("Cost","Cost : ${0}") %></div>
                  <input type="hidden" value="<%# Eval("ProductId") %>" />
              </div>
          </ItemTemplate>
        </asp:Repeater>

        <div id="divCart" class="bag">
            <asp:Image runat="server" ID="img1" ImageUrl="~/images/cart.jpg" />
            <br /><br />
            <input id="Button1" type="button" value="Place Order" />
            <br />
            <input id="Button2" type="button" value="Clear Cart" />
        </div>
        </div>
    </form>
</body>
</html>
