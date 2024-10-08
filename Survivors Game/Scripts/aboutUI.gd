extends CanvasLayer

#Loading references for other scenes and scripts
@onready var dev_category = $Tabs/DevCategory
@onready var character_category = $Tabs/CharacterCategory
@onready var pick_ups_category = $Tabs/PickUpsCategory
@onready var other_category = $Tabs/OtherCategory
@onready var about_dev = $Panels/Dev/AboutDev
@onready var why = $Panels/Dev/Why
@onready var dev = $Panels/Dev
@onready var characters = $Panels/Characters
@onready var devFocus = $Tabs/Categories/Dev

#Creating variables
var active_tab
var active_panel_tab
var active_panel 

#Setting variables and grabbing the first buttons focus on ready
func _ready():
	devFocus.grab_focus()
	active_tab = dev_category
	active_panel_tab = dev
	active_panel = about_dev

#Functions for when buttons are pressed
func _on_dev_pressed():
	active_tab.visible = false
	active_tab = dev_category
	active_tab.visible = true
	
	active_panel_tab.visible = false
	active_panel_tab = dev
	active_panel_tab.visible = true

func _on_characters_pressed():
	active_tab.visible = false
	active_tab = character_category
	active_tab.visible = true
	
	active_panel_tab.visible = false
	active_panel_tab = characters
	active_panel_tab.visible = true

func _on_pick_ups_pressed():
	active_tab.visible = false
	active_tab = pick_ups_category
	active_tab.visible = true
	
	active_panel_tab.visible = false
	active_panel_tab = dev
	active_panel_tab.visible = true

func _on_other_pressed():
	active_tab.visible = false
	active_tab = other_category
	active_tab.visible = true
	
	active_panel_tab.visible = false
	active_panel_tab = dev
	active_panel_tab.visible = true

func _on_dev_panel_pressed():
	active_panel.visible = false
	active_panel = about_dev
	active_panel.visible = true

func _on_why_pressed():
	active_panel.visible = false
	active_panel = why
	active_panel.visible = true

func _on_back_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_menu.tscn")
