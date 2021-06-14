//using Newtonsoft.Json;
//using System;
//using System.Collections.Generic;
//using System.Linq;
//using System.Runtime.InteropServices;
//using System.Web;
//using System.Web.Script.Services;
//using System.Web.Services;

//namespace PannellumViewer.WebServices
//{
//    /// <summary>
//    /// Web service component
//    /// Sends 2 points and recieves 1 point
//    /// Send Point 1 is the 3D point camera position (x,y,z)
//    /// Send Point 2 is a 3D point in the pointcloud (x,y,z)
//    /// The return is a single 3D point(what the ray(that is based on the direction between camera position and the 3D point) has hit inside the pointcloud)
//    /// </summary>
//    [WebService(Namespace = "http://tempuri.org/")]
//    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
//    [System.ComponentModel.ToolboxItem(false)]
//    [System.Web.Script.Services.ScriptService]
//    public class WebService1 : System.Web.Services.WebService
//    {
//        /[WebMethod]
//        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json, XmlSerializeString = false)]
//        //public string SendPoints(Point point1, Point vector1, Point currentCenterDirection
//        public string GetPointcloudPoint(Point point1, Point point2, Point point3)
//        {
//            List<Point> points = new List<Point>
//            {
//                point1,
//                point2,
//                point3
//            };

//            //PointCloudID = "sample.las";
//            return JsonConvert.SerializeObject(points);
//        }
//        static string LAS_FOLDER_PATH = "C:\\";
//        //{'min_x' :131431.51,'min_y' :398761.8,'min_z' :13.24,'max_x' :131495.23,'max_y' :398825.67,'max_z' :37.43}
//        double cloud_min_x = 131431.51;
//        double cloud_min_y = 398761.8;
//        double cloud_min_z = 13.24;

//        //[DllImport("LIBRAYCASTPOINTPCL18", CallingConvention = CallingConvention.Cdecl)]
//        //extern static bool PickPoint(double[] ray, double[] picked_point, float least_squared_distance_to_ray = (0.25f * 0.25f));
//        //bool load_once = false;

//        //[DllImport("LIBRAYCASTPOINTPCL18", CallingConvention = CallingConvention.Cdecl)]
//        //extern static void loadCloud(string file, double[] ray, float camera_fov = 90, float camera_aspect = 1, bool z_up = true);

//        //public void LoadOnce(string lasfile, double[] center_ray, float fov)
//        //{
//        //    loadCloud(LAS_FOLDER_PATH + lasfile, center_ray, (int)(fov * 0.5));
//        //}
//        [WebMethod]
//        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json, XmlSerializeString = false)]
//        public string GetPointcloudPoint(Point point1, Point point2, Point point3)
//        {
//            dynamic strPoint1 = JsonConvert.DeserializeObject(point1);

//            double p1x = strPoint1.X;
//            double p1y = strPoint1.Y;
//            double p1z = strPoint1.Z;

//            p1x = p1x - cloud_min_x;
//            p1y = p1y - cloud_min_y;
//            p1z = p1z - cloud_min_z;


//            dynamic strVector1 = JsonConvert.DeserializeObject(point2);
//            double v1x = strVector1.X;
//            double v1y = strVector1.Y;
//            double v1z = strVector1.Z;

//            dynamic strForward1 = JsonConvert.DeserializeObject(point3);
//            double fv1x = strForward1.X;
//            double fv1y = strForward1.Y;
//            double fv1z = strForward1.Z;

//            double[] pick_ray = { p1x, p1y, p1z, v1x, v1y, v1z };
//            double[] center_ray = { p1x, p1y, p1z,
//                                p1x + fv1x * 100,
//                                p1y + fv1y * 100,
//                                p1z + fv1z * 100 };

//            if (!load_once)
//            {
//                string PointCloudID = "sample_origin.las";
//                LoadOnce(PointCloudID, center_ray, 60);
//                load_once = true;
//            }

//            double[] point = { 0, 0, 0 };
//            PickPoint(pick_ray, point, 0.01f * 0.01f);

//            double retx = (cloud_min_x + point[0]);
//            double rety = (cloud_min_y + point[1]);
//            double retz = (cloud_min_z + point[2]);

//            string jsonPickedPoint = "{" + "'X' :" + retx + ",'Y' :" + rety + ",'Z' :" + retz + "}";
//            return jsonPickedPoint;
//        }
        
//            /*[WebMethod]
//        [ScriptMethod(UseHttpGet = false, ResponseFormat = ResponseFormat.Json, XmlSerializeString = false)]
//        public string GetPointcloudPoint(string point1, string point2, string point3)
//        {

//            dynamic strPoint1 = JsonConvert.DeserializeObject(point1);

//            double p1x = strPoint1.X;
//            double p1y = strPoint1.Y;
//            double p1z = strPoint1.Z;

//            p1x = p1x - cloud_min_x;
//            p1y = p1y - cloud_min_y;
//            p1z = p1z - cloud_min_z;


//            dynamic strVector1 = JsonConvert.DeserializeObject(point2);
//            double v1x = strVector1.X;
//            double v1y = strVector1.Y;
//            double v1z = strVector1.Z;

//            dynamic strForward1 = JsonConvert.DeserializeObject(point3);
//            double fv1x = strForward1.X;
//            double fv1y = strForward1.Y;
//            double fv1z = strForward1.Z;

//            double[] pick_ray = { p1x, p1y, p1z, v1x, v1y, v1z };
//            double[] center_ray = { p1x, p1y, p1z,
//                                p1x + fv1x * 100,
//                                p1y + fv1y * 100,
//                                p1z + fv1z * 100 };

//            if (!load_once)
//            {
//                string PointCloudID = "sample_origin.las";
//                LoadOnce(PointCloudID, center_ray, 60);
//                load_once = true;
//            }

//            double[] point = { 0, 0, 0 };
//            PickPoint(pick_ray, point, 0.01f * 0.01f);

//            double retx = (cloud_min_x + point[0]);
//            double rety = (cloud_min_y + point[1]);
//            double retz = (cloud_min_z + point[2]);

//            string jsonPickedPoint = "{" + "'X' :" + retx + ",'Y' :" + rety + ",'Z' :" + retz + "}";
//            return jsonPickedPoint;
//        }*/

//        /// <summary>
//        /// GetPointcloudExtent will return cloud minimum and maximum point in json format
//        /// </summary>
//    }
//}
