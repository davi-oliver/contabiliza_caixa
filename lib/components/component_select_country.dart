// import 'package:fl_country_code_picker/fl_country_code_picker.dart';
// import 'package:flutter/material.dart';
// import 'package:phrase_flow/app/login_page/createaccount/createaccount_widget.dart';

// const _previewTextStyle = TextStyle(fontSize: 18.0);

// class CountryCodePreview extends StatelessWidget {
//   CountryCodePreview({
//     Key? key,
//     required this.model,
//   }) : super(key: key);
//   late CreateaccountModel model;

//   final countryPicker = const FlCountryCodePicker();

//   /// With custom params.
//   final countryPickerWithParams = FlCountryCodePicker(
//     localize: true,
//     showDialCode: true,
//     showSearchBar: true,
//     favoritesIcon: Icon(Icons.person),
//     favorites: ['+39', 'FR'],
//     title: Text('Select Country'),
//     filteredCountries: ['IT', 'ES', 'FR', 'US', 'CA', 'DE'],
//     countryTextStyle: TextStyle(color: Colors.black),
//     dialCodeTextStyle: TextStyle(color: Colors.black),
//     searchBarDecoration: InputDecoration(
//       hintText: 'Search by name or dial code',
//       contentPadding: EdgeInsets.only(left: 8.0, top: 16.0),
//       border: OutlineInputBorder(
//         borderSide: BorderSide.none,
//       ),
//       filled: true,
//       fillColor: Colors.grey[200],
//     ),
//   );
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisAlignment: MainAxisAlignment.center,
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         /// Default.
//         GestureDetector(
//             onTap: () async {
//               // Show the country code picker when tapped.
//               final code = await countryPicker.showPicker(context: context);
//               // Null check
//               code!.name != null
//                   ? print(code.name)
//                   : print('No country selected');

//               print(code);
//             },
//             child: TextFieldCountry(
//               model: model,
//             )),
//       ],
//     );
//   }
// }
