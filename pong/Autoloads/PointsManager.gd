# warning-ignore-all:unused_class_variable
extends Node

signal onPointsChanged(newValue)

var points : Vector2 = Vector2(0.0,0.0)

func addPoint(player) -> void:
	if player == "player1":
		points[0] += 1
	elif(player == "player2"):
		points[1] += 1
	else:
		print("Error in points manager, invalid player " + player)
	emit_signal("onPointsChanged", points)
	
func resetPoints() -> void:
	points = Vector2(0.0, 0.0)