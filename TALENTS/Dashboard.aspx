<%@ Page Title="" Language="C#" MasterPageFile="~/Page.Master" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="TALENTS.Dashboard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeaderPlaceHolder" runat="server">
    <style>
        .img-title img {
            width:370px;
            min-width:100%;
        }

        .select2-selection.select2-selection--single {
            box-shadow: none !important;
            border: none;
            height: 45px !important;
        }

        #select2-ComboCity-container {
            text-align: center
        }

        .select2.select2-container.select2-container--bootstrap {
            width: 100% !important;
        }
        
    </style>
    <style>
        .box {
            position: relative;
            background: #eeee;
            float: left;
        }

        .ribbon {
            position: absolute;
            right: -5px;
            top: -5px;
            z-index: 1;
            overflow: hidden;
            width: 93px;
            height: 93px;
            text-align: right;
        }

        .ribbon span {
            font-size: 0.8rem;
            color: #fff;
            text-transform: uppercase;
            text-align: center;
            font-weight: bold;
            line-height: 32px;
            transform: rotate(45deg);
            width: 125px;
            display: block;
            background: #79a70a;
            background: linear-gradient(#9bc90d 0%, #79a70a 100%);
            box-shadow: 0 3px 10px -5px rgba(0, 0, 0, 1);
            position: absolute;
            top: 17px;
        }

        .ribbon span::before {
            content: '';
            position: absolute;
            left: 0px;
            top: 100%;
            z-index: -1;
            border-left: 3px solid #79A70A;
            border-right: 3px solid transparent;
            border-bottom: 3px solid transparent;
            border-top: 3px solid #79A70A;
        }

        .ribbon span::after {
            content: '';
            position: absolute;
            right: 0%;
            top: 100%;
            z-index: -1;
            border-right: 3px solid #79A70A;
            border-left: 3px solid transparent;
            border-bottom: 3px solid transparent;
            border-top: 3px solid #79A70A;
        }

        .red span {
            background: linear-gradient(#f70505 0%, #8f0808 100%);
        }

        .red span::before {
            border-left-color: #8f0808;
            border-top-color: #8f0808;
        }

        .red span::after {
            border-right-color: #8f0808;
            border-top-color: #8f0808;
        }

        .blue span {
            background: linear-gradient(#2989d8 0%, #1e5799 100%);
        }

        .blue span::before {
            border-left-color: #1e5799;
            border-top-color: #1e5799;
        }

        .blue span::after {
            border-right-color: #1e5799;
            border-top-color: #1e5799;
        }

        .gray span {
            background: linear-gradient(#555555 0%, #000000 100%);
        }

        .gray span::before {
            border-left-color: gray;
            border-top-color: gray;
        }

        .gray span::after {
            border-right-color: gray;
            border-top-color: gray;
        }

        .foo {
            clear: both;
        }

        .bar {
            content: "";
            left: 0px;
            top: 100%;
            z-index: -1;
            border-left: 3px solid #79a70a;
            border-right: 3px solid transparent;
            border-bottom: 3px solid transparent;
            border-top: 3px solid #79a70a;
        }

        .baz {
            font-size: 1rem;
            color: #fff;
            text-transform: uppercase;
            text-align: center;
            font-weight: bold;
            line-height: 2em;
            transform: rotate(45deg);
            width: 100px;
            display: block;
            background: #79a70a;
            background: linear-gradient(#9bc90d 0%, #79a70a 100%);
            box-shadow: 0 3px 10px -5px rgba(0, 0, 0, 1);
            position: absolute;
            top: 100px;
            left: 1000px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <div class="hero-slider">
        <div class="slider-item">
            <div class="set-bg" style="padding-top: 180px;background-color:white">
                <form class="custom-form hero-form" id="form1" runat="server" autocomplete="off">
                    <asp:HiddenField ID="HfModelInfo" runat="server" ClientIDMode="Static" />
                    <div class="container" style="max-width: 1200px; padding-bottom: 50px;">
                        <div class="row mb-5" style="border: 1px solid; border-color: black; border-radius:4px; margin-left: auto; margin-right: auto; padding: 20px">
                            <h2 class="text-black pt-3 pb-5 d-block text-center col-12">RICERCA</h2>
                            <div class="input-group mb-4 input-group-lg col-12 col-md-6 ml-auto text-right">
                                <div class="input-group-prepend">
                                    <span class="input-group-text">CITTA</span>
                                </div>
                                <div class="form-control pt-0 pb-0 pr-0">
                                    <asp:DropDownList runat="server" ID="ComboCity" CssClass="custom-select" ClientIDMode="Static"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="col-12 col-md-2 text-right mr-auto">
                                <asp:Button runat="server" ID="BtnSearch" Text="RICERCA" CssClass="btn btn-block btn-dark btn-lg text-white" OnClick="BtnSearch_Click" />
                            </div>
                        </div>
                        <div>
                            <div id="map" style="width: 100%; height: 400px;"></div>
                        </div>
                        <div class="row">
                            <asp:Repeater runat="server" ID="ModelPhotoRepeater">
                                <ItemTemplate>
                                    <div class="col-lg-4 col-12 text-center p-3">
                                        <div class="row">
                                            <div class="col-12" style="height:426px; overflow:hidden;padding:10px;">
                                                <%# Eval("Mark") %>
                                                <a href="DashboardDetail.aspx?modelId=<%#Eval("Id") %>" class="img-title">
                                                    <image src="Upload/Photos/<%#Eval("Image") %>"></image>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-12 pt-4">
                                                <a href="DashboardDetail.aspx?modelId=<%#Eval("Id") %>">
                                                    <h2 class="text-black pb-3 text-left"><%#Eval("Name") %></h2>
                                                </a>
                                                <h5 class="text-black text-left"><%#Eval("CityResidence") %></h5>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="FooterPlaceHolder" runat="server">
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAZW9nB5fEUjXz15U9s6sRZkMPU_SrV3P0"></script>
    <script>
        // Initialize the map
        var allMarkers = [];
        var allContent = [];
        function initMap() {
            var map = new google.maps.Map(document.getElementById('map'), {
                center: { lat: 40.8518, lng: 14.2681 },
                zoom: 5
            });

            // Try HTML5 geolocation to get the user's current position
            if (navigator.geolocation) {
                navigator.geolocation.getCurrentPosition(function (position) {
                    var pos = {
                        lat: position.coords.latitude,
                        lng: position.coords.longitude
                    };

                    // Add a marker for the user's current position
                    var marker = new google.maps.Marker({
                        position: pos,
                        map: map,
                        title: 'My Location'
                    });

                    // Center the map on the user's current position
                    map.setCenter(pos);

                    var infowindow = new google.maps.InfoWindow({
                        content: '<h5>My Location</h5>Latitude: ' + marker.getPosition().lat() +
                            '<br>Longitude: ' + marker.getPosition().lng(),
                    });

                    marker.addListener('click', function () {
                        infowindow.open(map, this);
                    });
                }, function () {
                    // Handle errors with geolocation
                    console.log('Error: The Geolocation service failed.');
                });
            } else {
                // Browser doesn't support Geolocation
                console.log('Error: Your browser doesn\'t support geolocation.');
            }

            var modelInfo = JSON.parse($("#HfModelInfo").val());
            
            for (let i = 0; i < modelInfo.length; i++) {
                var model = modelInfo[i];
                var info = '<div class="d-flex p-1">' +
                    '<div class="pr-2">' + '<image src="Upload/Photos/' + model.Image + '" width="50px"></image>' + '</div>' +
                    '<div><h5>' + model.Name + '</h5><p class="mb-0">' + model.CityResidence + '</p>' + '<div class="text-right"><a href="DashboardDetail.aspx?modelId=' + model.Id + '">Detail</a></div>' + 
                    '</div>' + '</div>';

                var pos = {
                    lat: model.Lat,
                    lng: model.Lng,
                };

                var marker = new google.maps.Marker({
                    position: pos,
                    map: map, 
                });

                var infowindow;
                if (searchSameMarker(marker) != null) {
                    infowindow = new google.maps.InfoWindow({
                        content: info + allContent[searchSameMarker(marker)].getContent(),
                    });
                }
                else {
                    infowindow = new google.maps.InfoWindow({
                        content: info,
                    });
                }  

                allMarkers.push(marker);
                allContent.push(infowindow);

                marker.addListener('click', function () {
                    var markerIndex = allMarkers.indexOf(this);
                    allContent[markerIndex].open(map, this);
                });
            }

            google.maps.event.addListener(map, 'click', function (event) {
                placeCenter(event.latLng);
            });

            function placeCenter(location) {
                map.setCenter(location);
            }
        }

        function searchSameMarker(marker) {
            // Loop through existing markers
            var result = null;
            for (var i = 0; i < allMarkers.length; i++) {
                var existingMarker = allMarkers[i];
                var existingMarkerLat = existingMarker.getPosition().lat();
                var existingMarkerLng = existingMarker.getPosition().lng();

                // Compare coordinates
                if (existingMarkerLat === marker.getPosition().lat() && existingMarkerLng === marker.getPosition().lng()) {
                    // The new marker has the same coordinates as an existing marker
                    result = i;
                }
            }
            return result;
        }
                        </script>
    <script>
        document.addEventListener('DOMContentLoaded', initMap);
    </script>
    <script>
        $("#ComboCity").select2({ theme: 'bootstrap' }); 
    </script>
</asp:Content>
