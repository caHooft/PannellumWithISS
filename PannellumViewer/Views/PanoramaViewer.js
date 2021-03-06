class Viewer {
    constructor() {
        if (!Viewer._instance) {
            Viewer._instance = this;
        }
        return Viewer._instance;
    }
    static getInstance() {
        return this._instance;
    }
}


import './Script/css/pannellum.css';
//import Event from './event';

class PanoramaViewer {
    constructor(scene) {

        viewer = pannellum.viewer('panorama',
    {
        "default":
        {
            "firstScene": scene,
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
                "Tilburg 1":
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

                "Tilburg 2":
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
        }
    });

    }
}

export default PanoramaViewer;