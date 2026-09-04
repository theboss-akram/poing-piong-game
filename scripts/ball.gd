extends CharacterBody2D

var speed = 400

func _physics_process(delta):
	# move_and_collide returns collision data if the ball hits something
	var collision = move_and_collide(velocity * delta)
	
	if collision:
		# Use the collider's surface normal to bounce perfectly
		velocity = velocity.bounce(collision.get_normal())
	

func reset_ball():
	position = Vector2(0, 0)
	randomize()
	velocity = Vector2(randf_range(-0.8, 0.8), randf_range(-0.8, 0.8)).normalized() * speed
