import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:islami/models/hadethModel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Hadethcontent extends StatelessWidget {
  static const String routname = 'hadethcontent';
  const Hadethcontent({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as HadethModel;

    return Stack(
      children: [
        SizedBox(
            width: double.infinity,
            child: Image.asset(
              Theme.of(context).colorScheme.brightness == Brightness.light
                  ? 'assets/images/bg3.png'
                  : 'assets/images/dark bg.png',
              fit: BoxFit.fill,
            )),
        Scaffold(
          appBar: AppBar(
            title: Text(
              AppLocalizations.of(context)!.appTitle,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          body: Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
            decoration: BoxDecoration(
                border: Border.all(
                    color: Theme.of(context).primaryColor.withOpacity(.5)),
                borderRadius: BorderRadius.circular(20),
                color: Colors.white.withOpacity(.4)),
            child: Column(children: [
              Text(
                args.title,
                style: Theme.of(context)
                    .textTheme
                    .titleMedium
                    ?.copyWith(fontSize: 25),
              ),
              Divider(
                thickness: 1,
                indent: 40,
                endIndent: 40,
                color: Theme.of(context).colorScheme.onSurface,
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView(
                  children: [
                    Directionality(
                      textDirection: TextDirection.rtl,
                      child: Text(args.content,
                          style: GoogleFonts.elMessiri(
                              fontSize: 20,
                              fontWeight: FontWeight.normal,
                              color: Theme.of(context).primaryColor)),
                    )
                  ],
                ),
              )
            ]),
          ),
        ),
      ],
    );
  }
}
