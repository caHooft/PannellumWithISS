using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Script.Services;
using System.Web.Services;

namespace PannellumViewer.WebServices
{
    /// <summary>
    /// Web service component
    /// Sends 2 points and recieves 1 point
    /// Send Point 1 is the 3D point camera position (x,y,z)
    /// Send Point 2 is a 3D point in the pointcloud (x,y,z)
    /// The return is a single 3D point(what the ray(that is based on the direction between camera position and the 3D point) has hit inside the pointcloud)
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    [System.Web.Script.Services.ScriptService]
    public class WebService1 : System.Web.Services.WebService
    {
        [WebMethod]
        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json, XmlSerializeString = false)]
        //public string SendPoints(Point point1, Point vector1, Point currentCenterDirection
        public string SendPoints(Point point1, Point point2, Point point3)
        {
            List<Point> points = new List<Point>
            {
                point1,
                point2,
                point3
            };

            //PointCloudID = "sample.las";
            return JsonConvert.SerializeObject(points);
        }
    }
}
