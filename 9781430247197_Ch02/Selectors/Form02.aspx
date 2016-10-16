<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Form02.aspx.cs" Inherits="Example_03.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
  <title></title>
  <script type="text/javascript" src="Scripts/jquery-1.7.2.min.js"></script>
  <link rel="stylesheet" type="text/css" href="StyleSheet.css" />

<script type="text/javascript">
    $(document).ready(function () {
      $("#GridView1 :checkbox[id$='chkHeader']").change(function () {
        if ($("#GridView1 :checked[id $='chkHeader']").is(":checked")) {
          $("#GridView1 :checkbox[id *='chkItem']").attr("checked", "checked");
        }
        else {
          $("#GridView1 :checkbox[id *='chkItem']").removeAttr("checked");
        }
      })
      ,
    $("#GridView1 :radio[id *='radItem']").change(function () {
      var newId = this.id;
      $("#GridView1 :radio[id *='radItem']").each(function (index) {
        if (this.id != newId) {
          $(this).removeAttr("checked");
        }
      })
    })
    ,
    $("#ListBox1").change(function () {
      $("#GridView1 :input").attr("disabled", "disabled");
      $("#ListBox1 option:selected").each(function () {
        $("#GridView1 tr:contains('" + this.value + "')").each(function () {
          $(":input", this).removeAttr("disabled");
        })
      })
    })
    ,
    $("#Button1").click(function (event) {
      $("#ListBox1 option").each(function () {
        $(this).removeAttr("selected");
      })
      $("#GridView1 :input").removeAttr("disabled");
      event.preventDefault();
    })
    })
</script>



</head>
<body>
    <form id="form1" runat="server">
       <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
            ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
            SelectCommand="SELECT DISTINCT [City] FROM [Employees] ORDER BY [City]">
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:NorthwindConnectionString %>" 
            SelectCommand="SELECT [EmployeeID], [LastName], [FirstName], [Country], [City] FROM [Employees]">
        </asp:SqlDataSource>

        <asp:ListBox ID="ListBox1" runat="server" DataSourceID="SqlDataSource2" DataTextField="City" DataValueField="City" SelectionMode="Multiple" Width="200px"></asp:ListBox>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Clear Selection" Width="200px" />
        <br />
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            CellPadding="6" DataKeyNames="EmployeeID" 
      DataSourceID="SqlDataSource1" BackColor="White" BorderColor="#3366CC" 
      BorderStyle="None" BorderWidth="1px">
            <Columns>
                <asp:TemplateField>
                    <HeaderTemplate>
                        <asp:CheckBox ID="chkHeader" runat="server" />
                    </HeaderTemplate>
                    <ItemTemplate>
                        <asp:CheckBox ID="chkItem" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:RadioButton ID="radItem" runat="server" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="EmployeeID" HeaderText="EmployeeID" 
                    InsertVisible="False" ReadOnly="True" SortExpression="EmployeeID" />
                <asp:BoundField DataField="LastName" HeaderText="LastName" 
                    SortExpression="LastName" />
                <asp:BoundField DataField="FirstName" HeaderText="FirstName" 
                    SortExpression="FirstName" />
                <asp:BoundField DataField="City" HeaderText="City" />
            </Columns>
            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
            <RowStyle BackColor="White" ForeColor="#003399" />
            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
            <SortedAscendingCellStyle BackColor="#EDF6F6" />
            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
            <SortedDescendingCellStyle BackColor="#D6DFDF" />
            <SortedDescendingHeaderStyle BackColor="#002876" />
        </asp:GridView>

    </form>
</body>
</html>
