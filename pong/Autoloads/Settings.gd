# warning-ignore-all:unused_class_variable
extends Node

signal soundVolumeChange(newValue)
signal musicVolumeChange(newValue)

const GAME_MODES = {
	single = "Single",
	duel = "Duel"
}

var soundVolume : float = 50.0 setget setSoundVolume, getSoundVolume
var musicVolume : float = 50.0 setget setMusicVolume, getMusicVolume

var gameMode : String = GAME_MODES.single

func adjustVolume(volume : float, bus : String) -> float:
	if volume > 100:
		volume = 100
	elif volume < 0:
		volume = 0
	var adjustedBusVolume = (volume * 0.8) - 70.0
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index(bus), adjustedBusVolume)
	return volume

func setSoundVolume(volume : float) -> void:
	soundVolume = adjustVolume(volume, "Sounds")
	emit_signal("soundVolumeChange", soundVolume)
	
func getSoundVolume() -> float:
	return soundVolume
	
func setMusicVolume(volume : float) -> void:
	musicVolume = adjustVolume(volume, "Music")
	emit_signal("musicVolumeChange", musicVolume)
	
func getMusicVolume() -> float:
	return musicVolume