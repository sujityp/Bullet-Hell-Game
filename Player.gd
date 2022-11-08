extends KinematicBody2D


# Declare member variables here. Examples:
var speed = 400
var body_size = 10
var accel = 0.2
var deccel = 0.1

var direction = Vector2.ZERO
var velocity = Vector2.ZERO

var alive = true


func _physics_process(delta: float) -> void:
	get_input()
	process_movement(delta)
	animate_player()

# gets player input
func get_input():
	# movement
	direction = Vector2.ZERO
	
	if Input.is_action_pressed("left"):
		direction.x -= 1
	if Input.is_action_pressed("right"):
		direction.x += 1
	if Input.is_action_pressed("up"):
		direction.y -= 1
	if Input.is_action_pressed("down"):
		direction.y += 1
		
	direction = direction.normalized()
	
	
	# shot
	if Input.is_action_just_pressed("shoot"):
		var mpos = get_viewport().get_mouse_position()
		shoot(0, mpos - position)


# calculates player velocity
func process_movement(time):
	if direction != Vector2.ZERO and alive:
		velocity = lerp(velocity, speed * direction, accel)
	else:
		velocity = lerp(velocity, Vector2.ZERO, deccel)
	
	velocity = move_and_slide(velocity)

# moves player
func animate_player():
	pass

func shoot(type, direction):
	# TODO - Eject a bullet
	
	scale = scale - Vector2(0.1, 0.1)
	pass
