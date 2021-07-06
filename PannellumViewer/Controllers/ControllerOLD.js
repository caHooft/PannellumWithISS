class ControllerOLD
{      constructor() 
    {

    }

    function UpdatePoint2(pitch, yaw) {
        var values = getDirectionVector(pitch, yaw);

        point2 =
        {
            X: values[0],
            Y: (values[2]),
            Z: values[1]
        };
    }

    function ConvertToRadians(angle) {

        return (Math.PI / 180) * angle;
    }

    function getDirectionVector(pitch, yaw) {
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
}
