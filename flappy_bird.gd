extends CharacterBody2D
const JUMP_VELOCITY = -400.0 # Use a negative value for 2D, positive for 3D
const GRAVITY = 400

func _physics_process(delta):
	velocity.y += delta * GRAVITY
	if Input.is_action_just_pressed("jump"):
		velocity.y = JUMP_VELOCITY
	var collision_info = move_and_collide(velocity * delta);
	if collision_info:
		print("Collision detected with: ", collision_info.get_collider());
		_lose();
	
	
func _lose():
	get_tree().reload_current_scene()
