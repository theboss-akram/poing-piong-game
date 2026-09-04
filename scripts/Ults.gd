extends Node2D

var is_push_available = true
var push_cd = 15
var is_stop_available = true
var stop_cd = 10
var current_vel : Vector2
@onready var timer_push: Timer = $Timer_push
@onready var timer_stop: Timer = $Timer_stop
@onready var progress_bar_push: ProgressBar = $cooldowns/HBoxContainer_push/ProgressBar_push
@onready var progress_bar_stop: ProgressBar = $cooldowns/HBoxContainer_stop/ProgressBar_stop

func _ready() -> void:
	timer_push.stop()
	timer_stop.stop()

func push_ult(ball : CharacterBody2D):
	if is_push_available:
		is_push_available = false
		
		ball.velocity = -ball.velocity
		
		timer_push.start(push_cd)
	

func _on_timer_timeout() -> void:
	is_push_available = true

func stop_ult(ball : CharacterBody2D):
	if is_stop_available:
		is_stop_available = false
		
		current_vel = ball.velocity
		ball.velocity = Vector2(0, 0)
		await get_tree().create_timer(3).timeout
		ball.velocity = current_vel
		
		timer_stop.start(stop_cd)

func _on_timer_stop_timeout() -> void:
	is_stop_available = true

func _process(_delta: float) -> void: #for progress bars
	if !is_push_available:
		progress_bar_push.value = 1 - timer_push.time_left / timer_push.wait_time
	else:
		progress_bar_push.value = 1
	
	if !is_stop_available:
		if timer_stop.is_stopped():
			progress_bar_stop.value = 0
		else:
			progress_bar_stop.value = 1 - (timer_stop.time_left / timer_stop.wait_time)
	else:
		progress_bar_stop.value = 1
