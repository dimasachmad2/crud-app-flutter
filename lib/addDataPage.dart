import 'package:basic_crud/shared/tampung_data.dart';
import 'package:flutter/material.dart';
import 'shared/theme.dart';

class AddDataPage extends StatefulWidget {
  const AddDataPage({super.key});

  @override
  State<AddDataPage> createState() => _AddDataPageState();
}

class _AddDataPageState extends State<AddDataPage> {
  TextEditingController nama = TextEditingController();
  TextEditingController posisi = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    const title = 'Add Data';

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
                      ListData.add(
                        list_data(
                          nama.text.trim(),
                          posisi.text.trim(),
                        ),
                      );
                      Navigator.pushNamed(context, '/');
                    }
                  },
                  child: Text(
                    'Add',
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
