extends Node2D

@onready var target = $Target  # Ensure this matches the path to the Target node

func _ready() -> void:
	print("Target exists:", target != null)  # Check if target is successfully assigned
	position = get_viewport().get_size() / 2

func _process(delta: float) -> void:
	var mouse_position = get_global_mouse_position()
	if target != null:
		target.position = mouse_position
	position = mouse_position
