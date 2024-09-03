import 'package:flutter/material.dart';
import 'ordepage.dart';

class LocationData {
  final String id;
  final String name;
  final int xCoordinate;
  final int yCoordinate;
  final String strnum;

  LocationData({
    required this.id,
    required this.name,
    required this.xCoordinate,
    required this.yCoordinate,
    required this.strnum,
  });
}

class MapMarker extends StatelessWidget {
  final String id;
  final String name;
  final Color color;
  final String strnum;
  final VoidCallback onTap;

  MapMarker({
    required this.id,
    required this.name,
    required this.color,
    required this.strnum,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 20,
        height: 20,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: color,
        ),
        child: Center(
          child: Text(
            strnum,
            style: TextStyle(fontSize: 12, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class MapPage extends StatefulWidget {
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  final List<LocationData> locations = [
    LocationData(
      id: '1',
      name: 'Jurong East',
      xCoordinate: 210,
      yCoordinate: 150,
      strnum: '1',
    ),
    LocationData(
      id: '2',
      name: 'Jl kuokh Rc',
      xCoordinate: 300,
      yCoordinate: 100,
      strnum: '2',
    ),
    LocationData(
      id: '3',
      name: 'Tampines CC',
      xCoordinate: 140,
      yCoordinate: 100,
      strnum: '3',
    ),
    // Add more locations as needed...
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.greenAccent[200], // Match background color with ChoicePage
      appBar: AppBar(
        title: Text('Map'),
        backgroundColor: Colors.blue, // Matching the color of other pages' AppBars
      ),
      body: Column(
        children: [
          Expanded(
            child: InteractiveViewer(
              panEnabled: true, // Enable panning
              scaleEnabled: true, // Enable zooming
              minScale: 0.5, // Minimum zoom level
              maxScale: 2.0, // Maximum zoom level
              child: Stack(
                children: [
                  Image.asset('lib/images/sgmap.jpg'),
                  ...locations.map((location) {
                    return Positioned(
                      left: location.xCoordinate.toDouble(),
                      top: location.yCoordinate.toDouble(),
                      child: MapMarker(
                        id: location.id,
                        name: location.name,
                        color: Colors.blue, // Customize marker color
                        strnum: location.strnum,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  OrderPage(value: location.strnum),
                            ),
                          );
                        },
                      ),
                    );
                  }).toList(),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen[200], // Button color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  side: BorderSide(color: Colors.amber[100]!, width: 10), // Amber ring
                ),
                elevation: 10,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text(
                'Exit',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.black, // Text color for contrast
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
