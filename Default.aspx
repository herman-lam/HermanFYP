<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Interactive Exploration</title>
    <meta name="viewport" content="initial-scale=1.0">
        <meta charset="utf-8">
        <style>
        html, body {
            height: 100%;
            margin: 0;
            padding: 0;
        }
        #map {
            height: 100%;
        }
        </style>
    </head>

    <script src="http://code.jquery.com/jquery-1.9.0.js"></script>
    <script src="https://code.highcharts.com/highcharts.js"></script>
    <script src="https://code.highcharts.com/modules/exporting.js"></script>

    <script>
        var map;
        function initMap() {
            map = new google.maps.Map(document.getElementById('map'), {center: {lat: 22.168505, lng: 113.560539}, zoom: 13});
        }
    </script>
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDdSbxgDLATykOGf0yGqdM6PbBSms90pg4&callback=initMap"
        async defer></script>

    <script>
        $(function () {
            $('#container').highcharts({
                title: {
                    text: 'Air Quality Sensor Readings',
                    x: -20 //center
                },
                subtitle: {
                    text: 'Interactive Exploration',
                    x: -20
                },
                xAxis: {
                    title: {
                        text: 'Time'
                    },
                    categories: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12']
                },
                yAxis: {
                    title: {
                        text: 'Readings'
                    },
                    plotLines: [{
                        value: 0,
                        width: 1,
                        color: '#808080'
                    }]
                },
                tooltip: {
                    valueSuffix: '°C'
                },
                legend: {
                    layout: 'vertical',
                    align: 'right',
                    verticalAlign: 'middle',
                    borderWidth: 0
                },
                series: [{
                    name: '%RH',
                    data: [7.0, 6.9, 9.5, 14.5, 18.2, 21.5, 25.2, 26.5, 23.3, 18.3, 13.9, 9.6]
                }, {
                    name: 'ETHANOL ppm',
                    data: [-0.2, 0.8, 5.7, 11.3, 17.0, 22.0, 24.8, 24.1, 20.1, 14.1, 8.6, 2.5]
                }, {
                    name: 'H2S ppm',
                    data: [-0.9, 0.6, 3.5, 8.4, 13.5, 17.0, 18.6, 17.9, 14.3, 9.0, 3.9, 1.0]
                }, {
                    name: 'Pressure mbar',
                    data: [3.9, 4.2, 5.7, 8.5, 11.9, 15.2, 17.0, 16.6, 14.2, 10.3, 6.6, 4.8]
                }, {
                    name: 'TOLUENE ppm',
                    data: [4.9, 3.2, 6.7, 9.5, 10.9, 17.2, 16.0, 15.6, 15.2, 11.3, 7.6, 5.8]
                }]
            });
        });

    </script>
    
<body>
    <form id="form1" runat="server">
    <div>
    
        Interactive Exploration of Sensor Data in Vehicle Traces</div>
        <div>
            Query Day:
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem>1</asp:ListItem>
            </asp:DropDownList>
        </div>
    </form>
    <div style="align-items:center;">
    <div id="map" style="height: 595px; width: 655px; display:inline-block;"></div>
    <div id="container" style="height: 595px; width: 655px; display:inline-block;"></div>
    </body>
    </div>
</html>
