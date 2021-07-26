extends Node2D
#https://www.youtube.com/watch?v=RXIRkou021U

export var k = 0.015
export var d = 0.03
export var spread = 0.0002

var springs = []
var passes = 8

export var distance_between_springs = 32
export var spring_number = 6

var water_lenght = distance_between_springs * spring_number
onready var water_spring = preload("res://Water_spring.tscn")

export var depth = 1000
var target_height = global_position.y
var bottom = target_height + depth

onready var water_polygon = $Water_polygon
onready var collisionShape = $Water_body_area/CollisionShape2D
onready var water_body_area = $Water_body_area

func _ready():
	for i in range(spring_number):
		var x_position = distance_between_springs * i
		var w = water_spring.instance()
		add_child(w)
		springs.append(w)
		w.initialize(x_position, i)
		w.set_collision_width(distance_between_springs)
		w.connect("splash", self, "splash")
		
	var total_lenght = distance_between_springs * (spring_number - 1)
	var rectangle = RectangleShape2D.new().duplicate()
	var rect_position = Vector2(total_lenght/2, depth/2)
	var rect_extents = Vector2(total_lenght/2, depth/2)
	
	water_body_area.position = rect_position
	rectangle.set_extents(rect_extents)
	collisionShape.set_shape(rectangle)
	
	pass 

# warning-ignore:unused_argument
func _physics_process(delta):
	for i in springs:
		i.water_update(k, d)
		
	var left_deltas = []
	var right_deltas = []
	
# warning-ignore:unused_variable
	for i in range (springs.size()):
		left_deltas.append(0)
		right_deltas.append(0)
		pass
	
# warning-ignore:unused_variable
	for j in range(passes):
		for i in range(springs.size()):
			if(i > 0):
				left_deltas[i] = spread * (springs[i].height - springs[i-1].height)
				springs[i-1].velocity += left_deltas[i]
			if(i < springs.size() - 1):
				right_deltas[i] = spread * (springs[i].height - springs[i+1].height)
				springs[i+1].velocity += right_deltas[i]
	
	draw_water_body()
	pass
	
func splash(index, speed):
	if(index >= 0 && index < springs.size()):
		springs[index].velocity += speed
	pass

func draw_water_body():
	var surface_points = []
	for i in range(springs.size()):
		surface_points.append(springs[i].position)
		
	var first_index = 0
	var last_index = surface_points.size()-1
	
	var water_polygon_points = surface_points
	
	water_polygon_points.append(Vector2(surface_points[last_index].x, bottom))
	water_polygon_points.append(Vector2(surface_points[first_index].x, bottom))
	
	water_polygon_points = PoolVector2Array(water_polygon_points)
	water_polygon.set_polygon(water_polygon_points)
	pass


func _on_Water_body_area_body_entered(body):
	
	pass
