import 'package:dropdown_model_list/drop_down/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:recipedia/models/create_recipes.dart';
import 'package:recipedia/view/recipes_menu_view.dart';

class AddRecipesScreen extends StatefulWidget {
  @override
  State<AddRecipesScreen> createState() => _AddRecipesScreenState();
}

class _AddRecipesScreenState extends State<AddRecipesScreen> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _recipeNameController = TextEditingController();
  final TextEditingController _recipeDescController = TextEditingController();
  final List<TextEditingController> _stepsControllers = <TextEditingController>[];
  final List<TextEditingController> _ingredientsControllers = <TextEditingController>[];
  String? _dropdownValue;

  // Type drop down model
  DropListModel dropListModel = DropListModel([
    OptionItem(id: "1", title: "Food"),
    OptionItem(id: "2", title: "Drink"),
    OptionItem(id: "3", title: "Dessert"),
    OptionItem(id: "4", title: "Pastries"),
  ]);
  OptionItem optionItemSelected = OptionItem(id: null, title: "Type");


  // GET TYPE , INGREDIENTS , STEPS VALUES
  // -----------------------------------------------------------------------------------
  String? getDropdownValue() {
    return optionItemSelected.id;
  }
  List<String> getIngredientsValues() {
    return _ingredientsControllers.map((controller) => controller.text).toList();
  }
  List<String> getStepsValues() {
    return _stepsControllers.map((controller) => controller.text).toList();
  }
  // ------------------------------------------------------------------------------------



  // CREATE RECIPES FUNCTION
  Future<void> _createRecipes(String recipeName, String recipeDesc, String dropdownValue, List<String> ingredientsValues, List<String> stepsValues) async {
    try {
      // Show loading indicator
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return const Center(child: CircularProgressIndicator());
        },
      );
      // Simulate a delay and create a new recipe
      await Future.delayed(const Duration(seconds: 2));
      await Recipes.createRecipes(recipeName, recipeDesc, dropdownValue, ingredientsValues, stepsValues);
      // Close the loading indicator
      Navigator.of(context).pop();
      // Show success message or navigate to another screen
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Recipe created successfully!'),
          duration: Duration(seconds: 2),
        ),
      );

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => RecipesPage()));
    } catch (e) {
      // Close the loading indicator
      Navigator.of(context).pop();
      // Show an error message
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Error: $e"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }


  // BUILD
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ADD RECIPES"),
      ),
      body: Container(
        color: Colors.grey[200],
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                _buildAddRecipesForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }


  // ADD RECIPES FORM
  //---------------------------------------------
  Widget _buildAddRecipesForm() {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Recipe Name", style: TextStyle(fontSize: 16)),
                const SizedBox(height: 15),
                TextFormField(
                  controller: _recipeNameController,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Add Your Recipe Name',
                    labelStyle: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please input your recipe name';
                    }
                    return null;
                  },
                  maxLength: 25,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          Container(
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Recipe Description", style: TextStyle(fontSize: 16)),
                TextFormField(
                  controller: _recipeDescController,
                  maxLines: 2,
                  maxLength: 100,
                  maxLengthEnforcement: MaxLengthEnforcement.enforced,
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    labelText: 'Add Your Recipe Description',
                    labelStyle: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please input your recipe description';
                    }
                    return null;
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          Container(
            padding: const EdgeInsets.all(25),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            child: DropdownButtonFormField(
              value: _dropdownValue,
              items: dropListModel.listOptionItems
                  .map((item) => DropdownMenuItem(
                value: item.id,
                child: Text(item.title),
              ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  _dropdownValue = value.toString();
                });
              },
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please select a type';
                }
                return null;
              },
              decoration: const InputDecoration(
                labelText: 'Type',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          const SizedBox(height: 25),
          _buildIngredientsList(),
          const SizedBox(height: 25),
          _buildStepsList(),
          const SizedBox(height: 25),
          Center(
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  String recipeName = _recipeNameController.text;
                  String recipeDesc = _recipeDescController.text;
                  String dropdownValue = _dropdownValue!;
                  List<String> stepsValues = getStepsValues();
                  List<String> ingredientsValues = getIngredientsValues();


                  // Validate ingredients and steps
                  if (ingredientsValues.isEmpty || ingredientsValues.any((ingredient) => ingredient.isEmpty)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please add at least one ingredient.'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                  else if (stepsValues.isEmpty || stepsValues.any((step) => step.isEmpty)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Please add at least one step.'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  } else {
                    print(ingredientsValues);
                    // Store new recipe in the database
                    _createRecipes(recipeName, recipeDesc, dropdownValue, ingredientsValues, stepsValues);
                  }
                }
              },
              style: ButtonStyle(
                shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
              ),
              child: const Text('SAVE', style: TextStyle(color: Colors.black)),
            ),
          ),
        ],
      ),
    );
  }
  //---------------------------------------------


  // ADD INGREDIENTS FORM
  //---------------------------------------------
  Widget _buildIngredientsList() {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Ingredients", style: TextStyle(fontSize: 16)),
          const SizedBox(height: 10),
          _buildIngredientsInput(),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _ingredientsControllers.add(TextEditingController());
              });
            },
            child: const Text('Add Ingredients', style: TextStyle(color: Colors.black54)),
          ),
        ],
      ),
    );
  }

  Widget _buildIngredientsInput() {
    return Column(
      children: List.generate(
        _ingredientsControllers.length,
            (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Text("Ingredient ${index + 1}:"),
                const SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    controller: _ingredientsControllers[index],
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter Ingredient',
                      labelStyle: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.remove_circle),
                  onPressed: () {
                    setState(() {
                      _ingredientsControllers.removeAt(index);
                    });
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
  //---------------------------------------------


  // ADD STEPS FORM
  // --------------------------------------------
  Widget _buildStepsList() {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text("Steps", style: TextStyle(fontSize: 16)),
          const SizedBox(height: 10),
          _buildStepInputs(),
          const SizedBox(height: 15),
          ElevatedButton(
            onPressed: () {
              setState(() {
                _stepsControllers.add(TextEditingController());
              });
            },
            child: const Text('Add Steps', style: TextStyle(color: Colors.black54)),
          ),
        ],
      ),
    );
  }

  Widget _buildStepInputs() {
    return Column(
      children: List.generate(
        _stepsControllers.length,
            (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Text("Step ${index + 1}:"),
                const SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    controller: _stepsControllers[index],
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Enter Step',
                      labelStyle: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.remove_circle),
                  onPressed: () {
                    setState(() {
                      _stepsControllers.removeAt(index);
                    });
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  //---------------------------------------------
}


