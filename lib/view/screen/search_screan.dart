// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../../controller/controller/search_controll.dart';

// class ProductSearchDelegateWideget extends SearchDelegate<String> {
//   @override
//   Widget build(BuildContext context) {
//     return TextField(
//       onChanged: (value) {
//         Provider.of<SearchProvider>(context, listen: false)
//             .searchProductData(value);
//       },
//       decoration: InputDecoration(
//         hintText: 'Search products',
//       ),
//     );
//   }

//   @override
//   List<Widget>? buildActions(BuildContext context) {
//      return [
//       IconButton(
//         icon: Icon(Icons.clear),
//         onPressed: () {
//           query = '';
//           Provider.of<SearchProvider>(context, listen: false).searchProductData("");
//         },
//       ),
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//      return IconButton(
//       icon: Icon(Icons.arrow_back),
//       onPressed: () {
//         close(context, '');
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     return Container();
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//      return Container();
//   }
// }
