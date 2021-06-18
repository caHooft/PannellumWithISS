<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Pannellum</title>
    <link href="Script/css/pannellum.css" rel="stylesheet" />
    <script src="Script/jquery/jquery-1.11.1.js"></script>
    <script src="Script/js/pannellum.js"></script>
    <script src="Script/js/libpannellum.js"></script>
    
</head>
<body>
    <form id="form1" runat="server">
        <div class='Pannellum-Wrapper'>
            <div class="row">

                <div class="column">
                    <div id="showXY">
                        <label for="X"><strong>X:</strong></label>
                        <br />
                        <label for="Y"><strong>Y:</strong></label>
                    </div>
                </div>

                <div class="column">
                    <div id="showCoordinate">
                        <label for="pitch"><strong>Pitch:</strong></label>
                        <br />
                        <label for="yaw"><strong>Yaw:</strong></label>
                    </div>
                </div>
            </div>

            <div class="row2">

                <div class="column">

                    <div class="image">
                        <!--<img src="360images/trafficSign/stream_00002-000000_00020_0000043.jpg" style="width: 100%; height: 100%;" />!-->
                        <img src="360images/Images filtered_aoi/stream_00004-000000_00016_0000187.jpg" style="width: 100%; height: 100%;" />
                    </div>
                </div>

                <div class="column">
                    <div id="panorama">
                        <div id="controls">
                            <div class="ctrl" id="send">xyz</div>
                            <div class="ctrl" id="center-image">&#9635;</div>
                            <div class="ctrl" id="pan-up">&#9650;</div>
                            <div class="ctrl" id="pan-down">&#9660;</div>
                            <div class="ctrl" id="pan-left">&#9664;</div>
                            <div class="ctrl" id="pan-right">&#9654;</div>
                            <div class="ctrl" id="zoom-in">&plus;</div>
                            <div class="ctrl" id="zoom-out">&minus;</div>
                            <div class="ctrl" id="fullscreen">&#x2922;</div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
        <script>
            var point2 =
                //Point1 is camera position
            {
                X: "0.1",
                Y: "0.1",
                Z: "0.1"
            };
            
            //Print yaw/pitch useing jQuery
            var PrintCoordinate = function (hotSpotDiv, args) {
                var pitch = args.pitch;
                jQuery("label[for='pitch']").html("<strong>Pitch: </strong>" + pitch);
                var yaw = args.yaw;
                jQuery("label[for='yaw']").html("<strong>Yaw: </strong>" + yaw);
            };
            //Print x/y useing jQuery
            var PrintCoordinateXY = function (hotSpotDiv, args) {
                var X = args.X;
                jQuery("label[for='X']").html("<strong>X: </strong>" + X);
                var Y = args.Y;
                jQuery("label[for='Y']").html("<strong>Y: </strong>" + Y);
            };

            // script that debugs 2D image on click based on 8000 by 4000 image
            var origonalImageX = 8000;
            var origonalImageY = 4000;
            $(document).ready(function () {
                $('img').click(function (e) {
                    var offset = $(this).offset();
                    var x = (e.pageX - offset.left) * (origonalImageX / form1.children[1].children[1].children[0].clientWidth);
                    var y = (e.pageY - offset.top) * (origonalImageY / form1.children[1].children[1].children[0].clientHeight);

                    var X = Math.round((x + Number.EPSILON) * 100) / 100;
                    var Y = Math.round((y + Number.EPSILON) * 100) / 100;
                    jQuery("label[for='X']").html("<strong>X: </strong>" + X);
                    jQuery("label[for='Y']").html("<strong>Y: </strong>" + Y);

                    var k = origonalImageX / 360;
                    vert_angle_of_view = origonalImageY / k;

                    yaw = (k * -180 + x) / k;
                    pitch = (0.5 * k * vert_angle_of_view - y) / k

                    var Pitch = Math.round((pitch + Number.EPSILON) * 100) / 100;
                    var Yaw = Math.round((yaw + Number.EPSILON) * 100) / 100;

                    jQuery("label[for='pitch']").html("<strong>Pitch: </strong>" + Pitch);
                    jQuery("label[for='yaw']").html("<strong>Yaw: </strong>" + Yaw);
                });
            });

            viewer = pannellum.viewer('panorama',
            {
                "default":
                {
                    "firstScene": "First",
                    "author": "HawarIT",
                    "sceneFadeDuration": 1000,
                    autoLoad: true,
                    "showControls": false

                },
                "scenes":
                {
                    "First":
                    {
                        "title": "Area of interest 1",
                        "type": "equirectangular",
                        "panorama": "360images/Images filtered_aoi/stream_00004-000000_00016_0000187.jpg",
                            
                    },

                    /*
                    Tilburg
                    "First":
                    {
                        "title": "Tilburg 1",
                        "type": "equirectangular",
                        "panorama": "360images/trafficSign/stream_00002-000000_00020_0000043.jpg",
                        "hotSpots":
                            [{
                                "pitch": 0,
                                "yaw": 0,
                                "type": "scene",
                                "text": "Tilburg 2",
                                "sceneId": "Second"
                            },
                            {
                                "pitch": -37,
                                "yaw": -178,
                                "type": "info",
                                "text": "extreme pitch and yaw example (car)"
                            },
                            {
                                "pitch": 0,
                                "yaw": -178,
                                "type": "info",
                                "text": "extreme yaw example (roundabout)"
                            },
                            {
                                "pitch": -54,
                                "yaw": 0,
                                "type": "info",
                                "text": "extreme pitch example (car)"
                            }
                            ]
                    },

                    "Second":
                    {
                        "title": "Tilburg 2",
                        "type": "equirectangular",
                        "panorama": "360images/trafficSign/stream_00002-000000_00007_0000030.jpg",
                        "hotSpots":
                            [{
                                "pitch": 0,
                                "yaw": 0,
                                "type": "scene",
                                "text": "Tilburg 1",
                                "sceneId": "First",
                            }]
                    }
                    */
                }
            });
            /*    
            function download(strData, strFileName, strMimeType)
            {
                var D = document,
                    A = arguments,
                    a = D.createElement("a"),
                    d = A[0],
                    n = A[1],
                    t = A[2] || "text/plain";

                //build download link:
                a.href = "data:" + strMimeType + "charset=utf-8," + escape(strData);
                
                if (window.MSBlobBuilder)
                { // IE10
                    var bb = new MSBlobBuilder();
                    bb.append(strData);
                    return navigator.msSaveBlob(bb, strFileName);
                } 
                //end if(window.MSBlobBuilder) 

                if ('download' in a)
                { //FF20, CH19
                    a.setAttribute("download", n);
                    a.innerHTML = "downloading...";
                    D.body.appendChild(a);
                    setTimeout(function ()
                    {
                        var e = D.createEvent("MouseEvents");
                        e.initMouseEvent("click", true, false, window, 0, 0, 0, 0, 0, false, false, false, false, 0, null);
                        a.dispatchEvent(e);
                        D.body.removeChild(a);
                    }, 66);
                    return true;
                }; /* end if('download' in a) */

                //do iframe dataURL download: (older W3)
                var f = D.createElement("iframe");
                D.body.appendChild(f);
                f.src = "data:" + (A[2] ? A[2] : "application/octet-stream") + (window.btoa ? ";base64" : "") + "," + (window.btoa ? window.btoa : escape)(strData);
                setTimeout(function () 
                {
                    D.body.removeChild(f);
                }, 333);
                return true;
            }*/

            function UpdatePoint2(pitch,yaw)
            {

                var values = getDirectionVector(pitch, yaw);

                point2 =
                {
                    X: values[0],
                    Y: values[1],
                    Z: values[2]
                };
            }

            function ConvertToRadians(angle)
            {
            
                return (Math.PI / 180) * angle;
            }

            function getDirectionVector(pitch, yaw)
            {
                var pitchRadians = ConvertToRadians(pitch);
                var yawRadians = ConvertToRadians(yaw);

                var sinPitch = Math.sin(pitchRadians);
                var cosPitch = Math.cos(pitchRadians);
                var sinYaw = Math.sin(yawRadians);
                var cosYaw = Math.cos(yawRadians);

                return [-cosPitch * sinYaw, sinPitch, -cosPitch * cosYaw];
            }

            function convertPitchYaw(pitch, yaw) {
                var k = 8000 / 360;

                vert_angle_of_view = 4000 / k;

                var x = k * (yaw + 0.5 * 360);
                var y = k * ((pitch * -1) + 0.5 * vert_angle_of_view);

                var X = Math.round((x + Number.EPSILON) * 100) / 100;
                var Y = Math.round((y + Number.EPSILON) * 100) / 100;

                jQuery("label[for='X']").html("<strong>X: </strong>" + X);
                jQuery("label[for='Y']").html("<strong>Y: </strong>" + Y);
            }

            function CenterImage() {
                pitch = viewer.getPitch();
                yaw = viewer.getYaw();
                //viewer.getHfov() = fov;

                jQuery("label[for='pitch']").html("<strong>Pitch: </strong>" + pitch);
                jQuery("label[for='yaw']").html("<strong>Yaw: </strong>" + yaw);

                convertPitchYaw(pitch, yaw);
            }

            viewer.on('mousedown', function (event) {
                // coords[0] is pitch, coords[1] is yaw
                var coords = viewer.mouseEventToCoords(event);

                jQuery("label[for='pitch']").html("<strong>Pitch: </strong>" + coords[0]);
                jQuery("label[for='yaw']").html("<strong>Yaw: </strong>" + coords[1]);

                convertPitchYaw(coords[0], coords[1]);
                UpdatePoint2(coords[0], coords[1]);
            });

            //dead center button
            document.getElementById('center-image').addEventListener('click', function (e) {
                CenterImage();
            });
            document.getElementById('send').addEventListener('click', function (e) {
                // Call WebService
                //Point1 is camera position
                var point1 =                        
                {
                    //Tilburg 1 camera position
                    //X: "127791.452",
                    //Y: "398638.122",
                    //Z: "11.699"

                    //Suruz segmented pointcloud camera position
                    X: "131463.544",
                    Y: "398806.108",
                    Z: "16.816"
                };            

                pitch = viewer.getPitch();
                yaw = viewer.getYaw();
                var values = getDirectionVector(pitch, yaw);

                var point3 =
                {
                    X: values[0],
                    Y: values[1],
                    Z: values[2]
                };                    
                    
                $.ajax
                ({
                    type: 'POST',
                    dataType: "json",
                    url: 'http://localhost/WebService1/WebService1.asmx/GetPointcloudPoint',
                    data: '{"point1": ' + JSON.stringify(point1) + ', "point2": ' + JSON.stringify(point2) + ', "point3": ' + JSON.stringify(point3) + '}',
                        
                    contentType: "application/json",

                    success: function (response)
                    {
                        //console.log(JSON.parse(response.d))
                        console.log(response.d),
                        alert("succesvol send");
                    },
                    error: function (xhr, textStatus, errorThrown)
                    {
                        alert('Error occurred.');
                    }
                });
                    
            });
            document.getElementById('pan-up').addEventListener('click', function (e) {
                viewer.setPitch(viewer.getPitch() + 10);
            });
            document.getElementById('pan-down').addEventListener('click', function (e) {
                viewer.setPitch(viewer.getPitch() - 10);
            });
            document.getElementById('pan-left').addEventListener('click', function (e) {
                viewer.setYaw(viewer.getYaw() - 10);
            });
            document.getElementById('pan-right').addEventListener('click', function (e) {
                viewer.setYaw(viewer.getYaw() + 10);
            });
            document.getElementById('zoom-in').addEventListener('click', function (e) {
                viewer.setHfov(viewer.getHfov() - 10);
            });
            document.getElementById('zoom-out').addEventListener('click', function (e) {
                viewer.setHfov(viewer.getHfov() + 10);
            });
            document.getElementById('fullscreen').addEventListener('click', function (e) {
                viewer.toggleFullscreen();
            });
        </script>
    </form>
</body>
</html>