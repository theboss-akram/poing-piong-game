extends CharacterBody2D

var speed = randi_range(400, 600)
@onready var barrier_1: CharacterBody2D = $"../barrier1"
@onready var barrier_2: CharacterBody2D = $"../barrier2"

func _physics_process(delta):
	# move_and_collide returns collision data if the ball hits something
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		# Use the collider's surface normal to bounce perfectly
		velocity = velocity.bounce(collision.get_normal())
		
		if collision.get_collider() != barrier_1 || collision.get_collider() != barrier_2:
			rand_speed()
		velocity = velocity.normalized() * speed
	

func reset_ball():
	position = Vector2(0, 0)
	randomize()
	velocity = Vector2(randf_range(-0.8, 0.8), randf_range(-0.8, 0.8)).normalized() * speed

func rand_speed():
	randomize()
	speed = randi_range(400, 600)
