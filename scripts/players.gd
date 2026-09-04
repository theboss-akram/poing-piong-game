extends CharacterBody2D

var speed = 300
@export var up : String
@export var down : String
@onready var game = $".."
@onready var initial_pos = Vector2(position.x, position.y)
@onready var ball: CharacterBody2D = $"../ball"
@onready var ults: Node2D = $"../Ults"

func _physics_process(_delta):
	
	var input_dir = Input.get_axis(up, down)
	
	if input_dir != 0 :
		velocity.y = input_dir * speed
	else:
		velocity.y = 0
	
	move_and_slide()
	
	position.y = clamp(position.y, -270, 270)
	
	if position.x != initial_pos.x:
		game.reset()
		position = initial_pos
		game.score.text = "sorry"
		await get_tree().create_timer(0.5).timeout
		game.score.text = str(game.point_1) + " - " + str(game.point_2)
	
	if Input.is_action_just_pressed("ui_cancel"):
		game.reset()
	
	if Input.is_action_just_pressed("d"):
		ults.push_ult(ball)
	
	if Input.is_action_just_pressed("right"):
		ults.stop_ult(ball)
