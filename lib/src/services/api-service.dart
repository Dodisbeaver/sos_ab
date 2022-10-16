import '../data.dart';
import 'get-cabin.dart';

const url = "http://localhost:3030";
Future apiService() async {
  final cabinJson = await fetchCabins(url);

  List<Cabin> cabinObj = cabinJson.map((e) => Cabin.fromJson(e)).toList();
  cabinsInstances.allCabins.addAll(cabinObj);
  return cabinObj;
}
