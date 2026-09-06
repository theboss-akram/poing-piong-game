extends CharacterBody2D

var speed = randi_range(400, 600)

var randx : float:
	get:
		randomize()
		if randi_range(1,2) == 1:
			return randf_range(-1, -0.2)
		else:
			return randf_range(0.2, 1)

var randy : float:
	get:
		randomize()
		if randi_range(1,2) == 1:
			return randf_range(-1, -0.2)
		else:
			return randf_range(0.2, 1)

@onready var barrier_1: CharacterBody2D = $"../barrier1"
@onready var barrier_2: CharacterBody2D = $"../barrier2"

func _physics_process(delta):
	# move_and_collide returns collision data if the ball hits something
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		# Use the collider's surface normal to bounce perfectly
		velocity = velocity.bounce(collision.get_normal())
		
		if not_barrier(collision):
			rand_speed()
		velocity = velocity.normalized() * speed

func not_barrier(collision) -> bool:
	return collision.get_collider() != barrier_1 and collision.get_collider() != barrier_2

func reset_ball():
	position = Vector2(0, 0)
	randomize()
	velocity = Vector2(randx, randy).normalized() * speed

func rand_speed():
	randomize()
	speed = randi_range(400, 600)
