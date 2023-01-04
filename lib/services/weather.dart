import 'location.dart';
import 'networking.dart';

const weatherAPIURL = 'https://api.openweathermap.org/data/2.5/weather';
const appid = '';

class WeatherModel {
  Future<dynamic> getWeatherData() async {
    Location location = new Location();
    await location.getLocation();
    NetworkHelper networkHelper = NetworkHelper(
        '$weatherAPIURL?lat=${location.latitude}&lon=${location.longitude}&appid=$appid&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  Future<dynamic> getWeatherDataFromCityName(String cityName) async {
    NetworkHelper networkHelper =
        NetworkHelper('$weatherAPIURL?q=$cityName&appid=$appid&units=metric');
    var weatherData = await networkHelper.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '☀️';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
