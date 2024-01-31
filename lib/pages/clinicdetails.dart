class ClinicMetadata{
  final String id;
  final String name;

  const ClinicMetadata({
    required this.id,
    required this.name
  });
}

class ClinicList {
  final String clinicName;
  final String address;
  final String id;

  const ClinicList(
      {required this.clinicName, required this.address, required this.id});

  static const Map<String,ClinicList> resClinic = {
    "1": ClinicList(
        clinicName: 'AMRI Dhakuria',
        address:
            "B 400, Prince Anwar Shah Rd, Lake Gardens, Tollygunge, Kolkata, West Bengal 700045",
        id: "1"),
    "2": ClinicList(
        clinicName: 'AMRI Behala',
        address:
            "B 400, Prince Anwar Shah Rd, Lake Gardens, Tollygunge, Kolkata, West Bengal 700045",
        id: "2"),
    "3": ClinicList(
        clinicName: 'Narayana Superspeciality Hospital',
        address:
            "B 400, Prince Anwar Shah Rd, Lake Gardens, Tollygunge, Kolkata, West Bengal 700045",
        id: "3"),
  };
  static Iterable<ClinicMetadata> clicName =
      resClinic.values.map((details) => ClinicMetadata(id: details.id,name: details.clinicName));

  static ClinicList getDetailsById(id){
    return resClinic[id]!;
  }   
}


