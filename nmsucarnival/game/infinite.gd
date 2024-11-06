extends Node2D

@onready var bottle_scene = preload("res://MOB2.tscn")  # Load the bottle scene (replace with your actual path)
@onready var paths = [$UPMOBPATH, $BOTTOMPATH]  # Array of Path2D nodes to choose from



func _ready() -> void:
	# Start spawning bottles repeatedly
	spawn_bottle_with_delay()

func spawn_bottle_with_delay():
	# Spawn a bottle
	spawn_bottle()

	# Schedule the next bottle spawn after 1 second
	await get_tree().create_timer(1.0).timeout
	spawn_bottle_with_delay()  # Call the function again to repeat the process

func spawn_bottle():
	# Choose a random path from the available paths
	var chosen_path = paths[randi() % paths.size()]

	# Create a new bottle instance from the scene
	var bottle = bottle_scene.instantiate()

	# Create a new PathFollow2D node to control the bottle's movement
	var path_follow = PathFollow2D.new()

	# Add PathFollow2D to the chosen path and add the bottle to the PathFollow2D
	chosen_path.add_child(path_follow)
	path_follow.add_child(bottle)

	# Set a random position along the path
	path_follow.progress_ratio = randf()  # Set to a random position along the chosen path

	# Debugging output to check if the position changes
	print("Spawned bottle on path:", chosen_path.name, "at progress_ratio:", path_follow.progress_ratio)
	print("Bottle global position after setting progress_ratio:", path_follow.global_position)

	# Make the bottle visible
	bottle.visible = true

	# Schedule the bottle to disappear after 3 seconds
	await get_tree().create_timer(3.0).timeout
	path_follow.queue_free()  # Remove the bottle and its PathFollow2D from the scene
