import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:vnbingo/providers/myproveedor.dart';
import 'package:vnbingo/utils/colors.dart';

int? _ncartones = 1;

class ComprarCartones extends StatefulWidget {
  const ComprarCartones({Key? key}) : super(key: key);

  @override
  State<ComprarCartones> createState() => _ComprarCartonesState();
}

class _ComprarCartonesState extends State<ComprarCartones> {
  @override
  Widget build(BuildContext context) {
    final pruebabolita = Provider.of<Proveedor>(context);
    return AlertDialog(
      backgroundColor: mBColor,
      title: Text(
        'Comprar cartones',
        style: TextStyle(fontSize: 16),
      ),
      content: DropDown(
          //nCartones: pruebabolita.nCartones,
          nCartones: pruebabolita.cartones.length),
      actions: [
        ElevatedButton(
            style: ElevatedButton.styleFrom(primary: myBlue),
            onPressed: () => {
                  for (int i = 0; i < _ncartones!; i++)
                    {
                      pruebabolita.compraCarton(),
                    },
                  Navigator.pop(context)
                },
            child: Text('OK'))
      ],
    );
  }
}

class DropDown extends StatefulWidget {
  const DropDown({Key? key, required this.nCartones}) : super(key: key);
  final int nCartones;

  @override
  State<DropDown> createState() => _DropDownState();
}

class _DropDownState extends State<DropDown> {
  List<int> items = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < (8 - widget.nCartones); i++) {
      items.add(i + 1);
    }
    _ncartones = 1;
  }

  int? selecteditem = 1;
  @override
  Widget build(BuildContext context) {
    return DropdownButton<int>(
        alignment: AlignmentDirectional.topEnd,
        items: items
            .map((item) => DropdownMenuItem<int>(
                value: item,
                child: Text(
                  '$item',
                  textAlign: TextAlign.right,
                )))
            .toList(),
        value: selecteditem,
        onChanged: (item) => {
              _ncartones = item,
              setState(() => selecteditem = item),
            });
  }
}
