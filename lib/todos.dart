import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Todos extends StatefulWidget {
  final bool dark;
  final Function onSaveTodo;
  const Todos({Key? key, required this.onSaveTodo, required this.dark})
      : super(key: key);

  @override
  _TodosState createState() => _TodosState();
}

class _TodosState extends State<Todos> {
  String dropdownvalue = 'Routine';
  final List<String> items = ['Routine', 'Work', 'Free'];
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _startDateController = TextEditingController();
  final TextEditingController _endDateController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _descriptionController.dispose();
    _startDateController.dispose();
    _endDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todos'),
        centerTitle: true,
        backgroundColor: Colors.purple,
      ),
      body: Column(
        children: [
          Row(
            children: <Widget>[
              const Padding(padding: EdgeInsets.all(5.0)),
              const Icon(Icons.list_alt_outlined),
              const Text('Kegiatan'),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextField(
                    controller: _titleController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Judul Kegiatan',
                    ),
                  ),
                ),
              )
            ],
          ),
          Row(
            children: const <Widget>[
              Padding(
                padding: EdgeInsets.all(5.0),
              ),
              Icon(Icons.list),
              Text('Keterangan'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(40, 10, 20, 20),
            child: TextField(
              controller: _descriptionController,
              maxLines: 3,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Tambah Keterangan',
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: const <Widget>[
                  Icon(Icons.calendar_month_rounded),
                  Text('Tanggal Mulai'),
                ],
              ),
              Row(
                children: const <Widget>[
                  Icon(Icons.calendar_today),
                  Text('Tanggal Selesai'),
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              const Padding(padding: EdgeInsets.all(20.0)),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      ).then((selectedDate) {
                        if (selectedDate != null) {
                          setState(() {
                            _startDateController.text =
                                DateFormat('dd-MM-yyyy').format(selectedDate);
                          });
                        }
                      });
                    },
                    controller: _startDateController,
                    maxLines: 2,
                    decoration: const InputDecoration(
                      alignLabelWithHint: true,
                      border: UnderlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                      hintText: '28-03-2022',
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextField(
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(2000),
                        lastDate: DateTime(2100),
                      ).then((selectedDate) {
                        if (selectedDate != null) {
                          setState(() {
                            _endDateController.text =
                                DateFormat('dd-MM-yyyy').format(selectedDate);
                          });
                        }
                      });
                    },
                    controller: _endDateController,
                    maxLines: 2,
                    decoration: const InputDecoration(
                      alignLabelWithHint: true,
                      border: UnderlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                      hintText: '28-03-2022',
                    ),
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                children: const <Widget>[
                  Icon(Icons.category),
                  Text('Kategori'),
                ],
              ),
              Row(
                children: [
                  DropdownButton(
                    value: dropdownvalue,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                    },
                  ),
                ],
              )
            ],
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.purple,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Batal'),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ElevatedButton(
                    style: OutlinedButton.styleFrom(
                      foregroundColor: Colors.white,
                    ),
                    onPressed: () {
                      widget.onSaveTodo(
                        _titleController.text,
                        _descriptionController.text,
                        _startDateController.text,
                        _endDateController.text,
                        dropdownvalue,
                      );
                      Navigator.pop(context, 'Data saved successfully.');
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Dialog(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5)),
                            backgroundColor: widget.dark == true
                                ? Colors.black
                                : Colors.white,
                            child: Stack(
                              alignment: Alignment.center,
                              clipBehavior: Clip.none,
                              children: [
                                Container(
                                  height: 180,
                                  width: 250,
                                  child: Padding(
                                    padding: EdgeInsets.fromLTRB(5, 50, 5, 5),
                                    child: Column(
                                      children: [
                                        Text(
                                          "Berhasil",
                                          style: TextStyle(
                                            color: widget.dark == true
                                                ? Colors.white
                                                : Colors.black,
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(height: 10),
                                        Text(
                                          "Kegiatan berhasil ditambahkan",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: widget.dark == true
                                                ? Colors.white
                                                : Colors.black,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                        SizedBox(height: 20),
                                        ElevatedButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text("OK"),
                                          style: ElevatedButton.styleFrom(
                                            primary: Colors.green,
                                            padding: EdgeInsets.symmetric(
                                              vertical: 15,
                                              horizontal: 35,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: -30,
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.green,
                                    child: CircleAvatar(
                                      backgroundColor: widget.dark == true
                                          ? Colors.black
                                          : Colors.white,
                                      radius: 25,
                                      child: Icon(
                                        Icons.check,
                                        size: 30,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: const Text('Simpan'),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
