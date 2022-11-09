extends KinematicBody2D


# Declare member variables here. Examples:
var body_size = 10.0
const DEF_BOD_SIZE = 10.0

const MAX_SPEED = 1000.0
var speed = 500.0
var accel = 0.2
var deccel = 0.1

var direction = Vector2.ZERO
var velocity = Vector2.ZERO

var alive = true


func _physics_process(delta: float) -> void:
	get_input()
	process_movement()
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
func process_movement():
	if direction != Vector2.ZERO and alive:
		velocity = lerp(velocity, speed * direction, accel)
	else:
		velocity = lerp(velocity, Vector2.ZERO, deccel)
	
	velocity = move_and_slide(velocity)

# moves player
func animate_player():
	scale = Vector2(body_size/DEF_BOD_SIZE, body_size/DEF_BOD_SIZE)
	speed = 1000 * exp(0.1 * log(0.2) * body_size)

func shoot(type, direction):
	if type == 0 and body_size > 1:
		body_size -= 1
			
		# TODO shoot a bullet
	print(speed)
