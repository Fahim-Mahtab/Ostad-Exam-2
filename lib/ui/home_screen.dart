import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../data/recepie_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Recipe> _recipes = [];

  @override
  void initState() {
    super.initState();
    _loadRecipes();
  }

  Future<void> _loadRecipes() async {
    final String response = await rootBundle.loadString(
      'assets/food_recipes.json',
    );
    final data = await json.decode(response);
    setState(() {
      _recipes = (data['recipes'] as List)
          .map((data) => Recipe.fromJson(data))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: false,
        title: Text('Food Recipes'),
      ),
      body: ListView.builder(
        itemCount: _recipes.length,
        itemBuilder: (context, index) {
          final recipe = _recipes[index];
          return ListTile(
            leading: Icon(Icons.cake_outlined, size: 30, color: Colors.blue),
            title: Text(
              recipe.title,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            ),
            subtitle: Text(recipe.description),
          );
        },
      ),
    );
  }
}
