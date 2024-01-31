import 'package:app_go/pages/detaildoc.dart';
import 'package:app_go/pages/doctorlist.dart';
import 'package:flutter/material.dart';

class ResultList extends StatelessWidget {
  const ResultList({super.key});

  @override
  Widget build(BuildContext context) {
    return Flexible(
        child: Padding(
      padding: const EdgeInsets.all(16.0),
      child: ListView.separated(
          physics: ScrollPhysics(),
          itemCount: Results.results.length,
          itemBuilder: (BuildContext context, int index) {
            return DocCardResult(docName: Results.results[index].docName,image: Results.results[index].image,specialist: Results.results[index].specialist,doctorId: Results.results[index].id);
          },
          separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(height: 15)),
    ));
  }
}

class DocCardResult extends StatelessWidget {
  final String docName;
  final String image;
  final String specialist;
  final String doctorId;
  const DocCardResult({super.key, required this.docName,required this.image,required this.specialist,required this.doctorId});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>  DoctorInfo(
                              doctorId: doctorId,
                              doctorName: docName,
                              doctorImage: image,
                              doctorSpeciality: specialist,
                            ),
                            ),
                      );
      },
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8)
      ),
      tileColor: const Color.fromARGB(255, 235, 242, 255),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image(
          image: AssetImage(image),
        ),
      ),
      title: Text(
        docName,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        specialist,
        style: const TextStyle(fontWeight: FontWeight.w400),
      ),
    );
  }
}
