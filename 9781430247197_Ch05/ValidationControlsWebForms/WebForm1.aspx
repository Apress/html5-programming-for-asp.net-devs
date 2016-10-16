<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="ValidationControlsWebForms.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
      .auto-style1 {
        width: 100%;
      }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
      <table cellpadding="3" cellspacing="0" class="auto-style1">
        <tr>
          <td width="5%" nowrap>
            <asp:Label ID="Label1" runat="server" Text="First Name :"></asp:Label>
          </td>
          <td>
            <asp:TextBox ID="TextBox1" runat="server" required="required"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
              ControlToValidate="TextBox1" ErrorMessage="Please enter first name" 
              ForeColor="Red">*</asp:RequiredFieldValidator>
          </td>
        </tr>
        <tr>
          <td width="5%" nowrap>
            <asp:Label ID="Label2" runat="server" Text="Last Name :"></asp:Label>
          </td>
          <td>
            <asp:TextBox ID="TextBox2" runat="server" required="required"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
              ControlToValidate="TextBox2" ErrorMessage="Please enter last name" 
              ForeColor="Red">*</asp:RequiredFieldValidator>
          </td>
        </tr>
        <tr>
          <td width="5%" nowrap>
            <asp:Label ID="Label3" runat="server" Text="Email Address :"></asp:Label>
          </td>
          <td>
            <asp:TextBox ID="TextBox3" runat="server" TextMode="Email" required="required"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
            ControlToValidate="TextBox3" ErrorMessage="Please enter email address" 
            ForeColor="Red">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
            ErrorMessage="Invalid email address" ForeColor="Red" 
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
            ControlToValidate="TextBox3">*</asp:RegularExpressionValidator>
          </td>
        </tr>
        <tr>
          <td colspan="2">
            <asp:Button ID="Button1" runat="server" Text="Submit" />
          </td>
        </tr>
        <tr>
          <td colspan="2">
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
          </td>
        </tr>
      </table>
    
    </div>
    </form>
</body>
</html>
