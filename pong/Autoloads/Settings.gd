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

func adjustVolume(volume : float) -> float:
	if volume > 100:
		volume = 100
	elif volume < 0:
		volume = 0
	return volume

func setSoundVolume(volume : float) -> void:
	soundVolume = adjustVolume(volume)
	emit_signal("soundVolumeChange", soundVolume)
	
func getSoundVolume() -> float:
	return soundVolume
	
func setMusicVolume(volume : float) -> void:
	musicVolume = adjustVolume(volume)
	emit_signal("musicVolumeChange", musicVolume)
	
func getMusicVolume() -> float:
	return musicVolume