import QtQuick
import "../../config"

WeatherCard {
    anchors.fill: parent

    CurrentWeather {
        width: parent.width
    }

    Item {
        width: 1
        height: 4   // spacing breather between current-weather block and forecast
    }

    ForecastRow {
        width: parent.width
    }
}
