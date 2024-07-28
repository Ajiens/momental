import 'package:flutter/material.dart';
import 'package:momental/DataDiri/controller/data_perinatal_controller.dart';
import 'package:momental/DataDiri/controller/kartu_identitas_controller.dart';
import 'package:momental/widgets/formTemplate/stepper_form.dart';
import 'package:momental/DataDiri/pages/form_data_perinatal.dart';
import 'package:momental/DataDiri/pages/form_kartu_identitas.dart';

class DataDiri extends StatelessWidget {
  const DataDiri({super.key});

  @override
  Widget build(BuildContext context) {
    //Controller each pages
    DataPerinatalController dataPerinatalController = DataPerinatalController();
    KartuIdentitasController kartuIdentitasController = KartuIdentitasController();

    //Formkey controller to validating
    final List<GlobalKey<FormState>> formKeys = [
      dataPerinatalController.formKey,
      kartuIdentitasController.formKey,
    ];

    //List of widget
    final List<Widget> page = [
      DataPerinatal(controller: dataPerinatalController,),
      KartuIdentitas(controller: kartuIdentitasController,),
      Container(
        color: Colors.amber,
      )
    ];

    return StepperForm(
      pages: page,
      formKeys: formKeys,
    );
  }
}