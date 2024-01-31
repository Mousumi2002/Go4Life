
class Results {
  final String docName;
  final String specialist;
  final String image;
  final String id;
  
  const Results({
    required this.docName,
    required this.specialist,
    required this.image,
    required this.id
  });

  static const List<Results> results = [
    Results(
        docName: 'Dr. Sneha Mallick',
        specialist: 'Gynecologist',
        image: 'assets/doc.jpg',
        id: "1"
        ),
    Results(
        docName: 'Dr. Tausif Mallick',
        specialist: 'Cardiologist',
        image: 'assets/doc.jpg',
        id: "2"
        ),
    Results(
        docName: 'Dr. Ranjana Pal',
        specialist: 'Neurologist',
        image: 'assets/doc.jpg',
        id: "3"
        ),
    Results(
        docName: 'Dr. Subhasis Pal',
        specialist: 'Neurologist',
        image: 'assets/doc.jpg',
        id: "4"
        ),
  ];

  static Iterable <String> categories = results.map((result) => result.specialist );
}
