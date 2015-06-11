<%@ Page Title="" Language="C#" MasterPageFile="~/MyMasterPage.master" AutoEventWireup="true" CodeFile="MyProfile.aspx.cs" Inherits="MyProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">   
         
    <link href="Assets/css/profile.css" rel="stylesheet" />  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="page-content-wrap">

        <div class="row margin-top-20">
            <div class="col-md-12">
                <!-- BEGIN PROFILE SIDEBAR -->
                <div class="profile-sidebar">
                    <!-- PORTLET MAIN -->
                    <div class="portlet light profile-sidebar-portlet">
                        <!-- SIDEBAR USERPIC -->
                        <div class="profile-userpic">
                            <asp:Image ID="Image1" CssClass="img-responsive img-circle" runat="server" />
                        </div>
                        <!-- END SIDEBAR USERPIC -->
                        <!-- SIDEBAR USER TITLE -->
                        <div class="profile-usertitle">
                            <div class="profile-usertitle-name">
                                <asp:Label ID="profile_name" runat="server"></asp:Label>
                            </div>
                            <div class="profile-usertitle-job">
                                <asp:Label ID="profile_work" runat="server"></asp:Label>
                            </div>
                        </div>
                        <!-- END SIDEBAR USER TITLE -->
                        <!-- SIDEBAR MENU -->
                        <div class="profile-usermenu">
                            <ul class="nav nav-tabs   nav-stacked ">

                                <li class="active"><a href="#home" data-toggle="tab"><span class="glyphicon glyphicon-home "></span>OverView</a></li>

                                <li><a href="#setting" data-toggle="tab"><span class="glyphicon glyphicon-pencil"></span>Account Setting</a></li>

                                <li><a href="#tasks" data-toggle="tab"><span class="fa fa-key"></span>Deactive your Account</a></li>

                            </ul>
                        </div>
                        <!-- END MENU -->
                    </div>
                    <!-- END PORTLET MAIN -->
                    <!-- PORTLET MAIN -->
                    <div class="portlet light">
                        <!-- STAT -->
                       <%-- <div class="row list-separated profile-stat">
                            <div class="col-md-4 col-sm-4 col-xs-6">
                                <div class="uppercase profile-stat-title">
                                    37
                                </div>
                                <div class="uppercase profile-stat-text">
                                    Projects
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-4 col-xs-6">
                                <div class="uppercase profile-stat-title">
                                    51
                                </div>
                                <div class="uppercase profile-stat-text">
                                    Tasks
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-4 col-xs-6">
                                <div class="uppercase profile-stat-title">
                                    61
                                </div>
                                <div class="uppercase profile-stat-text">
                                    Uploads
                                </div>
                            </div>
                        </div>--%>
                        <!-- END STAT -->
                      <%--  <div>
                            <h4 class="profile-desc-title">About Marcus Doe</h4>
                            <span class="profile-desc-text">Lorem ipsum dolor sit amet diam nonummy nibh dolore. </span>
                            <div class="margin-top-20 profile-desc-link">
                                <i class="fa fa-globe"></i>
                                <a href="http://www.keenthemes.com">www.keenthemes.com</a>
                            </div>
                            <div class="margin-top-20 profile-desc-link">
                                <i class="fa fa-twitter"></i>
                                <a href="http://www.twitter.com/keenthemes/">@keenthemes</a>
                            </div>
                            <div class="margin-top-20 profile-desc-link">
                                <i class="fa fa-facebook"></i>
                                <a href="http://www.facebook.com/keenthemes/">keenthemes</a>
                            </div>
                        </div>--%>
                    </div>
                    <!-- END PORTLET MAIN -->
                </div>
                <!-- END BEGIN PROFILE SIDEBAR -->
                <!-- BEGIN PROFILE CONTENT -->
                <div class="profile-content">
                    <div class="row">
                        <div class="col-md-12">
                            <div id="myTabContent" class="tab-content">
                                <div class="tab-pane active" id="home">
                                    <table class="table table-responsive table-hover">
                                        <tr>
                                            <td>UserName: </td>
                                            <td>
                                                <asp:Label ID="lbUsename" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Your name: </td>
                                            <td>
                                                <asp:Label ID="lblFullname" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Date of birth: </td>
                                            <td>
                                                <asp:Label ID="lblDOB" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Gender: </td>
                                            <td>
                                                <asp:Label ID="lblGender" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Phone number: </td>
                                            <td>
                                                <asp:Label ID="lblPhone" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Email:</td>
                                            <td>
                                                <asp:Label ID="lblEmail" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Qualification</td>
                                            <td>
                                                <asp:Label ID="lblQualification" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>School</td>
                                            <td>
                                                <asp:Label ID="lblSchool" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>College</td>
                                            <td>
                                                <asp:Label ID="lblCollege" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Organization</td>
                                            <td>
                                                <asp:Label ID="lblOrganization" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Designation</td>
                                            <td>
                                                <asp:Label ID="lblDesignation" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Hobbies</td>
                                            <td>
                                                <asp:Label ID="lblHobies" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Cuisine</td>
                                            <td>
                                                <asp:Label ID="lblCuisine" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Sport</td>
                                            <td>
                                                <asp:Label ID="lblSport" runat="server"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </div>
                                <div class="tab-pane" id="setting">

                                    <div class="portlet light">
                                        <div class="portlet-title tabbable-line">
                                            <div class="caption caption-md">
                                                <i class="icon-globe theme-font hide"></i>
                                                <span class="caption-subject font-blue-madison bold uppercase">Profile Account</span>
                                            </div>
                                            <ul class="nav nav-tabs">
                                                <li class="active">
                                                    <a href="#tab_1_1" data-toggle="tab">Personal Info</a>
                                                </li>
                                                <li>
                                                    <a href="#tab_1_2" data-toggle="tab">Change Avatar</a>
                                                </li>
                                                <li>
                                                    <a href="#tab_1_3" data-toggle="tab">Change Password</a>
                                                </li>
                                                <%--<li>
                                                    <a href="#tab_1_4" data-toggle="tab">Privacy Settings</a>
                                                </li>--%>
                                            </ul>
                                        </div>
                                        <div class="portlet-body">
                                            <div class="tab-content">
                                                <!-- PERSONAL INFO TAB -->
                                                <div class="tab-pane active" id="tab_1_1">

                                                    <div class="form-group">
                                                        <label class="control-label">Full Name</label>
                                                        <asp:TextBox runat="server" CssClass="form-control" placeholder="Enter your name" ID="txtFullname"></asp:TextBox>
                                                        <asp:RequiredFieldValidator ControlToValidate="txtFullname"  ValidationGroup="profile" ID="RequiredFieldValidator1" runat="server" ErrorMessage="Your name is required"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="control-label">Email</label>
                                                        <asp:TextBox runat="server" CssClass="form-control" placeholder="Your Email address" ID="txtEmail"></asp:TextBox>
                                                        <asp:RegularExpressionValidator ControlToValidate="txtEmail" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="profile" ID="RegularExpressionValidator1" runat="server" ErrorMessage="Email is not correct format"></asp:RegularExpressionValidator>

                                                    </div>
                                                    <div class="form-group">
                                                        <label class="control-label">Mobile Number</label>
                                                        <asp:TextBox runat="server" CssClass="form-control" placeholder="your phone number" ID="txtPhone"></asp:TextBox>
                                                        <asp:RequiredFieldValidator  ValidationGroup="profile" ControlToValidate="txtPhone" ID="RequiredFieldValidator2" runat="server" ErrorMessage="Phone is required"></asp:RequiredFieldValidator>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="control-label">Gender</label>
                                                        <asp:RadioButton ID="male" GroupName="gender" runat="server" Text="Male" />
                                                        <asp:RadioButton ID="fmale" GroupName="gender" runat="server" Text="Female" />

                                                    </div>
                                                    <div class="form-group">
                                                        <label class="control-label">DateOfBirth</label>
                                                        <asp:TextBox runat="server" CssClass="form-control" ID="txtDOB"></asp:TextBox>

                                                    </div>
                                                    <div class="form-group">
                                                        <label class="control-label">Qualification</label>
                                                        <asp:TextBox runat="server" CssClass="form-control" placeholder="What are qualifications you've got?" ID="txtQualification"></asp:TextBox>

                                                    </div>
                                                    <div class="form-group">
                                                        <label class="control-label">School</label>
                                                        <asp:TextBox runat="server" CssClass="form-control" placeholder="Your school" ID="txtSchool"></asp:TextBox>
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="control-label">college</label>
                                                        <asp:TextBox runat="server" CssClass="form-control" placeholder="Your college" ID="txtCollege"></asp:TextBox>

                                                    </div>
                                                    <div class="form-group">
                                                        <label class="control-label">Works tatus</label>
                                                        <asp:TextBox runat="server" CssClass="form-control" placeholder="Where are you work now" ID="txtWork"></asp:TextBox>

                                                    </div>
                                                    <div class="form-group">
                                                        <label class="control-label">Organization</label>
                                                        <asp:TextBox runat="server" CssClass="form-control" placeholder="Organization" ID="txtOrganization"></asp:TextBox>

                                                    </div>
                                                    <div class="form-group">
                                                        <label class="control-label">Designation</label>
                                                        <asp:TextBox runat="server" CssClass="form-control" placeholder="Designation" ID="txtDesignation"></asp:TextBox>

                                                    </div>
                                                    <div class="form-group">
                                                        <label class="control-label">Hobbies</label>
                                                        <asp:TextBox runat="server" CssClass="form-control" placeholder="Your hobbies" ID="txtHobies"></asp:TextBox>

                                                    </div>
                                                    <div class="form-group">
                                                        <label class="control-label">Cuisine</label>
                                                        <asp:TextBox runat="server" CssClass="form-control" placeholder="What's your favorite food?" ID="txtCuisine"></asp:TextBox>

                                                    </div>
                                                    <div class="form-group">
                                                        <label class="control-label">Sport</label>
                                                        <asp:TextBox runat="server" CssClass="form-control" placeholder="Sport you play" ID="txtSport"></asp:TextBox>

                                                    </div>
                                                    <div class="margiv-top-10">
                                                      <asp:LinkButton  ValidationGroup="profile" ID="editProfile" runat="server" OnClick="editProfile_Click" CssClass="btn btn-success">Save</asp:LinkButton>
                                                       
                                                    </div>

                                                </div>
                                                <!-- END PERSONAL INFO TAB -->
                                                <!-- CHANGE AVATAR TAB -->
                                                <div class="tab-pane" id="tab_1_2">
                                                    <fieldset style="width: 300px;">
                                                        <legend>Show image preview before image upload</legend>
                                                        <div style="text-align: center;">
                                                            <asp:Image ID="ImgPrv" CssClass="img-responsive img-circle" Width="150px" Height="150px" runat="server" /><br />
                                                            <asp:FileUpload CssClass="btn btn-default" ID="flupImage" runat="server" onchange="ShowImagePreview(this);" />
                                                            <asp:LinkButton CssClass="btn btn-success" runat="server" OnClick="imgUpload_Click" ID="imgUpload"><i class="fa fa-upload"></i> Upload & Change Avatar</asp:LinkButton>
                                                        </div>
                                                    </fieldset>
                                                </div>
                                                <!-- END CHANGE AVATAR TAB -->
                                                <!-- CHANGE PASSWORD TAB -->
                                                <div class="tab-pane" id="tab_1_3">

                                                    <div class="form-group">
                                                        <label class="control-label">Current Password</label>
                                                        <asp:TextBox runat="server" TextMode="Password" ID="oldpass" CssClass="form-control" />

                                                    </div>
                                                    <div class="form-group">
                                                        <label class="control-label">New Password</label>
                                                        <asp:TextBox runat="server" ID="newpass" TextMode="Password" CssClass="form-control" />
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="control-label">Re-type New Password</label>
                                                        <asp:TextBox runat="server" ID="retype" TextMode="Password" CssClass="form-control" />
                                                    </div>
                                                    <div class="margin-top-10">
                                                        <asp:LinkButton CssClass="btn btn-success" runat="server" ID="changepass" OnClick="changepass_Click"><i class="fa fa-save"></i> Save</asp:LinkButton>

                                                    </div>

                                                </div>
                                                <!-- END CHANGE PASSWORD TAB -->
                                                <!-- PRIVACY SETTINGS TAB -->
                                                <div class="tab-pane" id="tab_1_4">

                                                    <table class="table table-light table-hover">
                                                       
                                                        <tr>
                                                            <td>Share my personal detail with my contact
                                                            </td>
                                                            <td>
                                                                <label class="uniform-inline">
                                                                    <input type="checkbox" value="" />
                                                                    Yes
                                                                </label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Prevent friend request send
                                                            </td>
                                                            <td>
                                                                <label class="uniform-inline">
                                                                    <input type="checkbox" value="" />
                                                                    Yes
                                                                </label>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>Deactive your account
                                                            </td>
                                                            <td>
                                                                <label class="uniform-inline">
                                                                    <input type="checkbox" value="" />
                                                                    Yes
                                                                </label>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                    <!--end profile-settings-->
                                                    <div class="margin-top-10">
                                                        <a href="#" class="btn green-haze">Save Changes </a>
                                                        <a href="#" class="btn default">Cancel </a>
                                                    </div>
                                                </div>
                                                <!-- END PRIVACY SETTINGS TAB -->
                                            </div>
                                        </div>
                                    </div>

                                </div>
                                <div class="tab-pane" id="tasks">
                                    <div class="panel-info">
                                        When deactive your account, all of your information include SMS, Contact infor, your photo will be delete! 
                                        Be careful with your choose!
                                    </div>
                                    <div>
                                        <asp:Label ID="returndelete" runat="server"></asp:Label>  <br />
                                        <asp:LinkButton runat="server" CssClass="btn btn-danger" ID="deactive" OnClick="deactive_Click" OnClientClick="return confirm('Are you sure?')"><i class="fa fa-user-secret"></i> Deactive your account</asp:LinkButton>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>
                </div>
                <!-- END PROFILE CONTENT -->
            </div>
        </div>
        <!-- END PAGE CONTENT-->

    </div>
     <script type="text/javascript">
         function ShowImagePreview(input) {
             if (input.files && input.files[0]) {
                 var reader = new FileReader();
                 reader.onload = function (e) {
                     $('#<%=ImgPrv.ClientID%>').prop('src', e.target.result)
                    };
                    reader.readAsDataURL(input.files[0]);
                    }
                }
    </script>
   <script>
       $(document).ready(function () {
           var dp = $('#<%=txtDOB.ClientID%>');
               dp.datepicker({
                   changeMonth: true,
                   changeYear: true,
                   format: "dd/mm/yyyy",
                   language: "en"
               }).on('changeDate', function (ev) {
                   $(this).blur();
                   $(this).datepicker('hide');
               });
           });
    </script>  
</asp:Content>



