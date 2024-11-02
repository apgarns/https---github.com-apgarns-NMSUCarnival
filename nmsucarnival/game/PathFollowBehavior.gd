extends PathFollow2D

# Called every frame to move along the path
func _process(delta: float) -> void:
	# Adjust the movement speed
	progress_ratio += 0.005 * delta  # Adjust this speed as needed

	# Remove this node once it reaches the end of the path
	if progress_ratio >= 1.0:
		queue_free()  # Remove the PathFollow2D and bottle from the scene
