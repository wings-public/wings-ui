<%@ Page Language="C#" MasterPageFile="~/Simple.Master" AutoEventWireup="true" CodeBehind="GenerateAPIKey.aspx.cs" Inherits="WebGAP.Account.GenerateAPIKey" %>


<asp:Content ID="Content1" ContentPlaceHolderID="SimpleContent" runat="server">

    <div id="buttonPanel" class="mainPane">
        <h4 class="form-section"><i class="ft-user"></i>Manage API Key</h4>


        <table id="buttonsTable" class="topTable">
            <tr>
                <td>
                    <%-- createAPI_Click function shows the corresponding panel --%>
                    <asp:Button ID="btn_createAPIKey" Text="Create API Key" runat="server" CausesValidation="true"
                        OnClick="createAPI_Click" CssClass="stdButton"></asp:Button>
                </td>
                <td>
                    <%-- revokeAPI_Click function shows the corresponding panel --%>
                    <asp:Button ID="btn_revokeAPIKey" Text="Revoke API Key" runat="server" CausesValidation="true"
                        OnClick="revokeAPI_Click" CssClass="stdButton"></asp:Button>
                </td>
            </tr>
        </table>


        <%-- CREATE API PANEL --%>
        <asp:Panel ID="textBoxPanel_createAPIKey" Visible="false" runat="server" Width="100%">
            <table id="descriptionTable" class="centerTable">

                <tr><td><asp:Label ID="Label_createAPIKey" runat="server" Text="API Description:"> </asp:Label></td></tr>

                <%-- // input textbox --%>
                <tr><td><asp:TextBox ID="TextBox_createAPIKey" runat="server" Text="Insert a description here" TextMode="MultiLine" Width="300px" ></asp:TextBox></td></tr>


                <tr><td><asp:Label ID="Label_Result" runat="server" Text="API Key:"> </asp:Label></td></tr>

                <%-- // output textbox --%>
                <tr><td><asp:TextBox ID="TextBox_result" runat="server" Width="300px" ReadOnly="true" ClientIDMode="Static"></asp:TextBox>
                    <asp:Button ID="copy_clip" Text="Copy" runat="server" OnClientClick="copyText_click();return false;"></asp:Button>
                    </td></tr>
                <%-- placeholder for adding token error message --%>
                <tr><td><asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false"> 
                         <p class="text-danger">
                             <asp:Literal runat="server" ID="FailureText" />
                         </p>
                </asp:PlaceHolder></td></tr>

            </table>


            <table id="BottomTable_createAPIKey" class="bottomTable">
                <tr>
                    <td>
                        <%-- confirmation button --%>
                        <asp:Button ID="btn_Create" Text="Create" runat="server" OnClick="confirm_Click" CssClass="confirmButton"></asp:Button></td>

                    <td>
                        <asp:Button ID="btn_Cancel_createAPIKey" Text="Cancel" runat="server" CausesValidation="true"
                            OnClientClick="btn_close();return false;" CssClass="closeButton"></asp:Button></td>
                </tr>
            </table>
        </asp:Panel>


        <%-- REVOKE API PANEL --%>
        <asp:Panel ID="textBoxPanel_revokeAPIKey" Visible="false" runat="server" Width="100%">
            <table id="apiTable" class="centerTable">

                <tr><td><asp:Label ID="Label_revokeAPIKey" runat="server" Text="API Key:"> </asp:Label></td></tr>

                <tr><td><asp:TextBox ID="TextBox_revokeAPIKey" runat="server" Text="Insert API Key" TextMode="MultiLine" Width="300px"></asp:TextBox></td></tr>

                <%-- placeholder for adding token error message --%>
                <tr><td><asp:PlaceHolder runat="server" ID="Revoke_ErrorMsg" Visible="false"> 
                         <p class="text-danger">
                             <asp:Literal runat="server" ID="RevokeError" />
                         </p>
                </asp:PlaceHolder></td></tr>

            </table>

            <table id="BottomTable" class="bottomTable">
                <tr>
                    <td>
                        <%-- confirmation button --%>
                        <asp:Button ID="btn_Confirm" Text="Revoke" runat="server" OnClick="revoke_Click" CssClass="confirmButton"></asp:Button>
                    </td>

                    <td>
                        <asp:Button ID="btn_Cancel_revokeAPIKey" Text="Cancel" runat="server" CausesValidation="true"
                            OnClientClick="btn_close();return false;" CssClass="closeButton"></asp:Button>
                    </td>
                </tr>
            </table>
        </asp:Panel>

    </div>

    <script>

        function GetRadWindow() {
            var oWindow = null;
            if (window.radWindow) oWindow = window.radWindow;
            else if (window.frameElement.radWindow) oWindow = window.frameElement.radWindow;
            return oWindow;
        }

        function btn_close() {
            GetRadWindow().close();

        }

        function copyText_click() {
            // Get the data from the token textbox
            //Use the ClientID property to get the ID of the control at runtime. 
            //This will give you the correct ID, even if the ID has been changed by the ASP.NET runtime.
            var copyTextbox = document.getElementById("<%= TextBox_result.ClientID %>");
            console.log("Got ID ");
            var text = copyTextbox.value;
            //console.log(text);
            //var text = document.getElementById("TextBox_result").value;
            // Copy the text to the clipboard
            console.log("Text copied to clipboard- Request");
            navigator.clipboard.writeText(text).then(function () {
                console.log("Text copied to clipboard");
            }, function (err) {
                console.error("Error copying text to clipboard: ", err);
            });
        }

    </script>

    <style>
        .mainPane {
            width: 100%;
            border-collapse: separate;
            border-spacing: 15px;
            align-content: space-between;
            align-self: center;
        }

        .topTable {
            margin: 10px 10px 10px 10px;
            justify-content: center;
            align-content: space-between;
            display: flex;
        }

        .centerTable {
            margin: 10px 10px 10px 10px;
            justify-content: center;
            align-content: space-around;
            display: grid;
            width: 100%;
        }

        .bottomTable {
            margin: 50px 10px 10px 10px;
            justify-content: center;
            align-content: space-between;
            display: flex;
            align-items: flex-end;
            flex-direction:row;
            width: 100%;
        }


        .stdButton {
            display: inline-block;
            padding: 0.65em 1.6em;
            border: 3px solid #ffffff;
            margin: 0 0.3em 0.3em 0;
            border-radius: 0.12em;
            box-sizing: border-box;
            text-decoration: none;
            font-family: "Roboto", sans-serif;
            font-weight: 300;
            color: #000000;
            text-align: center;
            transition: all 0.2s;
            animation: bn13bouncy 5s infinite linear;
            position: relative;
        }

            .stdButton:hover {
                color: #000000;
                background-color: #ffffff;
            }



        .closeButton {
            display: inline-block;
            padding: 0.65em 1.6em;
            border: 3px solid #8B0000;
            margin: 0 0.3em 0.3em 0;
            border-radius: 0.12em;
            box-sizing: border-box;
            text-decoration: none;
            font-family: "Roboto", sans-serif;
            font-weight: 300;
            color: #8B0000;
            text-align: center;
            transition: all 0.2s;
            animation: bn13bouncy 5s infinite linear;
            position: relative;
        }

            .closeButton:hover {
                color: #ffffff;
                background-color: #8B0000;
            }

        .confirmButton {
            display: inline-block;
            padding: 0.65em 1.6em;
            border: 3px solid #008000;
            margin: 0 0.3em 0.3em 0;
            border-radius: 0.12em;
            box-sizing: border-box;
            text-decoration: none;
            font-family: "Roboto", sans-serif;
            font-weight: 300;
            color: #008000;
            text-align: center;
            transition: all 0.2s;
            animation: bn13bouncy 5s infinite linear;
            position: relative;
        }

            .confirmButton:hover {
                color: #ffffff;
                background-color: #008000;
            }

            .confirmButton:disabled,
            button[disabled] {
                cursor: not-allowed;
                pointer-events: none;
                border: 3px solid grey;
                color: grey;
            }



        .labelPane {
            background-color: white;
            opacity: 50%;
            text-align: center;
            justify-content: center;
            padding-top: 48%;
            padding-bottom: 48%;
        }
    </style>

</asp:Content>
