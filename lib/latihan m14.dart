import 'dart:core';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class EventTime {
  String title = "";
  String subtitle = "";
  String startDate = "";
  String endDate = "";

  EventTime(this.title, this.subtitle, this.startDate, this.endDate);
}

class LatihanM14 extends StatefulWidget {
  const LatihanM14({Key? key}) : super(key: key);

  @override
  State<LatihanM14> createState() => _LatihanM14State();
}

class _LatihanM14State extends State<LatihanM14> {
  List<EventTime> eventData = [];
  TextEditingController judulController = TextEditingController();
  TextEditingController additionalController = TextEditingController();
  TextEditingController tglMulaiController = TextEditingController();
  TextEditingController tglSelesaiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tambah Event"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text("Event"),
                  IconButton(
                    onPressed: () {
                      // Set initial values for the text fields
                      judulController.text = 'event';
                      additionalController.text = 'event1';
                      tglMulaiController.text =
                          DateFormat('dd MMM yyyy').format(DateTime.now());
                      tglSelesaiController.text =
                          DateFormat('dd MMM yyyy').format(DateTime.now());

                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2.5,
                                    child: TextField(
                                      controller: judulController,
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                      decoration: InputDecoration(
                                        labelText: 'Nama Event',
                                        labelStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2.5,
                                    child: TextField(
                                      controller: additionalController,
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                      decoration: InputDecoration(
                                        labelText: 'Keterangan tambahan',
                                        labelStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2.5,
                                    child: TextField(
                                      controller: tglMulaiController,
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                      decoration: InputDecoration(
                                        labelText: 'Tanggal mulai',
                                        labelStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      onTap: () async {
                                        DateTime selectedDate = DateTime.now();
                                        final DateTime? picked =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: selectedDate,
                                          initialDatePickerMode:
                                              DatePickerMode.day,
                                          firstDate: DateTime(2015),
                                          lastDate: DateTime(2101),
                                          initialEntryMode:
                                              DatePickerEntryMode.calendarOnly,
                                          builder: (context, child) {
                                            return Theme(
                                              data: ThemeData(
                                                dialogBackgroundColor:
                                                    Colors.white,
                                              ),
                                              child: child!,
                                            );
                                          },
                                        );
                                        if (picked != null) {
                                          setState(() {
                                            selectedDate = picked;
                                            tglMulaiController.text =
                                                DateFormat('dd MMM yyyy')
                                                    .format(selectedDate);
                                          });
                                        }
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                    ),
                                  ),
                                  const SizedBox(height: 16),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 2.5,
                                    child: TextField(
                                      controller: tglSelesaiController,
                                      style: TextStyle(
                                        color: Colors.black,
                                      ),
                                      decoration: InputDecoration(
                                        labelText: 'Tanggal selesai',
                                        labelStyle: TextStyle(
                                          color: Colors.black,
                                        ),
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                      onTap: () async {
                                        DateTime selectedDate = DateTime.now();
                                        final DateTime? picked =
                                            await showDatePicker(
                                          context: context,
                                          initialDate: selectedDate,
                                          initialDatePickerMode:
                                              DatePickerMode.day,
                                          firstDate: DateTime(2015),
                                          lastDate: DateTime(2101),
                                          initialEntryMode:
                                              DatePickerEntryMode.calendarOnly,
                                          builder: (context, child) {
                                            return Theme(
                                              data: ThemeData(
                                                dialogBackgroundColor:
                                                    Colors.white,
                                              ),
                                              child: child!,
                                            );
                                          },
                                        );
                                        if (picked != null) {
                                          setState(() {
                                            selectedDate = picked;
                                            tglSelesaiController.text =
                                                DateFormat('dd MMM yyyy')
                                                    .format(selectedDate);
                                          });
                                        }
                                        FocusManager.instance.primaryFocus
                                            ?.unfocus();
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  "CANCEL",
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    eventData.add(EventTime(
                                      judulController.text,
                                      additionalController.text,
                                      tglMulaiController.text,
                                      tglSelesaiController.text,
                                    ));
                                    judulController.clear();
                                    additionalController.clear();
                                    tglMulaiController.clear();
                                    tglSelesaiController.clear();
                                    Navigator.of(context).pop();
                                  });
                                },
                                child: const Text("SET"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    icon: const Icon(Icons.add),
                  )
                ],
              ),
              if (eventData.length != 0)
                Expanded(
                  child: SingleChildScrollView(
                    child: ListView.builder(
                      itemCount: eventData.length,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                          title: Text(eventData[index].title),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(eventData[index].subtitle),
                              Text(
                                eventData[index].startDate ==
                                        eventData[index].endDate
                                    ? eventData[index].endDate
                                    : "${eventData[index].startDate} - ${eventData[index].endDate}",
                              ),
                            ],
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.remove_circle_outline),
                            onPressed: () {
                              setState(() {
                                eventData.remove(eventData[index]);
                              });
                            },
                          ),
                          isThreeLine: true,
                        );
                      },
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
