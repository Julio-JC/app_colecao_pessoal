import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class Data extends StatefulWidget {
  Data({super.key, required this.dateTime});

  late DateTime dateTime;

  @override
  State<Data> createState() => _DataState();
}

class _DataState extends State<Data> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Text(
            'Lançamento em: ',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
            ),
            child: Center(
              child: IconButton(
                onPressed: () async {
                  final dataLancamento = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    lastDate: DateTime(2100),
                    firstDate: DateTime(1900),
                  );
                  if (dataLancamento != null &&
                      dataLancamento != widget.dateTime) {
                    setState(() {
                      widget.dateTime = dataLancamento;
                    });
                  }
                },
                icon: const Icon(Icons.date_range_outlined),
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(15),
            height: 50,
            width: 120,
            decoration: BoxDecoration(
              color: Colors.blue[50],
              borderRadius: BorderRadius.circular(25),
            ),
            child: Text(
              DateFormat('d/MM/yyyy').format(widget.dateTime),
              style: const TextStyle(fontSize: 18),
            ),
          )
        ],
      ),
    );
  }
}
