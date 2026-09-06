extends CharacterBody2D

enum gamemode {PLAYER, AI}

var speed = 300
var was_stop_available = false
@export var up : String
@export var down : String
@onready var game = $".."
@onready var initial_pos = Vector2(position.x, position.y)
@onready var ball: CharacterBody2D = $"../ball"
@onready var ults: Node2D = $"../Ults"

func _physics_process(_delta):
	randomize()
	if GameManager.type == GameManager.gamemode.PLAYER:
		movement(up, down)
	else:
		if up == "up" and down == "down":
			AI_logic()
		else:
			movement("w", "s")
	
	position.y = clamp(position.y, -270, 270)
	
	if Input.is_action_just_pressed("ui_cancel"):
		game.reset()
	
	if Input.is_action_just_pressed("d"):
		ults.push_ult(ball)
	
	if Input.is_action_just_pressed("right") and GameManager.type == GameManager.gamemode.PLAYER:
		ults.stop_ult(ball)

func movement(up_, down_):
	var input_dir = Input.get_axis(up_, down_)
	
	if input_dir != 0 :
		velocity.y = input_dir * speed
	else:
		velocity.y = 0
	
	move_and_slide()

func AI_logic():
	if ball.velocity.normalized().x > 0 and ball.position.x > 0:
		if ball.position.y < position.y:
			velocity.y = -speed
		elif ball.position.y > position.y:
			velocity.y = speed
		else:
			velocity.y = 0
		
		move_and_slide()
		
		AI_ult()

func AI_ult():
	if ball.position.x > 500:
		ults.stop_ult(ball)
