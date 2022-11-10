extends Area2D


# Declare member variables here. Examples:
const SCREEN_WIDTH = 1024
const SCREEN_HEIGHT = 600

var speed = 5
var direction = Vector2(1,0)


# Called when the node enters the scene tree for the first time.
#func _ready() -> void:
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	position += speed * direction * delta

func _process(delta: float) -> void:
	if position.x >= SCREEN_WIDTH or position.y >= SCREEN_HEIGHT:
		print("done")
		queue_free()
