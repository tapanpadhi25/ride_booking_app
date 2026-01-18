import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:ride_booking_app/common_widget/custom_text_field.dart';
import 'package:ride_booking_app/constants/number_custant.dart';
import 'package:ride_booking_app/constants/strings_constant.dart';
import 'package:ride_booking_app/models/ride_status.dart';
import 'package:ride_booking_app/models/ride_type.dart';
import 'package:ride_booking_app/models/trip_model.dart';
import 'package:ride_booking_app/provider/trip_provider.dart';
import 'package:uuid/uuid.dart';

class AddTripScreen extends ConsumerStatefulWidget {
  const AddTripScreen({super.key});

  @override
  ConsumerState<AddTripScreen> createState() => _AddTripScreenState();
}

class _AddTripScreenState extends ConsumerState<AddTripScreen> {
  final _formKey = GlobalKey<FormState>();

  final pickupCtrl = TextEditingController();
  final dropCtrl = TextEditingController();
  final fareCtrl = TextEditingController();

  @override
  void dispose() {
    pickupCtrl.dispose();
    dropCtrl.dispose();
    fareCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    if (!_formKey.currentState!.validate()) return;

    ref
        .read(tripsProvider.notifier)
        .addTrip(
          Trip(
            id: const Uuid().v4(),
            pickupLocation: pickupCtrl.text.trim(),
            dropLocation: dropCtrl.text.trim(),
            rideType: RideType.mini,
            fare: double.parse(fareCtrl.text.trim()),
            dateTime: DateTime.now(),
            status: RideStatus.requested,
          ),
        );

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Strings.ADD_TRIP,
          style: Theme.of(
            context,
          ).textTheme.titleMedium!.copyWith(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.all(Numbers.LABEL_TEXT_SIZE_16),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              CustomTextField(
                controller: pickupCtrl,
                label: 'Pickup Location',
                keyboardType: TextInputType.text,
                validator: (value) => value == null || value.isEmpty
                    ? 'Enter pickup location'
                    : null,
              ),
              SizedBox(height: Numbers.PADDING_HEIGHT_10),

              CustomTextField(
                controller: dropCtrl,
                label: 'Drop Location',
                keyboardType: TextInputType.text,
                validator: (value) => value == null || value.isEmpty
                    ? 'Enter drop location'
                    : null,
              ),
              SizedBox(height: Numbers.PADDING_HEIGHT_10),

              CustomTextField(
                controller: fareCtrl,
                label: 'Fare',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter fare';
                  }
                  if (double.tryParse(value) == null) {
                    return 'Enter valid amount';
                  }
                  return null;
                },
              ),

              SizedBox(height: Numbers.LABEL_TEXT_SIZE_20),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        Numbers.PADDING_HEIGHT_10,),
                      side: BorderSide(color: Colors.white)
                    ),
                  ),

                  onPressed: _submit,
                  child: Text(
                    Strings.BOOK_RIDE,
                    style: Theme.of(
                      context,
                    ).textTheme.titleMedium!.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
