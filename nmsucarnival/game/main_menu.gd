extends Node2D

# Define paths to the game mode scenes (replace these paths with your actual paths)
const INFINITE_SCENE_PATH = "res://InfiniteShooting.tscn"
const BEER_BOTTLE_SCENE_PATH = "res://BeerBottleShooting.tscn"

func _ready():
	# Connect button signals to their respective functions
	$MainContainer/InfiniteButton.connect("pressed", Callable(self, "_on_infinite_button_pressed"))
	$MainContainer/BottleButton.connect("pressed", Callable(self, "_on_bottle_button_pressed"))


# Load the Infinite Shooting scene
func _on_infinite_button_pressed():
	get_tree().change_scene_to_file(INFINITE_SCENE_PATH)

# Load the Beer Bottle Shots scene
func _on_bottle_button_pressed():
	get_tree().change_scene_to_file(BEER_BOTTLE_SCENE_PATH)
