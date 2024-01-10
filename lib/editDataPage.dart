import 'package:basic_crud/shared/tampung_data.dart';
import 'package:basic_crud/shared/theme.dart';
import 'package:flutter/material.dart';

class EditDataPage extends StatefulWidget {
  const EditDataPage({super.key});

  @override
  State<EditDataPage> createState() => _EditDataPageState();
}

class _EditDataPageState extends State<EditDataPage> {
  TextEditingController nama = TextEditingController();
  TextEditingController posisi = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    const title = 'Edit Data';
    nama.text = ListData[temp_id].nama;
    posisi.text = ListData[temp_id].posisi;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          title,
        ),
        backgroundColor: Colors.blue,
        foregroundColor: kWhiteColor,
      ),
      body: Form(
        key: formKey,
        child: Container(
          margin: EdgeInsets.all(40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Full Name',
                style: blackText.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: nama,
                decoration: InputDecoration(
                  hintText: 'Your Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please input your name';
                  }
                  return null;
                },
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Position',
                style: blackText.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              TextFormField(
                controller: posisi,
                maxLength: 10,
                decoration: InputDecoration(
                  hintText: 'Your Position',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please input your position';
                  }
                  return null;
                },
              ),
              Container(
                margin: EdgeInsets.only(top: 30),
                width: double.infinity,
                height: 60,
                child: TextButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Data saved!')),
                      );
                      ListData[temp_id] = list_data(
                        nama.text.trim(),
                        posisi.text.trim(),
                      );
                      Navigator.pushNamed(context, '/');
                    }
                  },
                  child: Text(
                    'Update',
                    style: whiteText.copyWith(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    backgroundColor: kPrimaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
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
