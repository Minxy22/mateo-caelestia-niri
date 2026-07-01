import QtQuick

Row {
	spacing: 8

	Repeater{
		model : 5

		Rectangle {
			width: 10
			height: 10
			radius: 5

			color: index === 0 ? "#222222" : "#bbbbbb"
		}
	}
}
