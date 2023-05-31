import 'package:flutter/material.dart';
import 'package:chips_choice_null_safety/chips_choice_null_safety.dart';

class TagsButton extends StatefulWidget {
  const TagsButton({super.key});

  @override
  State<TagsButton> createState() => _TagsButtonState();
}

class _TagsButtonState extends State<TagsButton> {
  int tag = 1;
  List<String> tags = [];

  List<String> options = [
    'Dosen',
    'Akademik',
    'Sarana dan Prasarana',
    'Organisasi Mahasiswa',
    'Mahasiswa',
    'Lainnya'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          ChipsChoice.single(
            value: tag,
            onChanged: (val) => setState(() => tag = val),
            choiceItems: C2Choice.listFrom(
              source: options,
              value: (i, v) => i,
              label: (i, v) => v,
            ),
            choiceActiveStyle: const C2ChoiceStyle(
              color: Color(0XFF36A8F4),
              borderColor: Color(0XFF36A8F4),
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            choiceStyle: const C2ChoiceStyle(
              color: Color(0XFF1C1C1C),
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
            ),
            wrapped: true,
          ),
          SizedBox(
            height: 170,
            width: 358,
            child: Card(
              child: ChipsChoice.single(
                value: tag,
                onChanged: (val) => setState(() => tag = val),
                choiceItems: C2Choice.listFrom(
                  source: options,
                  value: (i, v) => i,
                  label: (i, v) => v,
                ),
                choiceActiveStyle: const C2ChoiceStyle(
                  color: Color(0XFF36A8F4),
                  borderColor: Color(0XFF36A8F4),
                  borderRadius: BorderRadius.all(
                    Radius.circular(5),
                  ),
                ),
                choiceStyle: const C2ChoiceStyle(
                  color: Color(0XFF1C1C1C),
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                wrapped: true,
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
