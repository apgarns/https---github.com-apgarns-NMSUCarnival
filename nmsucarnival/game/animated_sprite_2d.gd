extends AnimatedSprite2D

var score = 0  # Initialize the score counter

@onready var ScoreLabel = $USERINTERFACE/ScoreLabel

func _input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MOUSE_BUTTON_LEFT:
		$"../Shot".play()
		if get_viewport_rect().has_point(to_local(event.position)):
			play("broken")  # Play the broken animation
			$"../Break".play()  # Play the broken sound
			score += 1  
			print("You selected:", self.name)
			print("Score:", score)  
			update_score_label()  #

func update_score_label():
	if ScoreLabel != null:  
		ScoreLabel.text = "Score: " + str(score)  
	else:
		print("Error: ScoreLabel node not found. Check the path.")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	update_score_label() 
