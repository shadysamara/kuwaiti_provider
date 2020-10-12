import 'package:flutter/material.dart';
import 'package:localize_and_translate/localize_and_translate.dart';
import 'package:provider/provider.dart';
import 'package:zoom_course/models/task.dart';
import 'package:zoom_course/providers/todo_provider.dart';
import 'package:zoom_course/widgets/custom_appbar.dart';

class NewTask extends StatefulWidget {
  @override
  _NewTaskState createState() => _NewTaskState();
}

class _NewTaskState extends State<NewTask> {
  GlobalKey<FormState> formKey = GlobalKey();

  String title;

  String description;

  bool isComplete = false;

  setTitle(String value) {
    this.title = value;
  }

  setDescription(String value) {
    this.description = value;
  }

  setIsComplete(bool value) {
    setState(() {
      this.isComplete = value;
    });
  }

  nullValidator(String value) {
    if (value.isEmpty) {
      return translator.translate('null_error');
    }
  }

  saveForm(context) {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      Provider.of<TodoProvider>(context, listen: false).newTask(Task(
          taskTitle: this.title,
          isComplete: this.isComplete,
          taskDescription: this.description));
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: CustomAppBar('new_task_title', () {}),
      body: Container(
        child: Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  child: TextFormField(
                    onSaved: (newValue) => setTitle(newValue),
                    validator: (value) => nullValidator(value),
                    decoration: InputDecoration(
                        labelText: translator.translate('task_title'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  child: TextFormField(
                    onSaved: (newValue) => setDescription(newValue),
                    validator: (value) => nullValidator(value),
                    decoration: InputDecoration(
                        labelText: translator.translate('task_desc'),
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20))),
                  ),
                ),
                CheckboxListTile(
                  title: Text('isComplete'),
                  value: this.isComplete,
                  onChanged: (value) {
                    setIsComplete(value);
                  },
                ),
                RaisedButton(
                    child: Text(translator.translate('add')),
                    onPressed: () {
                      saveForm(context);
                    })
              ],
            )),
      ),
    );
  }
}
