import 'package:flutter/cupertino.dart';
import 'package:hungyhub/src/features/other/domain/entity/unit_type.dart';

class UnitTypeProvider extends ChangeNotifier {
  UnitTypesEntity? _selectedType;
  List<UnitTypesEntity>? _listTypes;

  UnitTypesEntity? get selectedType => _selectedType;

  List<UnitTypesEntity>? get listTypes => _listTypes;

  setListUnitTypes(List<UnitTypesEntity> type) {
    _listTypes = type;

    if (type.isNotEmpty) {
      _selectedType = type.first;
    }

    notifyListeners();
  }

  changeUnitType(UnitTypesEntity type) {
    _selectedType = type;
    notifyListeners();
  }

  clearUnitType() {
    _selectedType = null;
    _listTypes = null;
    notifyListeners();
  }
}
