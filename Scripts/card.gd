extends Node2D

signal hovered
signal hovered_off

var hand_position

func _ready() -> void:
	# When a card is made, make the card a child of CardManager. Or this will fail
	get_parent().connect_card_signals(self)

func _on_area_2d_mouse_entered() -> void:
	emit_signal("hovered", self)


func _on_area_2d_mouse_exited() -> void:
	emit_signal("hovered_off", self)
