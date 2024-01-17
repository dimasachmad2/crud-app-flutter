import 'package:basic_crud/shared/tampung_data.dart';
import 'package:basic_crud/shared/theme.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    const title = 'CRUD App';
    int tempIndex;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text(
          title,
          style: GoogleFonts.rubik(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
      body: ListData.isEmpty
          ? Container(
              alignment: Alignment.center,
              child: const Text(
                'Data is empty!',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
            )
          : Container(
              child: ListView.builder(
                itemCount: ListData.length,
                itemBuilder: ((context, index) {
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: index % 2 == 0
                            ? Colors.blue[600]
                            : Colors.blue[300],
                        child: Text(
                          ListData[index].nama[0],
                          style: whiteText.copyWith(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      title: Text(
                        ListData[index].nama,
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      subtitle: Text(
                        ListData[index].posisi,
                        style: greyText.copyWith(
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      trailing: SizedBox(
                        width: 60,
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () {
                                //
                                temp_id = index;
                                Navigator.pushNamed(context, '/edit-page');
                              },
                              child: Icon(
                                Icons.edit_document,
                                color: kPrimaryColor,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            InkWell(
                              onTap: () {
                                //
                                tempIndex = index;
                                setState(() {
                                  ListData.removeAt(tempIndex);
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                        content: Text('Data is removed!')),
                                  );
                                });
                              },
                              child: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/add-data');
        },
        backgroundColor: kPrimaryColor,
        foregroundColor: kWhiteColor,
        child: const Icon(Icons.add),
      ),
    );
  }
}
