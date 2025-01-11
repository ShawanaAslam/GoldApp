

import '../../../../utills/linker.dart';

class ListTileWidget extends StatelessWidget {
  IconData icon;
  VoidCallback ontap;
  String txt;
  ListTileWidget({super.key,required this.ontap,required this.txt,
  required this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: ontap,
      leading: Icon(icon, color: Colors.amber),
      title: Text(txt, style: TextStyle(color: Colors.amber)),
    );
  }
}
