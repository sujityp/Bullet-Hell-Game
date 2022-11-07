extends KinematicBody2D


# Declare member variables here. Examples:
var speed = 500
var body_size = 10
var accel = 0.1

var direction = Vector2.ZERO
var velocity = Vector2.ZERO

var alive = true


func _physics_process(delta: float) -> void:
	get_input()
	process_movement(delta)
	animate_player()

# gets player input
func get_input():
	direction = Vector2.ZERO
	
	if Input.is_action_pressed("ui_left"):
		direction.x -= 1
	if Input.is_action_pressed("ui_right"):
		direction.x += 1
	if Input.is_action_pressed("ui_up"):
		direction.y -= 1
	if Input.is_action_pressed("ui_down"):
		direction.y += 1

# calculates player velocity
func process_movement(time):
	if direction != Vector2.ZERO and alive:
		velocity = lerp(velocity, speed * direction, accel)
	else:
		velocity = lerp(velocity, Vector2.ZERO, accel)
	
	velocity = move_and_slide(velocity)

# moves player
func animate_player():
	pass
