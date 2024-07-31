extends CharacterBody2D

var damage: int = 1
var speed: float = 300.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	velocity = transform.x * speed * delta
	move_and_collide(velocity)

#deal damage / take damage with this (detects things entering Area2D Node)
func _on_area_2d_area_entered(area):
	pass # Replace with function body.
