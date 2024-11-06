extends AnimatedSprite2D

# Reference to the ScoreLabel node in USERINTERFACE
@onready var ScoreLabel = get_node("/root/BeerBottle/USERINTERFACE/ScoreLabel")

# Define the path to the main menu scene
const MAIN_MENU_SCENE_PATH = "res://main_menu.tscn"  # Update with the actual path to your main menu scene

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

	# Load the main menu if the target score is reached
	if ScoreManager.get_score() == 10:
		print("Target score reached: Returning to Main Menu.")
		return_to_main_menu()

func update_score_label():
	if ScoreLabel != null:
		ScoreLabel.text = "Beer Points: " + str(ScoreManager.get_score()) + " / 10"
		print("ScoreLabel updated:", ScoreLabel.text)
	else:
		print("Error: ScoreLabel node not found in update_score_label function.")

# Function to load the main menu scene
func return_to_main_menu():
	get_tree().change_scene_to_file(MAIN_MENU_SCENE_PATH)  # Load the main menu scene
