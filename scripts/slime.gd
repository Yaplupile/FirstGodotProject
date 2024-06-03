extends Node2D

const SPEED = 60;
var direction = 1;
var skip;

@onready var ray_cast_left = $RayCastLeft
@onready var ray_cast_right = $RayCastRight
@onready var ray_cast_down_left = $RayCastDownLeft
@onready var ray_cast_down_right = $RayCastDownRight

@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var ray_cast_floor_2 = $RayCastFloor2
@onready var ray_cast_floor = $RayCastFloor



func _process(delta):
	skip = false
	if ray_cast_right.is_colliding() && !skip :
		direction = -1;
		skip=true
	if ray_cast_left.is_colliding() && !skip :
		direction = 1;
		skip=true
	if !ray_cast_down_left.is_colliding() && !skip :
		direction = 1;
		skip=true
	if !ray_cast_down_right.is_colliding() && !skip :
		direction = -1;
		skip=true
		
	if direction == -1 : 
		animated_sprite_2d.flip_h = true ;
	else : 
		animated_sprite_2d.flip_h = false;
	
	if !ray_cast_floor.is_colliding():
		position.y += SPEED*delta;
	if ray_cast_floor_2.is_colliding():
		position.y -= SPEED*delta;
	
	
	position.x += SPEED * delta * direction;
