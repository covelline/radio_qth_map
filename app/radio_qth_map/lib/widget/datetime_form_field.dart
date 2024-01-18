import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// DatePickerとTimePickerを組み合わせたフォームフィールド
class DateTimeFormField extends FormField<DateTime> {
  DateTimeFormField({
    super.key,
    super.validator,
    String? labelText,
  }) : super(
          builder: (FormFieldState<DateTime> state) {
            final dateFormat = DateFormat.yMMMMd(
                    AppLocalizations.of(state.context)!.localeName)
                .add_Hms();
            return TextField(
              onTap: () async {
                final date = await showDatePicker(
                  context: state.context,
                  initialDate: state.value ?? DateTime.timestamp(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime(3000),
                );
                if (!state.mounted || date == null) return;
                final time = await showTimePicker(
                  context: state.context,
                  initialTime: TimeOfDay.fromDateTime(
                    state.value ?? DateTime.timestamp(),
                  ),
                );
                if (time == null) return;
                state.didChange(DateTime(
                  date.year,
                  date.month,
                  date.day,
                  time.hour,
                  time.minute,
                ));
              },
              decoration: InputDecoration(
                labelText: labelText,
                errorText: state.errorText,
              ),
              controller: TextEditingController(
                text:
                    state.value == null ? '' : dateFormat.format(state.value!),
              ),
              inputFormatters: [
                TextInputFormatter.withFunction((oldValue, newValue) {
                  final newDate = DateTime.tryParse(newValue.text);
                  if (newDate == null) return oldValue;
                  return newValue;
                }),
              ],
            );
          },
        );
}
