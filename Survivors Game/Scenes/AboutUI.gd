extends CanvasLayer


@onready var dev_category = $Tabs/DevCategory
@onready var character_category = $Tabs/CharacterCategory
@onready var pick_ups_category = $Tabs/PickUpsCategory
@onready var other_category = $Tabs/OtherCategory
var activeTab

func _ready():
	activeTab = dev_category

func _on_dev_pressed():
	activeTab.visible = false
	activeTab = dev_category
	activeTab.visible = true

func _on_characters_pressed():
	activeTab.visible = false
	activeTab = character_category
	activeTab.visible = true

func _on_pick_ups_pressed():
	activeTab.visible = false
	activeTab = pick_ups_category
	activeTab.visible = true

func _on_other_pressed():
	activeTab.visible = false
	activeTab = other_category
	activeTab.visible = true
