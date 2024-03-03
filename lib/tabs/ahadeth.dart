import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:islami/models/hadethModel.dart';
import 'package:islami/screens/hadethContent.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class Ahadeth extends StatefulWidget {
  const Ahadeth({super.key});

  @override
  State<Ahadeth> createState() => _AhadethState();
}

class _AhadethState extends State<Ahadeth> {
  List<HadethModel> hadethModels = [];
  @override
  Widget build(BuildContext context) {
    hadethModels.isEmpty ? hadithFile() : null;
    // ignore: unused_local_variable
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(children: [
      Image.asset(
        'assets/images/59253-quran-basmala-islamic-kufic-arabic-calligraphy-icon.png',
        height: height * .3,
      ),
      Divider(
        height: 2,
        thickness: 2,
        color: Theme.of(context).colorScheme.onSurface,
      ),
      Center(
        child: Text(
          AppLocalizations.of(context)!.ahadeth,
          style: Theme.of(context)
              .textTheme
              .titleMedium!
              .copyWith(fontSize: 25, fontWeight: FontWeight.w600),
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: Divider(
          height: 2,
          thickness: 2,
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      Expanded(
        child: ListView.separated(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, Hadethcontent.routname,
                        arguments: HadethModel(
                            title: hadethModels[index].title,
                            content: hadethModels[index].content));
                  },
                  child: Text(hadethModels[index].title,
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                            fontSize: 20,
                          )),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 5.0),
                child: Divider(
                  indent: 40,
                  endIndent: 40,
                  height: 2,
                  thickness: 2,
                  color: Theme.of(context).colorScheme.onSurface,
                ),
              );
            },
            itemCount: hadethModels.length),
      )
    ]);
  }

  void hadithFile() {
    rootBundle.loadString('assets/suras/ahadeth .txt').then((value) {
      List<String> ahadethcontent = value.split('#');

      for (int i = 0; i < ahadethcontent.length; i++) {
        int lastIndex = ahadethcontent[i].trim().indexOf('\n');
        String title = ahadethcontent[i].trim().substring(0, lastIndex);
        String content = ahadethcontent[i].trim().substring(lastIndex);
        HadethModel hadethModel = HadethModel(title: title, content: content);
        hadethModels.add(hadethModel);
        setState(() {});
      }
      // for (int i = 0; i < ahadethcontent.length; i++) {
      //   List<String> lines = ahadethcontent[i].trim().split('\n');
      //   String title = lines[0];
      //   lines.removeAt(0);
      //   List<String> content = lines;
      //   HadethModel hadethModel = HadethModel(title: title, content: content);
      //   hadethModels.add(hadethModel);
      //   print(title);
      //   setState(() {});
      // }
    }).catchError((erro) {
      print(erro);
    });
  }
}
