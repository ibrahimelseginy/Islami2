import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:math' as math;
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Tasbeeh extends StatefulWidget {
  const Tasbeeh({super.key});

  @override
  State<Tasbeeh> createState() => _TasbeehState();
}

class _TasbeehState extends State<Tasbeeh> {
  List<String> doaa = [
    'سبحان الله',
    'الحمد لله ',
    'لا اله الا الله',
    'الله اكبر'
  ];
  int count = 0;
  int index = 0;
  double _angle = 0;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 30,
          ),
          SizedBox(
            width: double.infinity,
            height: height * .4,
            child: Stack(
              children: [
                Container(
                    margin: const EdgeInsets.only(left: 50),
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                        Theme.of(context).colorScheme.brightness ==
                                Brightness.light
                            ? 'assets/images/head of seb7a.png'
                            : 'assets/images/dark head of seb7a.png')),
                Container(
                  margin: const EdgeInsets.only(top: 80),
                  alignment: Alignment.topCenter,
                  child: InkWell(
                      onTap: () {
                        _angle += math.pi / 45;
                        if (count == 30) {
                          count = 0;
                          if (index == 3) {
                            index = 0;
                          } else {
                            index++;
                          }
                        } else {
                          count++;
                        }
                        setState(() {});
                      },
                      child: Transform.rotate(
                          angle: _angle,
                          child: Image.asset(
                              Theme.of(context).colorScheme.brightness ==
                                      Brightness.light
                                  ? 'assets/images/body of seb7a.png'
                                  : 'assets/images/dark body of seb7a.png'))),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              AppLocalizations.of(context)!.tasbeeh_count,
              style: GoogleFonts.elMessiri(
                  fontSize: 25, fontWeight: FontWeight.w600),
            ),
          ),
          Container(
            height: 90,
            width: 75,
            alignment: Alignment.center,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Theme.of(context).primaryColor.withOpacity(.55)),
            child: Text(count.toString(),
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(fontWeight: FontWeight.bold)),
          ),
          Container(
            margin: const EdgeInsets.all(20.0),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                color: Theme.of(context).colorScheme.onSurface),
            child: Text(
              doaa[index],
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}
