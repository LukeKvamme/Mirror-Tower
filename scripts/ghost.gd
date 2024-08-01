extends CharacterBody2D

var damage: int = 1
var speed: float = 30.0
var motion: Vector2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	var tower = get_parent().get_node("Mirror Tower")
	position += (tower.position - position) / speed
	look_at(tower.position)
	
	move_and_collide(motion)


func _on_area_2d_body_entered(body):
	if body.collision_layer == 2:
		queue_free()
		
