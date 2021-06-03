using PannellumViewer;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;


namespace PannellumViewer
{
    public class GetDirectionVector
    {
        public double ConvertToRadians(double angle)
        {
            return (Math.PI / 180) * angle;
        }

        Vector getDirectionVector(double pitch, double yaw)
        {
            double pitchRadians = ConvertToRadians(pitch);
            double yawRadians = ConvertToRadians(yaw);

            double sinPitch = Math.Sin(pitchRadians);
            double cosPitch = Math.Cos(pitchRadians);
            double sinYaw = Math.Sin(yawRadians);
            double cosYaw = Math.Cos(yawRadians);

            return new Vector(-cosPitch * sinYaw, sinPitch, -cosPitch * cosYaw);
        }
    }
}

