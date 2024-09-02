import 'package:flutter/material.dart';
import 'choicepage.dart';
import 'collectionpage.dart';
import 'package:youth_hack_2k24_group14/services/firestore.dart';


class TakerPage extends StatefulWidget {
  final String initialTier;

  TakerPage({super.key, this.initialTier = "Tier 0"});

  @override
  State<TakerPage> createState() => _TakerPageState();
}

class _TakerPageState extends State<TakerPage> {

  late String _tier;

  @override
  void initState() {
    super.initState();
    _tier = widget.initialTier;
  }

  Future<void> _navigateToCollectionPage(BuildContext context) async {
    final newTier = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CollectionPage(),
      ),
    );

    if (newTier != null) {
      setState(() {
        _tier = newTier; // Update the tier value with the returned data
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Center(
            child: Column(
              children: [
                const SizedBox(height: 100),
                Text(
                  "Current Tier: $_tier",
                  style: const TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 25),
                SizedBox(
                  height: 100,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () => _navigateToCollectionPage(context),
                    child: const Text(
                      "Profile",
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                if (_tier != "Tier 0")
                  SizedBox(
                    height: 100,
                    width: 200,
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => ChoicePage()),
                        );
                      },
                      child: const Text(
                        "Choice",
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                const SizedBox(height: 25),
                SizedBox(
                  height: 100,
                  width: 200,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Exit",
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
