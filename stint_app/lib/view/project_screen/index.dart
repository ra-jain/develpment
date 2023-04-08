import 'package:flutter/material.dart';
import 'package:stint_app/view/common/custom_appbar.dart';

class ProjectScreen extends StatelessWidget {
  final String id;
  const ProjectScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(context),
      backgroundColor: Colors.white,
    );
  }
}
