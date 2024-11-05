extends AnimatedSprite2D

# Reference to the ScoreLabel node in USERINTERFACE
@onready var ScoreLabel = get_node("/root/MAIN/USERINTERFACE/ScoreLabel")
@onready var popup = get_node("/root/MAIN/PopupPanel")

func _ready() -> void:
	if ScoreLabel != null:
		print("ScoreLabel found successfully")
		update_score_label()  # Update with the initial global score
	else:
		print("Error: ScoreLabel node not found. Check the path.")

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		print("Left click detected") 
		$"../Shot".play()
		if get_viewport_rect().has_point(to_local(event.position)):
			play("broken")
			$"../Break".play()
			increase_score()

func increase_score():
	ScoreManager.increase_score(1)  # Use global score manager to increase score
	print("Score incremented to:", ScoreManager.get_score())
	update_score_label()

	# Show popup if the score reaches 25
	if ScoreManager.get_score() >= 2:
		popup.popup_centered()
		print("Popup displayed!")

func update_score_label():
	if ScoreLabel != null:
		ScoreLabel.text = "Beer Points: " + str(ScoreManager.get_score()) + " / 25"
		print("ScoreLabel updated:", ScoreLabel.text)
	else:
		print("Error: ScoreLabel node not found in update_score_label function.")
