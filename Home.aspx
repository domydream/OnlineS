﻿<%@ Page Title="" Language="C#" MasterPageFile="~/MyMasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    
        <div class="row">
            <div class="col-md-12">
                <h2>ONLINE SMS </h2>
                <h5>Welcome 
                    <asp:Label runat="server" ID="funame"></asp:Label>, Love to see you back. </h5>
            </div>
        </div>
        <!-- /. ROW  -->
        <hr />
        <div class="row">          

            <div class="col-md-3 col-sm-6 col-xs-6">
                <div class="panel panel-back noti-box">
                    <span class="icon-box bg-color-red set-icon">
                        <i class="fa fa-envelope-o"></i>
                    </span>
                    <div class="text-box">
                        <p class="main-text">120 New</p>
                        <p class="text-muted">SMS</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6 col-xs-6">
                <div class="panel panel-back noti-box">
                    <span class="icon-box bg-color-green set-icon">
                        <i class="fa fa-bars"></i>
                    </span>
                    <div class="text-box">
                        <p class="main-text">30 Tasks</p>
                        <p class="text-muted">Remaining</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6 col-xs-6">
                <div class="panel panel-back noti-box">
                    <span class="icon-box bg-color-blue set-icon">
                        <i class="fa fa-bell-o"></i>
                    </span>
                    <div class="text-box">
                        <p class="main-text">240 New</p>
                        <p class="text-muted">Notifications</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 col-sm-6 col-xs-6">
                <div class="panel panel-back noti-box">
                    <span class="icon-box bg-color-brown set-icon">
                        <i class="fa fa-users"></i>
                    </span>
                    <div class="text-box">
                        <p class="main-text">3 Friend </p>
                        <p class="text-muted">Request</p>
                    </div>
                </div>
            </div>
            <!-- /. ROW  -->
            <hr />
            <div class="row">
                <div class="col-md-6 col-sm-12 col-xs-12">
                    <div class="panel panel-back noti-box">
                        <span class="icon-box bg-color-blue">
                            <i class="fa fa-warning"></i>
                        </span>
                        <div class="text-box">
                            <p class="main-text">52 Important Issues to Fix </p>
                            <p class="text-muted">Please fix these issues to work smooth</p>
                            <p class="text-muted">Time Left: 30 mins</p>
                            <hr />
                            <p class="text-muted">
                                <span class="text-muted color-bottom-txt"><i class="fa fa-edit"></i>
                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit gthn. 
                              Lorem ipsum dolor sit amet, consectetur adipiscing elit gthn. 
                                </span>
                            </p>
                        </div>
                    </div>
                </div>


                <div class="col-md-3 col-sm-12 col-xs-12">
                    <div class="panel back-dash">
                        <i class="fa fa-dashboard fa-3x"></i><strong>&nbsp; SPEED</strong>
                        <p class="text-muted">Lorem ipsum dolor sit amet, consectetur adipiscing sit ametsit amet elit ftr. Lorem ipsum dolor sit amet, consectetur adipiscing elit. </p>
                    </div>

                </div>
                <div class="col-md-3 col-sm-12 col-xs-12 ">
                    <div class="panel ">
                        <div class="main-temp-back">
                            <div class="panel-body">
                                <div class="row">
                                    <div class="col-xs-6"><i class="fa fa-cloud fa-3x"></i>Newyork City </div>
                                    <div class="col-xs-6">
                                        <div class="text-temp">10° </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                    <div class="panel panel-back noti-box">
                        <span class="icon-box bg-color-green set-icon">
                            <i class="fa fa-desktop"></i>
                        </span>
                        <div class="text-box">
                            <p class="main-text">Display</p>
                            <p class="text-muted">Looking Good</p>
                        </div>
                    </div>

                </div>

            </div>
            
        </div>
    
</asp:Content>