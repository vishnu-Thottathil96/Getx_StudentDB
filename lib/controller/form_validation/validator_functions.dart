bool validationFunction(String hintTextToDisplay, String value) {
  if (hintTextToDisplay == 'Name') {
    return value.trim().isNotEmpty;
  } else if (hintTextToDisplay == 'Batch') {
    return value.trim().isNotEmpty;
  } else if (hintTextToDisplay == 'Phone Number') {
    try {
      int.parse(value);
      if (value.length == 10) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  } else if (hintTextToDisplay == 'Mail id') {
    return value.contains('@gmail.com');
  } else {
    return value.trim().isNotEmpty;
  }
}
