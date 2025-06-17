import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:eye_care/Core/themes/colors.dart';
// import 'package:eye_care/Features/registration/login/Logic/cubit/login_cubit.dart';
// import 'package:eye_care/generated/l10n.dart';

class BuildPhoneFormField extends StatefulWidget {
  const BuildPhoneFormField({
    super.key,
    required this.controller,
  });
  final TextEditingController? controller;

  @override
  _BuildPhoneFormFieldState createState() => _BuildPhoneFormFieldState();
}

class _BuildPhoneFormFieldState extends State<BuildPhoneFormField> {
  String? selectedCountryCode = 'eg';
  String? selectedPrefix = '+20';

  final List<Map<String, String>> countries = [
    {'code': 'af', 'prefix': '+93'},
    {'code': 'al', 'prefix': '+355'},
    {'code': 'dz', 'prefix': '+213'},
    {'code': 'as', 'prefix': '+1684'},
    {'code': 'ad', 'prefix': '+376'},
    {'code': 'ao', 'prefix': '+244'},
    {'code': 'ai', 'prefix': '+1264'},
    {'code': 'aq', 'prefix': '+672'},
    {'code': 'ar', 'prefix': '+54'},
    {'code': 'am', 'prefix': '+374'},
    {'code': 'aw', 'prefix': '+297'},
    {'code': 'au', 'prefix': '+61'},
    {'code': 'at', 'prefix': '+43'},
    {'code': 'az', 'prefix': '+994'},
    {'code': 'bs', 'prefix': '+1242'},
    {'code': 'bh', 'prefix': '+973'},
    {'code': 'bd', 'prefix': '+880'},
    {'code': 'bb', 'prefix': '+1246'},
    {'code': 'by', 'prefix': '+375'},
    {'code': 'be', 'prefix': '+32'},
    {'code': 'bz', 'prefix': '+501'},
    {'code': 'bj', 'prefix': '+229'},
    {'code': 'bt', 'prefix': '+975'},
    {'code': 'bo', 'prefix': '+591'},
    {'code': 'ba', 'prefix': '+387'},
    {'code': 'bw', 'prefix': '+267'},
    {'code': 'bv', 'prefix': '+47'},
    {'code': 'br', 'prefix': '+55'},
    {'code': 'io', 'prefix': '+246'},
    {'code': 'bn', 'prefix': '+673'},
    {'code': 'bg', 'prefix': '+359'},
    {'code': 'bf', 'prefix': '+226'},
    {'code': 'bi', 'prefix': '+257'},
    {'code': 'kh', 'prefix': '+855'},
    {'code': 'cm', 'prefix': '+237'},
    {'code': 'ca', 'prefix': '+1'},
    {'code': 'cv', 'prefix': '+238'},
    {'code': 'ky', 'prefix': '+1345'},
    {'code': 'cf', 'prefix': '+236'},
    {'code': 'td', 'prefix': '+235'},
    {'code': 'cl', 'prefix': '+56'},
    {'code': 'cn', 'prefix': '+86'},
    {'code': 'cx', 'prefix': '+61'},
    {'code': 'cc', 'prefix': '+61'},
    {'code': 'co', 'prefix': '+57'},
    {'code': 'km', 'prefix': '+269'},
    {'code': 'cg', 'prefix': '+242'},
    {'code': 'cd', 'prefix': '+243'},
    {'code': 'ck', 'prefix': '+682'},
    {'code': 'cr', 'prefix': '+506'},
    {'code': 'ci', 'prefix': '+225'},
    {'code': 'hr', 'prefix': '+385'},
    {'code': 'cu', 'prefix': '+53'},
    {'code': 'cw', 'prefix': '+599'},
    {'code': 'cy', 'prefix': '+357'},
    {'code': 'cz', 'prefix': '+420'},
    {'code': 'dk', 'prefix': '+45'},
    {'code': 'dj', 'prefix': '+253'},
    {'code': 'dm', 'prefix': '+1767'},
    {'code': 'do', 'prefix': '+1809'},
    {'code': 'ec', 'prefix': '+593'},
    {'code': 'eg', 'prefix': '+20'},
    {'code': 'sv', 'prefix': '+503'},
    {'code': 'gq', 'prefix': '+240'},
    {'code': 'er', 'prefix': '+291'},
    {'code': 'et', 'prefix': '+251'},
    {'code': 'fj', 'prefix': '+679'},
    {'code': 'fi', 'prefix': '+358'},
    {'code': 'fr', 'prefix': '+33'},
    {'code': 'gf', 'prefix': '+594'},
    {'code': 'pf', 'prefix': '+689'},
    {'code': 'tf', 'prefix': '+262'},
    {'code': 'ga', 'prefix': '+241'},
    {'code': 'gm', 'prefix': '+220'},
    {'code': 'ge', 'prefix': '+995'},
    {'code': 'de', 'prefix': '+49'},
    {'code': 'gh', 'prefix': '+233'},
    {'code': 'gi', 'prefix': '+350'},
    {'code': 'gr', 'prefix': '+30'},
    {'code': 'gl', 'prefix': '+299'},
    {'code': 'gd', 'prefix': '+1473'},
    {'code': 'gp', 'prefix': '+590'},
    {'code': 'gu', 'prefix': '+1671'},
    {'code': 'gt', 'prefix': '+502'},
    {'code': 'gg', 'prefix': '+44'},
    {'code': 'gn', 'prefix': '+224'},
    {'code': 'gw', 'prefix': '+245'},
    {'code': 'gy', 'prefix': '+592'},
    {'code': 'ht', 'prefix': '+509'},
    {'code': 'hm', 'prefix': '+672'},
    {'code': 'va', 'prefix': '+379'},
    {'code': 'hn', 'prefix': '+504'},
    {'code': 'hk', 'prefix': '+852'},
    {'code': 'hu', 'prefix': '+36'},
    {'code': 'is', 'prefix': '+354'},
    {'code': 'in', 'prefix': '+91'},
    {'code': 'id', 'prefix': '+62'},
    {'code': 'ir', 'prefix': '+98'},
    {'code': 'iq', 'prefix': '+964'},
    {'code': 'ie', 'prefix': '+353'},
    {'code': 'im', 'prefix': '+44'},
    {'code': 'il', 'prefix': '+972'},
    {'code': 'it', 'prefix': '+39'},
    {'code': 'je', 'prefix': '+44'},
    {'code': 'jo', 'prefix': '+962'},
    {'code': 'jp', 'prefix': '+81'},
    {'code': 'kz', 'prefix': '+7'},
    {'code': 'ke', 'prefix': '+254'},
    {'code': 'ki', 'prefix': '+686'},
    {'code': 'kp', 'prefix': '+850'},
    {'code': 'kr', 'prefix': '+82'},
    {'code': 'kw', 'prefix': '+965'},
    {'code': 'kg', 'prefix': '+996'},
    {'code': 'la', 'prefix': '+856'},
    {'code': 'lv', 'prefix': '+371'},
    {'code': 'lb', 'prefix': '+961'},
    {'code': 'lc', 'prefix': '+1758'},
    {'code': 'li', 'prefix': '+423'},
    {'code': 'lt', 'prefix': '+370'},
    {'code': 'lu', 'prefix': '+352'},
    {'code': 'mo', 'prefix': '+853'},
    {'code': 'mg', 'prefix': '+261'},
    {'code': 'mw', 'prefix': '+265'},
    {'code': 'my', 'prefix': '+60'},
    {'code': 'mv', 'prefix': '+960'},
    {'code': 'ml', 'prefix': '+223'},
    {'code': 'mt', 'prefix': '+356'},
    {'code': 'mh', 'prefix': '+692'},
    {'code': 'mq', 'prefix': '+596'},
    {'code': 'mr', 'prefix': '+222'},
    {'code': 'mu', 'prefix': '+230'},
    {'code': 'yt', 'prefix': '+262'},
    {'code': 'mx', 'prefix': '+52'},
    {'code': 'fm', 'prefix': '+691'},
    {'code': 'md', 'prefix': '+373'},
    {'code': 'mc', 'prefix': '+377'},
    {'code': 'mn', 'prefix': '+976'},
    {'code': 'me', 'prefix': '+382'},
    {'code': 'ms', 'prefix': '+1664'},
    {'code': 'ma', 'prefix': '+212'},
    {'code': 'mz', 'prefix': '+258'},
    {'code': 'mm', 'prefix': '+95'},
    {'code': 'na', 'prefix': '+264'},
    {'code': 'nc', 'prefix': '+687'},
    {'code': 'nz', 'prefix': '+64'},
    {'code': 'ni', 'prefix': '+505'},
    {'code': 'ne', 'prefix': '+227'},
    {'code': 'ng', 'prefix': '+234'},
    {'code': 'nu', 'prefix': '+683'},
    {'code': 'nf', 'prefix': '+672'},
    {'code': 'mp', 'prefix': '+1670'},
    {'code': 'no', 'prefix': '+47'},
    {'code': 'om', 'prefix': '+968'},
    {'code': 'pk', 'prefix': '+92'},
    {'code': 'pw', 'prefix': '+680'},
    {'code': 'ps', 'prefix': '+970'},
    {'code': 'pa', 'prefix': '+507'},
    {'code': 'pg', 'prefix': '+675'},
    {'code': 'py', 'prefix': '+595'},
    {'code': 'pe', 'prefix': '+51'},
    {'code': 'ph', 'prefix': '+63'},
    {'code': 'pn', 'prefix': '+870'},
    {'code': 'pl', 'prefix': '+48'},
    {'code': 'pm', 'prefix': '+508'},
    {'code': 'pn', 'prefix': '+870'},
    {'code': 'pr', 'prefix': '+1787'},
    {'code': 'pt', 'prefix': '+351'},
    {'code': 'qa', 'prefix': '+974'},
    {'code': 're', 'prefix': '+262'},
    {'code': 'ro', 'prefix': '+40'},
    {'code': 'ru', 'prefix': '+7'},
    {'code': 'rw', 'prefix': '+250'},
    {'code': 'sh', 'prefix': '+290'},
    {'code': 'kn', 'prefix': '+1869'},
    {'code': 'lc', 'prefix': '+1758'},
    {'code': 'pm', 'prefix': '+508'},
    {'code': 'vc', 'prefix': '+1784'},
    {'code': 'ws', 'prefix': '+685'},
    {'code': 'sm', 'prefix': '+378'},
    {'code': 'st', 'prefix': '+239'},
    {'code': 'sa', 'prefix': '+966'},
    {'code': 'sn', 'prefix': '+221'},
    {'code': 'rs', 'prefix': '+381'},
    {'code': 'sc', 'prefix': '+248'},
    {'code': 'sd', 'prefix': '+249'},
    {'code': 'ss', 'prefix': '+211'},
    {'code': 'se', 'prefix': '+46'},
    {'code': 'sg', 'prefix': '+65'},
    {'code': 'sx', 'prefix': '+1721'},
    {'code': 'sk', 'prefix': '+421'},
    {'code': 'si', 'prefix': '+386'},
    {'code': 'sb', 'prefix': '+677'},
    {'code': 'so', 'prefix': '+252'},
    {'code': 'za', 'prefix': '+27'},
    {'code': 'ss', 'prefix': '+211'},
    {'code': 'es', 'prefix': '+34'},
    {'code': 'lk', 'prefix': '+94'},
    {'code': 'sd', 'prefix': '+249'},
    {'code': 'sr', 'prefix': '+597'},
    {'code': 'sj', 'prefix': '+47'},
    {'code': 'sz', 'prefix': '+268'},
    {'code': 'se', 'prefix': '+46'},
    {'code': 'ch', 'prefix': '+41'},
    {'code': 'sy', 'prefix': '+963'},
    {'code': 'tw', 'prefix': '+886'},
    {'code': 'tj', 'prefix': '+992'},
    {'code': 'tz', 'prefix': '+255'},
    {'code': 'th', 'prefix': '+66'},
    {'code': 'tl', 'prefix': '+670'},
    {'code': 'tg', 'prefix': '+228'},
    {'code': 'tk', 'prefix': '+690'},
    {'code': 'to', 'prefix': '+676'},
    {'code': 'tt', 'prefix': '+1868'},
    {'code': 'tn', 'prefix': '+216'},
    {'code': 'tr', 'prefix': '+90'},
    {'code': 'tm', 'prefix': '+993'},
    {'code': 'tc', 'prefix': '+1649'},
    {'code': 'tv', 'prefix': '+688'},
    {'code': 'ug', 'prefix': '+256'},
    {'code': 'ua', 'prefix': '+380'},
    {'code': 'ae', 'prefix': '+971'},
    {'code': 'gb', 'prefix': '+44'},
    {'code': 'us', 'prefix': '+1'},
    {'code': 'um', 'prefix': '+1'},
    {'code': 'uy', 'prefix': '+598'},
    {'code': 'uz', 'prefix': '+998'},
    {'code': 'vu', 'prefix': '+678'},
    {'code': 've', 'prefix': '+58'},
    {'code': 'vn', 'prefix': '+84'},
    {'code': 'wf', 'prefix': '+681'},
    {'code': 'ws', 'prefix': '+685'},
    {'code': 'ye', 'prefix': '+967'},
    {'code': 'zm', 'prefix': '+260'},
    {'code': 'zw', 'prefix': '+263'},
  ];
  String? _errorText;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                width: 1.3,
                color:
                    _errorText == null ? ColorsManager.mainColor : Colors.red,
              ),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Row(
              children: [
                DropdownButton<String>(
                  dropdownColor: Colors.white,
                  value: selectedCountryCode,
                  items: countries.map((country) {
                    return DropdownMenuItem<String>(
                      value: country['code'],
                      child: Row(
                        children: [
                          const SizedBox(width: 8),
                          Text(generateCountryFlag(country['code']!)),
                          const SizedBox(width: 8),
                          Text('${country['prefix']}'),
                        ],
                      ),
                    );
                  }).toList(),
                  onChanged: (value) {
                    setState(() {
                      selectedCountryCode = value;
                      selectedPrefix = countries.firstWhere(
                          (country) => country['code'] == value)['prefix'];
                    });
                  },
                  underline: const SizedBox(),
                ),
                const SizedBox(width: 8),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 2, horizontal: 4),
                    child: TextFormField(
                      style: const TextStyle(
                        color: Colors.black,
                        letterSpacing: 1,
                      ),
                      autofocus: false,
                      decoration: InputDecoration(
                        contentPadding:
                            const EdgeInsets.symmetric(horizontal: 5),
                        alignLabelWithHint: true,
                        border: InputBorder.none,
                        hintText: "phone number",
                        hintStyle: const TextStyle(
                          color: ColorsManager.lightGray,
                          letterSpacing: 1,
                        ),
                        // prefixText: '${selectedPrefix ?? '+20'} ',
                      ),
                      controller: widget.controller,
                      cursorColor: Colors.black,
                      keyboardType: TextInputType.number,
                      validator: (String? value) {
                        if (value!.isEmpty) {
                          setState(() {
                            _errorText = 'Phone number must not be empty';
                          });
                          print(_errorText);
                          return;
                        } else if (value.length < 11) {
                          setState(() {
                            _errorText = 'Phone number is too short';
                          });

                          print(_errorText);
                          return;
                        }
                        setState(() {
                          _errorText = null;
                        });
                        return null;
                      },
                      // validator: (String? value) {
                      //   if (value!.isEmpty) {
                      //     return 'Phone number must not be empty';
                      //   } else if (value.length > 11) {
                      //     return 'Phone number is too short';
                      //   }
                      //   return null;
                      // },
                      onSaved: (value) {
                        // phoneNumber = value!;
                      },
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (_errorText != null)
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 12.0, vertical: 4.0),
            child: Text(
              _errorText!,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }
}

String generateCountryFlag(String countryCode) {
  return countryCode.toUpperCase().replaceAllMapped(
        RegExp(r'[A-Z]'),
        (match) => String.fromCharCode(
          match.group(0)!.codeUnitAt(0) + 127397,
        ),
      );
}
