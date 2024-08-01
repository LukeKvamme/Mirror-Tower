extends StaticBody2D

var health: int = 10
var projectile_speed: int = 1000
var projectile = preload("res://scenes/projectile.tscn")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body):
	if body.collision_mask == 3:
		_fire(body)


func _fire(target):
	var projectile_instance = projectile.instantiate()
	var impulse = Vector2(1,1) * (projectile_speed) # force of the impulse on the projectile (the speed basically)
	projectile_instance.position = get_global_position() # spawns projectile on the tower
	projectile_instance.face(target) # makes the projectile aim at the target body
	
	var angle = target.rotation # cannot fully explain how this works but it will angle it toward the target
	projectile_instance.apply_central_impulse(-Vector2(cos(angle), sin(angle)) * impulse)
	
	get_tree().get_root().call_deferred("add_child", projectile_instance)
