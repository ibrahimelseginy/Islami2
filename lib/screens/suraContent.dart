import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/models/suraModel.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SuraContent extends StatefulWidget {
  static const String routname = 'suracontant';

  const SuraContent({super.key});

  @override
  State<SuraContent> createState() => _SuraContentState();
}

class _SuraContentState extends State<SuraContent> {
  List<String> lins = [];
  String besmallah = 'بِسْمِ اللَّهِ الرَّحْمَنِ الرَّحِيمِ';
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as SuraModel;
    lins.isEmpty ? loadFile(args.index) : null;
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
                    color: Theme.of(context)
                        .colorScheme
                        .onSurface
                        .withOpacity(.5)),
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).colorScheme.onError.withOpacity(.5)),
            child: Column(children: [
              Text(
                'سورة ${args.name}',
                style: Theme.of(context).textTheme.titleSmall,
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
                    args.index != 0
                        ? Container(
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(bottom: 20),
                            child: Text(
                              besmallah,
                              style: Theme.of(context).textTheme.titleSmall,
                            ),
                          )
                        : Container(),
                    RichText(
                        textAlign: lins.length < 20
                            ? TextAlign.center
                            : TextAlign.justify,
                        textDirection: TextDirection.rtl,
                        text: TextSpan(children: [
                          for (var i = 0; i < lins.length; i++) ...{
                            TextSpan(
                                text: lins[i],
                                style: Theme.of(context).textTheme.bodySmall),
                            TextSpan(
                                text: ' (${i + 1}) ',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .surface))
                          }
                        ]))
                  ],
                ),
              )
            ]),
          ),
        ),
      ],
    );
  }

  Future<void> loadFile(int index) async {
    String sura = await rootBundle.loadString('assets/suras/${index + 1}.txt');
    sura = sura.split('\n').where((s) => s.trim().isNotEmpty).join('\n');
    lins = sura.split('\n');
    setState(() {});
  }
}
