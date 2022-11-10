extends KinematicBody2D


# Declare member variables here. Examples:
var direction:= Vector2()
var player_location
var speed = 200


# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	movement(player_location, delta)


func _input(event):
	# Mouse in viewport coordinates.
	if event is InputEventMouseMotion:
		player_location = event.position


func movement(end_point, time):
	direction = end_point - position
	direction = direction.normalized()
	position += direction * speed * time
