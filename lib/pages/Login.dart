import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/components/monthly_summary.dart';
import 'package:flutter_application_1/data/habit_database.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../components/habit_tile.dart';
import '../components/my_fab.dart';
import '../components/my_alert_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  HabitDatabase db = HabitDatabase();

  final _myBox = Hive.box('Habit_Database');
  // create new habit
  final _newHabitNameController = TextEditingController();

  @override
  void initState() {
    // this is the first time opening the this app, load default data
    if (_myBox.get('CURRENT_HABIT_LIST') == null) {
      db.createDefaultData();

      // there is already existing data, this is not the first time opening this app
    } else {
      db.loadData();
    }
    // update the database
    db.updateDatabase();
    super.initState();
  }

  //checkbox was tapped
  void checkBoxTapped(bool? value, int index) {
    setState(() {
      db.todaysHabitList[index][1] = value;
    });
    db.updateDatabase();
  }

  void createNewHabit() {
    showDialog(
        context: context,
        builder: (context) {
          return MyAlertBox(
            controller: _newHabitNameController,
            hintText: 'Enter habit name..',
            onSave: saveNewHabit,
            onCancel: cancelDialogBox,
          );
        });
    db.updateDatabase();
  }

  // save new habit
  void saveNewHabit() {
    setState(() {
      db.todaysHabitList.add([_newHabitNameController.text, false]);
    });
    db.updateDatabase();
    _newHabitNameController.clear();
    Navigator.of(context).pop();
  }

//cancel new habit
  void cancelDialogBox() {
    Navigator.of(context).pop();
    db.updateDatabase();
  }

  //open habit settings
  void openHabitSetting(int index) {
    showDialog(
        context: context,
        builder: (context) {
          return MyAlertBox(
            controller: ([_newHabitNameController.text, false]),
            hintText: db.todaysHabitList[index][0],
            onSave: () => saveExistingHabit(index),
            onCancel: cancelDialogBox,
          );
        });
  }

//save existing habit method with new name
  void saveExistingHabit(int index) {
    setState(() {
      db.todaysHabitList[index][0] = _newHabitNameController.text;
    });
    db.updateDatabase();
  }

// delete habit
  void deleteHabit(int index) {
    setState(() {
      db.todaysHabitList.removeAt(index);
    });
    db.updateDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      floatingActionButton: MyFloatingActionButton(
        onPressed: createNewHabit,
      ),
      body: ListView(
        children: [
          // monthly summary heat map
          MonthlySummary(
              datasets: db.heatMapDataSet, startDate: _myBox.get('START_DATE')),

          // list of habits
          ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: db.todaysHabitList.length,
              itemBuilder: (context, index) {
                return HabitTile(
                  habitName: db.todaysHabitList[index][0],
                  habitCompleted: db.todaysHabitList[index][1],
                  onChanged: (value) => checkBoxTapped(value, index),
                  settingsTapped: (context) => openHabitSetting(index),
                  deleteTapped: (context) => deleteHabit(index),
                );
              })
        ],
      ),
    );
  }
}
