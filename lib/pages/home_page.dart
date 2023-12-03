import 'package:flutter/material.dart';
import 'package:miner_game/components/ressource.dart';
import 'package:miner_game/pages/recettes.dart';
import 'package:miner_game/providers/main_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final MainProvider mainProvider = Provider.of<MainProvider>(context);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Ressources'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Recettes(),
                ),
              );
            },
            icon: const Icon(Icons.build_circle_rounded),
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
        ),
        itemCount: mainProvider.ressourceList.length,
        itemBuilder: (context, index) {
          return RessourceWidget(
            ressource: mainProvider.ressourceList[index],
            onMinePressed: () {
              mainProvider.mineResource(mainProvider.ressourceList[index]);
            },
          );
        },
      ),
    );
  }
}
