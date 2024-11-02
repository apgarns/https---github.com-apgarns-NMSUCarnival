extends Node2D

@onready var bottle_scene = preload("res://MOB.tscn")  # Load the bottle scene (replace with your actual path)
@onready var path = $UPMOBPATH  # Reference to the Path2D node

func _ready() -> void:
	# Start spawning bottles repeatedly
	spawn_bottles_repeatedly()

func spawn_bottles_repeatedly():
	# Spawn a bottle every 1 second
	while true:
		await get_tree().create_timer(1.0).timeout
		spawn_bottle()

func spawn_bottle():
	# Create a new bottle instance from the scene
	var bottle = bottle_scene.instantiate()

	# Create a new PathFollow2D node to control the bottle's movement
	var path_follow = PathFollow2D.new()
	path_follow.progress_ratio = randf()  # Set to a random position along the path
	path.add_child(path_follow)  # Add PathFollow2D to the path
	path_follow.add_child(bottle)  # Add the bottle to the PathFollow2D

	# Make the bottle visible
	bottle.visible = true

	# Schedule the bottle to disappear after 3 seconds
	await get_tree().create_timer(3.0).timeout
	path_follow.queue_free()  # Remove the bottle and its PathFollow2D from the scene
