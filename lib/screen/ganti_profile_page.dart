import 'package:complainz/config/app_color.dart';
import 'package:complainz/widget/buttons.dart';
import 'package:date_format_field/date_format_field.dart';
import 'package:flutter/material.dart';

class GantiProfile extends StatefulWidget {
  const GantiProfile({super.key});

  @override
  State<GantiProfile> createState() => _GantiProfileState();
}

class _GantiProfileState extends State<GantiProfile> {
  DateTime? _date;

  String display() {
    if (_date == null) {
      return 'NONE';
    } else {
      return 'year:${_date!.year}\nmonth:${_date!.month}\nday:${_date!.day}';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Navigator.pop(context);
          },
          child: Image.asset('assets/icons/BACK.png', width: 25),
        ),
        title: const Padding(
          padding: EdgeInsets.only(left: 85, right: 16),
          child: Text(
            'Ganti Profile',
            style: TextStyle(
                color: AppColors.primary,
                fontSize: 32,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              const SizedBox(height: 29),
              Stack(
                children: [
                  Image.asset('assets/images/Background_new.png'),
                  Padding(
                    padding: const EdgeInsets.only(top: 45, left: 105),
                    child: Image.asset(
                      'assets/images/Profile_account.png',
                      width: 145,
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Padding(
                      padding: const EdgeInsets.only(left: 200, top: 140),
                      child: Image.asset('assets/icons/ButtonKamera.png',
                          width: 55.71),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 205),
                    color: const Color.fromRGBO(0, 0, 0, 0.5),
                    width: 390,
                    height: 20,
                    child: InkWell(
                      onTap: () {},
                      child: const Text(
                        'Klik untuk ubah',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Column(
                children: [
                  const Padding(padding: EdgeInsets.only(left: 6, right: 6)),
                  SizedBox(
                    width: 378,
                    height: 300,
                    child: Card(
                      child: Column(
                        children: [
                          const SizedBox(height: 16),
                          Row(
                            children: const [
                              Padding(padding: EdgeInsets.only(left: 15)),
                              Text(
                                'Name',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                '*',
                                style: TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                          const SizedBox(height: 7),
                          Column(
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(left: 16, right: 50),
                                child: TextField(
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 7),
                          Row(
                            children: const [
                              Padding(padding: EdgeInsets.only(left: 15)),
                              Text(
                                'No. Whatsapp',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                '*',
                                style: TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                          const SizedBox(height: 7),
                          Column(
                            children: const [
                              Padding(
                                padding: EdgeInsets.only(left: 16, right: 50),
                                child: TextField(
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 7),
                          Row(
                            children: const [
                              Padding(padding: EdgeInsets.only(left: 15)),
                              Text(
                                'Tanggal Lahir',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              Text(
                                '*',
                                style: TextStyle(color: Colors.red),
                              ),
                            ],
                          ),
                          const SizedBox(height: 7),
                          Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 16, right: 30),
                                child: DateFormatField(
                                  type: DateFormatType.type4,
                                  decoration: const InputDecoration(
                                    labelStyle: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18,
                                      fontStyle: FontStyle.italic,
                                    ),
                                    //label: Text("Date"),
                                  ),
                                  onComplete: (date) {
                                    setState(() {
                                      _date = date;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 85),
              ButtonPrimary(
                btnText: 'SIMPAN',
                onPressed: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
