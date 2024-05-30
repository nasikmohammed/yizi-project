import 'dart:convert';

import 'package:airtable_project/view%20model/provider.dart';
import 'package:airtable_project/view/screen_detailsview.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    final providertable = Provider.of<Providertable>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Workers",
          style: GoogleFonts.overpass(
              color: Colors.green, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              "Name",
              style: GoogleFonts.afacad(fontWeight: FontWeight.bold),
            ),
            TextFormField(
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                hintText: "Name",
              ),
              controller: providertable.namecontroller,
            ),
            Text(
              "Age",
              style: GoogleFonts.afacad(fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "age",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              controller: providertable.agecontroller,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Place",
              style: GoogleFonts.afacad(fontWeight: FontWeight.bold),
            ),
            TextFormField(
              decoration: InputDecoration(
                hintText: "Place",
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              controller: providertable.placecontroller,
            ),
            SizedBox(
              height: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) {
                      return HomePage();
                    },
                  ));
                },
                child: Text("Add Worker"))
          ],
        ),
      ),
    );
  }
}
