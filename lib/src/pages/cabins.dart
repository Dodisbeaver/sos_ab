import 'package:flutter/material.dart';
import 'package:sos_ab/src/models/cabin_library.dart';

import '../data.dart';
import '../routing.dart';
import '../widgets/cabin_list.dart';
import '../services/get-cabin.dart';
import '../services/api-service.dart';

class CabinScreen extends StatelessWidget {
  final String title = 'Stugor';

  const CabinScreen({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: CabinList(
          cabins: cabinsInstances.allCabins,
          onTap: (cabin) {
            RouteStateScope.of(context).go('/cabin/${cabin.id}');
          },
        ),
      );
}



//   @override
//   Widget build(BuildContext context) => Scaffold(
//         appBar: AppBar(
//           title: Text(title),
//         ),
//         body: Expanded(
//           child: FutureBuilder<List<dynamic>>(
//             future: fetchCabin(url),
//             builder: (context, snapshot) {
//               if (snapshot.hasData) {
//                 return Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: ListView.builder(itemBuilder: (context, index) {
//                     var cabin = snapshot.data![index]['cabin'];
//                     var address = snapshot.data![index]['address'];
//                     // var rent = snapshot.data![index]['rent'];
//                     return Card(
//                         shape: RoundedRectangleBorder(
//                           side: BorderSide(
//                             color: Colors.green.shade300,
//                           ),
//                           borderRadius: BorderRadius.circular(15.0),
//                         ),
//                         child: Row(
//                           children: [
//                             ListTile(
//                               // leading: rent,
//                               title: Text(cabin),
//                               subtitle: Text(
//                                 'Adress:\n' + address,
//                               ),
//                             ),
//                             TextButton(
//                               onPressed: () {},
//                               child: const Text('Beställ service'),
//                             )
//                           ],
//                         ));
//                   }),
//                 );
//               } else if (snapshot.hasError) {
//                 throw Exception(Text("${snapshot.error}"));
//               }
//               return const CircularProgressIndicator();
//             },
//           ),
//         ),
//       );
// }
