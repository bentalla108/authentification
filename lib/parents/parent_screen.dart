import 'package:flutter/material.dart';

class Child {
  final String name;
  bool isSelected;

  Child({required this.name, this.isSelected = false});
}

class Activity {
  final String name;
  final String description;
  final String days;
  final double price;
  bool isSelected;

  Activity({
    required this.name,
    required this.description,
    required this.days,
    required this.price,
    this.isSelected = false,
  });
}

class ParentScreen extends StatefulWidget {
  @override
  _ParentScreenState createState() => _ParentScreenState();
}

class _ParentScreenState extends State<ParentScreen> {
  final List<Child> children = [
    Child(name: 'Enfant 1'),
    Child(name: 'Enfant 2'),
    Child(name: 'Enfant 3'),
    // Ajoutez d'autres enfants ici
  ];

  final List<Activity> activities = [
    Activity(
      name: 'Activité 1',
      description: 'Description de l\'activité 1',
      days: 'Lundi, Mercredi',
      price: 20.0,
    ),
    Activity(
      name: 'Activité 2',
      description: 'Description de l\'activité 2',
      days: 'Mardi, Jeudi',
      price: 15.0,
    ),
    Activity(
      name: 'Activité 3',
      description: 'Description de l\'activité 3',
      days: 'Mercredi, Vendredi',
      price: 25.0,
    ),
    // Ajoutez d'autres activités ici
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Inscription aux activités'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                'Activités disponibles',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Expanded(
                child: Card(
                  elevation: 4,
                  child: ListView.builder(
                    itemCount: activities.length,
                    itemBuilder: (ctx, index) {
                      final activity = activities[index];
                      return ListTile(
                        title: Text(activity.name),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Description: ${activity.description}'),
                            Text('Jours: ${activity.days}'),
                            Text(
                                'Prix: \$${activity.price.toStringAsFixed(2)}'),
                          ],
                        ),
                        trailing: Checkbox(
                          value: activity.isSelected,
                          onChanged: (value) {
                            setState(() {
                              activity.isSelected = value!;
                            });
                          },
                        ),
                      );
                    },
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Inscrire les enfants',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              // Liste des enfants pour l'inscription
              Expanded(
                child: ListView.builder(
                  itemCount: children.length,
                  itemBuilder: (ctx, index) {
                    final child = children[index];
                    return ListTile(
                      title: Text(child.name),
                      trailing: Checkbox(
                        value: child.isSelected,
                        onChanged: (value) {
                          setState(() {
                            child.isSelected = value!;
                          });
                        },
                      ),
                    );
                  },
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Code pour inscrire les enfants sélectionnés aux activités
                  // Vous pouvez accéder aux enfants sélectionnés en parcourant la liste "children"
                  // et vérifier la propriété "isSelected".
                  // Ensuite, vous pouvez associer les enfants sélectionnés aux activités sélectionnées.
                },
                child: Text('Inscrire les enfants aux activités'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
