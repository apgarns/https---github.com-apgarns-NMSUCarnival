extends Node

var score = 0

func increase_score(amount = 1):
	score += amount

func get_score():
	return score
