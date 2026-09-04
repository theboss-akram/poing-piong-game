extends Node2D

var point_1 = 0
var point_2 = 0
@onready var score = $UI/score
@onready var ball = $ball

func _ready() -> void:
	reset()

func add_point_p1():
	point_1 += 1
	score.text = str(point_1) + " - " + str(point_2)
	await get_tree().create_timer(1).timeout
	reset()

func add_point_p2():
	point_2 += 1
	score.text = str(point_1) + " - " + str(point_2)
	await get_tree().create_timer(1).timeout
	reset()

func reset():
	ball.reset_ball()
