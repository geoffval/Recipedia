import 'package:flutter/material.dart';
import 'recipes_categories_view.dart' as recipe_categories;

class AddRecipesScreen extends StatefulWidget {

  @override
  State<AddRecipesScreen> createState() => _AddRecipesScreenState();
}


class _AddRecipesScreenState extends State<AddRecipesScreen> {
  int recipeItem = recipe_categories.recipeItem;
  String Title  = "FOOD";

  void _titleSet(){
    switch(recipeItem){
      case 1:
        Title = "FOOD";
        break;
      case 2:
        Title = "DRINKS";
        break;
      case 3:
        Title = "DESSERT";
        break;
      case 4:
        Title = "PASTRIES";
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    _titleSet();
    return Scaffold(
      appBar: AppBar(
          title: Text("ADD" + " " + Title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            _buildAddRecipesForm()
          ],
        ),
      ),
    );
  }

  Widget _buildAddRecipesForm() {
    return Form(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 20,),
            TextFormField(
              maxLines: 5,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: (){},
                style: ButtonStyle(
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)
                  )),
                ),
                child: Text('Save')
            ),
            SizedBox(height: 50,),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:[
                  Container(
                    height: 170,
                    width: 170,
                    decoration: BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.all(Radius.circular(20))
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 24,
                              ),
                              "Add Photo"
                          ),
                        ],
                      )
                    ),
                ]
            ),
          ],
        ),
      ),
    );
  }
}
