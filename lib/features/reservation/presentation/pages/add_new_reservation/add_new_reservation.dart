import 'package:agendamiento_canchas/features/reservation/domain/entities/field.dart';
import 'package:agendamiento_canchas/features/reservation/domain/entities/reservation.dart';
import 'package:agendamiento_canchas/features/reservation/domain/usecases/reservations/get_reservatios_by_date.dart';
import 'package:agendamiento_canchas/features/reservation/presentation/bloc/fields/field_bloc.dart';
import 'package:agendamiento_canchas/features/reservation/presentation/bloc/fields/field_event.dart';
import 'package:agendamiento_canchas/features/reservation/presentation/bloc/fields/field_state.dart';
import 'package:agendamiento_canchas/features/reservation/presentation/bloc/reservations/reservation_bloc.dart';
import 'package:agendamiento_canchas/features/reservation/presentation/bloc/reservations/reservation_event.dart';
import 'package:agendamiento_canchas/features/reservation/presentation/widgets/date_picker_field.dart';
import 'package:agendamiento_canchas/initialize_dependencies.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddNewReservationPage extends StatefulWidget {
  const AddNewReservationPage({super.key});

  @override
  State<AddNewReservationPage> createState() => _AddNewReservationPageState();
}

class _AddNewReservationPageState extends State<AddNewReservationPage> {
  FieldEntity? _fieldSelected;
  DateTime? _dateSelected;
  final TextEditingController _usernameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<FieldsBloc>()..add(const GetSavedFields()),
      child: Scaffold(
        appBar: _buildAppbar(context),
        body: _buildBody(context),
      ),
    );
  }

  _buildAppbar(BuildContext context) {
    return AppBar(
        title: const Text(
      'Nueva Reservación',
      style: TextStyle(color: Colors.black, fontSize: 18),
    ));
  }

  _buildBody(BuildContext context) {
    return BlocBuilder<FieldsBloc, FieldsState>(builder: (context, state) {
      if (state is FieldsLoading) {
        return const Center(child: CupertinoActivityIndicator());
      } else if (state is FieldsDone) {
        return _buildNewReservationForm(state.fields!, context);
      }
      return Container();
    });
  }

  _buildNewReservationForm(List<FieldEntity> fields, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 16.0),
      child: Column(
        children: [
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            width: double.infinity,
            child: DropdownButton<FieldEntity>(
                icon: const Icon(Icons.sports_soccer_rounded),
                hint: const Text('Selecionar Cancha'),
                value: _fieldSelected,
                items: fields
                    .map((e) => DropdownMenuItem(
                          value: e,
                          child: Text(e.id ?? 'noId'),
                        ))
                    .toList(),
                onChanged: (value) {
                  if (value == null) return;
                  setState(() {
                    _fieldSelected = value;
                  });
                }),
          ),
          const SizedBox(
            height: 20,
          ),
          DatePickerField(onDateSelected: _onDateSelected),
          const SizedBox(
            height: 24,
          ),
          TextField(
            controller: _usernameController,
            decoration: const InputDecoration(
                hintText: 'Usuario',
                prefixIcon: Icon(Icons.person),
                filled: true,
                enabledBorder: OutlineInputBorder(borderSide: BorderSide.none),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue))),
          ),
          const SizedBox(
            height: 16,
          ),
          OutlinedButton(
              onPressed: () => _onInsertNewReservation(context),
              child: const Text('Agendar reservación'))
        ],
      ),
    );
  }

  void _onInsertNewReservation(BuildContext context) async {
    if (!_validate()) return;

    if (!await _validateReservationsByDate()) return;

    final reservation = ReservationEntity(
        date: _dateSelected!,
        fieldId: _fieldSelected!.id!,
        username: _usernameController.text);

    BlocProvider.of<ReservationsBloc>(context)
        .add(InsertReservation(reservation));

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        backgroundColor: Colors.black,
        content: Text('Reservación agregada.'),
      ),
    );

    Navigator.of(context).pushReplacementNamed('/');
  }

  bool _validate() {
    if (_dateSelected == null) return false;
    if (_fieldSelected == null) return false;
    if (_usernameController.text == '') return false;

    return true;
  }

  Future<bool> _validateReservationsByDate() async {
    final reservations = await sl<GetReservationsByDateUseCase>().call();

    if (reservations.length >= 3) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Ya existen 3 reservaciones para este dia.'),
        ),
      );

      return false;
    }

    return true;
  }

  void _onDateSelected(DateTime date) {
    _dateSelected = date;
  }
}
