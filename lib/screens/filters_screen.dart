import 'package:flutter/material.dart';
import 'package:meals_app/widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.saveFilters, this.currentFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutinFree = false;
  bool _vegi = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    _glutinFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegan = widget.currentFilters['vegan'];
    _vegi = widget.currentFilters['vegi'];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              widget.saveFilters({
                'gluten': _glutinFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegi': _vegi
              });
            },
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(10),
            child: Text(
              'Adgust your meal selection',
              style: Theme.of(context).textTheme.title,
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                SwitchListTile(
                  title: Text('Gluten-Free'),
                  subtitle: Text('only include Gluten-Free meals'),
                  value: _glutinFree,
                  onChanged: (val) {
                    setState(() {
                      _glutinFree = val;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Vegetarien'),
                  subtitle: Text('only include Vegetarien meals'),
                  value: _vegi,
                  onChanged: (val) {
                    setState(() {
                      _vegi = val;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Vegan'),
                  subtitle: Text('only include Vegan meals'),
                  value: _vegan,
                  onChanged: (val) {
                    setState(() {
                      _vegan = val;
                    });
                  },
                ),
                SwitchListTile(
                  title: Text('Lactose-Free'),
                  subtitle: Text('only include Lactose-Free meals'),
                  value: _lactoseFree,
                  onChanged: (val) {
                    setState(() {
                      _lactoseFree = val;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
