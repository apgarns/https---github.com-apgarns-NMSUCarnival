extends Node2D

@onready var enemy = preload("res://MOB.tscn")

var score

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func _on_mobtimer_timeout() -> void:
	var ene = enemy.instantiate()
	ene.position = position
	get_parent().add_child(ene)
