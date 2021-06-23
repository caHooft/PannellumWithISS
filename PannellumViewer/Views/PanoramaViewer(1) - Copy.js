viewer = pannellum.viewer('panorama',
           {
               "default":
               {
                   "firstScene": "Area of interest 1",
                   "author": "HawarIT",
                   "sceneFadeDuration": 1000,
                   autoLoad: true,
                   "showControls": false

               },
               "scenes":
               {
                   "Area of interest 1":
                   {
                       "title": "Area of interest 1",
                       "type": "equirectangular",
                       "panorama": "360images/Images filtered_aoi/stream_00038-000000_00032_0002411.jpg",
                       "hotSpots":
                           [{
                               "pitch": -4,
                               "yaw": -165,
                               "type": "scene",
                               "text": "Area of interest 2",
                               "sceneId": "Area of interest 2"
                           },

                           ]

                   },

                   "Area of interest 2":
                   {
                       "title": "Area of interest 2",
                       "type": "equirectangular",
                       "panorama": "360images/Images filtered_aoi/stream_00004-000000_00016_0000187.jpg",
                       "hotSpots":
                           [{
                               "pitch": -6,
                               "yaw": 75,
                               "type": "scene",
                               "text": "Area of interest 1",
                               "sceneId": "Area of interest 1"
                           },
                           {
                               "pitch": -37,
                               "yaw": -178,
                               "type": "info",
                               "text": "grey car"
                           },
                           ]

                   },
               }
           });