import 'package:app_go/pages/doctor_info_page.dart';
import 'package:app_go/provider/doctor_provider.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/doctor.dart';

class DoctorsList extends StatelessWidget {
  const DoctorsList({super.key});

  @override
  Widget build(BuildContext context) {
    final doctorProvider = Provider.of<DoctorProvider>(context);
    final isFilterActive = doctorProvider.isFilterActive;
    final doctors = isFilterActive ? doctorProvider.filteredDoctors : doctorProvider.doctors;

    if (doctors.isEmpty) {
      if (isFilterActive) {
        return const Center(
          child: Text('No doctors found against this filter'),
        );
      } else {
        return const Center(
          child: Text('No doctors found'),
        );
      }
    }

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: doctors.length,
          itemBuilder: (BuildContext context, int index) {
            final doctor = doctors[index];
            return DocCardResult(
              doctor: doctor,
            );
          },
          separatorBuilder: (BuildContext context, int index) => const SizedBox(height: 15),
        ),
      ),
    );
  }
}

class DocCardResult extends StatelessWidget {
  final Doctor doctor;

  const DocCardResult({
    super.key,
    required this.doctor,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DoctorInfo(
              doctor: doctor,
            ),
          ),
        );
      },
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      tileColor: const Color.fromARGB(255, 235, 242, 255),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: CachedNetworkImage(
          imageUrl: doctor.image,
          width: 56,
          height: 56,
          fit: BoxFit.cover,
        ),
      ),
      title: Text(
        doctor.name,
        style: const TextStyle(fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        doctor.specialisation,
        style: const TextStyle(fontWeight: FontWeight.w400),
      ),
    );
  }
}
