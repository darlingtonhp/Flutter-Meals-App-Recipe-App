import 'package:flutter/material.dart';
import 'package:meals_app/models/dummy_data.dart';

class MealDetailsPage extends StatelessWidget {
  final String mealsId;
  const MealDetailsPage({Key? key, required this.mealsId}) : super(key: key);

  Widget sectionTitle(BuildContext context, String text) {
    return SizedBox(
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleSmall,
      ),
    );
  }

  Widget sectionBody(Widget child) {
    return Container(
      height: 150,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final selectedMeal =
        DummyData().mealsData.firstWhere((meal) => meal.id == mealsId);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          selectedMeal.title,
          style: Theme.of(context).textTheme.titleMedium,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 250,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            sectionTitle(context, 'Ingredients'),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: sectionBody(
                ListView.builder(
                  itemBuilder: (context, index) => Card(
                    elevation: 4,
                    color: Theme.of(context).canvasColor,
                    child: Padding(
                      padding: const EdgeInsets.all(6.0),
                      child: Text(
                        selectedMeal.ingredients[index],
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: Colors.black,
                            ),
                      ),
                    ),
                  ),
                  itemCount: selectedMeal.ingredients.length,
                ),
              ),
            ),
            sectionTitle(context, 'Steps'),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: sectionBody(
                ListView.builder(
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Material(
                          elevation: 4,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              child: Text(
                                '# ${index + 1}',
                                style: Theme.of(context)
                                    .textTheme
                                    .titleSmall
                                    ?.copyWith(color: Colors.white),
                              ),
                            ),
                            title: Text(
                              selectedMeal.steps[index],
                              style: Theme.of(context)
                                  .textTheme
                                  .titleSmall
                                  ?.copyWith(
                                    color: Colors.black,
                                  ),
                            ),
                          ),
                        ),
                        const Divider(),
                      ],
                    );
                  },
                  itemCount: selectedMeal.steps.length,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
