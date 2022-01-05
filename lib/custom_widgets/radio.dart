import 'package:flutter/material.dart';
import 'package:saudade/custom_widgets/day_indicator.dart';
import 'package:saudade/utils/context_extension.dart';

class RadioMenu extends StatefulWidget {
  const RadioMenu({ Key? key }) : super(key: key);

  @override
  State<RadioMenu> createState() => _RadioMenuState();
}

class _RadioMenuState extends State<RadioMenu> {

  @override
  void initState() {
    super.initState();
    if (!newsViewed.contains(dailyNewsList[day])) {
      newsViewed.add(dailyNewsList[day]);
      newsDay.add(day);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        color: Color(0x2EFFFFFF),
        child: ListView.builder(
          itemCount: newsViewed.length,
          itemBuilder: (BuildContext context, int index) {
            return dailyNews(index);
          },
        ),
      ),
    );
  }

  Widget dailyNews(int index) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text("${newsDay[newsViewed.length - index -1]}. Day News",style: context.theme.textTheme.headline5),
          Padding(padding: const EdgeInsets.all(8.0),
          child: Text("${newsViewed[newsViewed.length - index -1]}",style: context.theme.textTheme.headline6)),
          Text("---     ---     ---     ---     ---",style: context.theme.textTheme.headline4)
        ],
      ),
    );
  }
}

List<String> dailyNewsList = [
  "Etiam laoreet convallis pharetra. Curabitur hendrerit lacus et elit facilisis convallis. Vestibulum tempus orci eu risus fringilla, vitae bibendum orci consectetur. Aenean commodo ex odio, ac interdum nulla faucibus quis.",
  "Ut massa nunc, tempor in placerat ac, sodales id lectus. Nulla elementum porta quam nec scelerisque. Ut eget eleifend sapien, id tempus risus. In ullamcorper ex imperdiet, tincidunt ex sed.",
  "Curabitur consequat sapien massa, id rutrum augue dictum ut. Integer eget ultricies urna. Donec feugiat placerat auctor. Curabitur nunc urna, imperdiet ac ligula nec, dignissim gravida enim. Sed in risus.",
  "Proin sed mattis ante. In ac ipsum nisi. Aliquam ac iaculis nulla. Curabitur nec sapien suscipit, cursus diam eget, commodo nibh. Nunc fringilla viverra lectus quis pharetra. Sed blandit ante.",
  "Nulla luctus ac ligula lacinia ornare. Quisque ut blandit orci. Duis eget purus eu purus ultricies tincidunt. Sed dapibus dui et mattis tincidunt. Proin maximus placerat lacus eu pretium. Suspendisse.",
  "Donec in metus non nibh euismod consequat quis vel tellus. Nam vehicula molestie ligula vel tristique. Aliquam erat volutpat. Aenean tincidunt, massa a scelerisque laoreet, massa lacus malesuada elit, vulputate.",
  "Mauris quis sem at urna cursus commodo. Mauris et dui vitae metus bibendum laoreet. Nullam sit amet commodo felis. Vivamus laoreet nunc orci, dictum aliquet mauris euismod in. Pellentesque imperdiet.",
  "Donec eget mauris sem. Aenean viverra tempus ante, vitae porttitor mauris auctor at. Curabitur tristique vel tellus a placerat. Fusce at rhoncus neque, nec bibendum diam. Fusce vitae lacinia est.",
  "Aenean semper ultricies nisl, euismod fermentum turpis mollis quis. Mauris venenatis tellus scelerisque, condimentum metus mollis, efficitur nisl. Pellentesque dignissim quam id massa accumsan, et.",
  "Nunc vitae arcu faucibus, tempor purus eu, ornare eros. Donec id nibh risus. Phasellus sed justo id dolor placerat fringilla. Proin eu odio rhoncus, pharetra.",
  "Quisque eu libero et mauris convallis vulputate non et orci. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vestibulum finibus ante tincidunt felis.",
  "Vivamus at feugiat erat. Proin feugiat feugiat blandit. Aenean sapien justo, sagittis in scelerisque nec, viverra in erat. Phasellus blandit consectetur ex, in pharetra nulla.",
  "Etiam laoreet convallis pharetra. Curabitur hendrerit lacus et elit facilisis convallis. Vestibulum tempus orci eu risus fringilla, vitae bibendum orci consectetur. Aenean commodo ex odio, ac interdum nulla faucibus quis.",
  "Ut massa nunc, tempor in placerat ac, sodales id lectus. Nulla elementum porta quam nec scelerisque. Ut eget eleifend sapien, id tempus risus. In ullamcorper ex imperdiet, tincidunt ex sed.",
  "Curabitur consequat sapien massa, id rutrum augue dictum ut. Integer eget ultricies urna. Donec feugiat placerat auctor. Curabitur nunc urna, imperdiet ac ligula nec, dignissim gravida enim. Sed in risus.",
  "Proin sed mattis ante. In ac ipsum nisi. Aliquam ac iaculis nulla. Curabitur nec sapien suscipit, cursus diam eget, commodo nibh. Nunc fringilla viverra lectus quis pharetra. Sed blandit ante.",
  "Nulla luctus ac ligula lacinia ornare. Quisque ut blandit orci. Duis eget purus eu purus ultricies tincidunt. Sed dapibus dui et mattis tincidunt. Proin maximus placerat lacus eu pretium. Suspendisse.",
  "Donec in metus non nibh euismod consequat quis vel tellus. Nam vehicula molestie ligula vel tristique. Aliquam erat volutpat. Aenean tincidunt, massa a scelerisque laoreet, massa lacus malesuada elit, vulputate.",
  "Mauris quis sem at urna cursus commodo. Mauris et dui vitae metus bibendum laoreet. Nullam sit amet commodo felis. Vivamus laoreet nunc orci, dictum aliquet mauris euismod in. Pellentesque imperdiet.",
  "Donec eget mauris sem. Aenean viverra tempus ante, vitae porttitor mauris auctor at. Curabitur tristique vel tellus a placerat. Fusce at rhoncus neque, nec bibendum diam. Fusce vitae lacinia est.",
  "Aenean semper ultricies nisl, euismod fermentum turpis mollis quis. Mauris venenatis tellus scelerisque, condimentum metus mollis, efficitur nisl. Pellentesque dignissim quam id massa accumsan, et.",
  "Nunc vitae arcu faucibus, tempor purus eu, ornare eros. Donec id nibh risus. Phasellus sed justo id dolor placerat fringilla. Proin eu odio rhoncus, pharetra.",
  "Quisque eu libero et mauris convallis vulputate non et orci. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vestibulum finibus ante tincidunt felis.",
  "Vivamus at feugiat erat. Proin feugiat feugiat blandit. Aenean sapien justo, sagittis in scelerisque nec, viverra in erat. Phasellus blandit consectetur ex, in pharetra nulla.",
    "Etiam laoreet convallis pharetra. Curabitur hendrerit lacus et elit facilisis convallis. Vestibulum tempus orci eu risus fringilla, vitae bibendum orci consectetur. Aenean commodo ex odio, ac interdum nulla faucibus quis.",
  "Ut massa nunc, tempor in placerat ac, sodales id lectus. Nulla elementum porta quam nec scelerisque. Ut eget eleifend sapien, id tempus risus. In ullamcorper ex imperdiet, tincidunt ex sed.",
  "Curabitur consequat sapien massa, id rutrum augue dictum ut. Integer eget ultricies urna. Donec feugiat placerat auctor. Curabitur nunc urna, imperdiet ac ligula nec, dignissim gravida enim. Sed in risus.",
  "Proin sed mattis ante. In ac ipsum nisi. Aliquam ac iaculis nulla. Curabitur nec sapien suscipit, cursus diam eget, commodo nibh. Nunc fringilla viverra lectus quis pharetra. Sed blandit ante.",
  "Nulla luctus ac ligula lacinia ornare. Quisque ut blandit orci. Duis eget purus eu purus ultricies tincidunt. Sed dapibus dui et mattis tincidunt. Proin maximus placerat lacus eu pretium. Suspendisse.",
  "Donec in metus non nibh euismod consequat quis vel tellus. Nam vehicula molestie ligula vel tristique. Aliquam erat volutpat. Aenean tincidunt, massa a scelerisque laoreet, massa lacus malesuada elit, vulputate.",
  "Mauris quis sem at urna cursus commodo. Mauris et dui vitae metus bibendum laoreet. Nullam sit amet commodo felis. Vivamus laoreet nunc orci, dictum aliquet mauris euismod in. Pellentesque imperdiet.",
  "Donec eget mauris sem. Aenean viverra tempus ante, vitae porttitor mauris auctor at. Curabitur tristique vel tellus a placerat. Fusce at rhoncus neque, nec bibendum diam. Fusce vitae lacinia est.",
  "Aenean semper ultricies nisl, euismod fermentum turpis mollis quis. Mauris venenatis tellus scelerisque, condimentum metus mollis, efficitur nisl. Pellentesque dignissim quam id massa accumsan, et.",
  "Nunc vitae arcu faucibus, tempor purus eu, ornare eros. Donec id nibh risus. Phasellus sed justo id dolor placerat fringilla. Proin eu odio rhoncus, pharetra.",
  "Quisque eu libero et mauris convallis vulputate non et orci. Interdum et malesuada fames ac ante ipsum primis in faucibus. Vestibulum finibus ante tincidunt felis.",
  "Vivamus at feugiat erat. Proin feugiat feugiat blandit. Aenean sapien justo, sagittis in scelerisque nec, viverra in erat. Phasellus blandit consectetur ex, in pharetra nulla."
];

List<String> newsViewed = [];
List<int> newsDay =[];