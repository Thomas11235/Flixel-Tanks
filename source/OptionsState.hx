package ;

import flixel.FlxG;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.ui.FlxBar;
import flixel.util.FlxColor;
import flixel.util.FlxSave;
import flixel.util.FlxDestroyUtil;
using flixel.util.FlxSpriteUtil;

class OptionsState extends FlxState
{
	private var _txtTitle:FlxText;
	private var _txtVolumeStat:FlxText;
	private var _txtVolume:FlxText;
	private var _btnReset:FlxButton;
	private var _btnBack:FlxButton;
	private var _btnFullscreen:FlxButton;
	private var _btnVolumeUp:FlxButton;
	private var _btnVolumeDown:FlxButton;
	private var _barVolume:FlxBar;
	private var _save:FlxSave;
	

	override public function create():Void {
		
		//Sets up the save to store settings
		_save = new FlxSave();
		_save.bind("tanks");
		
		//Checks if the volume was saved and, if so, sets the current volume to that value
		if (_save.data.volume != null)
			FlxG.sound.volume = _save.data.volume;
		
		//Displays the title
		_txtTitle = new FlxText(0, 20, 0, "Options", 22);
		_txtTitle.alignment = "center";
		_txtTitle.screenCenter(true, false);
		add(_txtTitle);
		
		//Shows the text "Volume"
		_txtVolume = new FlxText(0, _txtTitle.y + _txtTitle.height + 50, 0, "Volume", 8);
		_txtVolume.alignment = "center";
		_txtVolume.screenCenter(true, false);
		add(_txtVolume);
		
		//Adds a button to decrease the volume
		_btnVolumeDown = new FlxButton(128, _txtVolume.y + _txtVolume.height + 2, "-", volumeDown);
		_btnVolumeDown.loadGraphic("assets/images/button.png", true, 20, 20);
		add(_btnVolumeDown);
		
		//Adds a button to increase the volume
		_btnVolumeUp = new FlxButton(FlxG.width - (128 + _btnVolumeDown.width), _btnVolumeDown.y, "+", volumeUp);
		_btnVolumeUp.loadGraphic("assets/images/button.png", true, 20, 20);
		add(_btnVolumeUp);
		
		//Adds a volume bar
		_barVolume = new FlxBar(_btnVolumeDown.x + _btnVolumeDown.width, _btnVolumeDown.y, FlxBar.FILL_LEFT_TO_RIGHT, Std.int(FlxG.width - (256 + (_btnVolumeDown.width + _btnVolumeUp.width))), Std.int(_btnVolumeDown.height));
		_barVolume.createFilledBar(FlxColor.CHARCOAL, FlxColor.WHITE, true);
		add(_barVolume);
		
		//Adds a volume status text
		_txtVolumeStat = new FlxText(0, 0, 200, Std.string(FlxG.sound.volume * 100) + "%", 8);
		_txtVolumeStat.alignment = "center";
		_txtVolumeStat.borderStyle = FlxText.BORDER_OUTLINE;
		_txtVolumeStat.borderColor = FlxColor.CHARCOAL;
		_txtVolumeStat.y = _barVolume.y + (_barVolume.height / 2) - (_txtVolumeStat.height / 2);
		_txtVolumeStat.screenCenter(true, false);
		add(_txtVolumeStat);
		
		//Adds a button to toggle between fullscreen and windowed
		_btnFullscreen = new FlxButton(0, _barVolume.y + _barVolume.height + 20, FlxG.fullscreen ? "Windowed" : "Fullscreen", toggleFullscreen);
		_btnFullscreen.screenCenter(true, false);
		add(_btnFullscreen);
		
		//Adds a button to reset everything to default
		_btnReset = new FlxButton(0, _btnFullscreen.y + _btnFullscreen.height + 20, "Reset", resetDefault);
		_btnReset.screenCenter(true, false);
		add(_btnReset);
		
		//Adds a button to go back to the main menu
		_btnBack = new FlxButton(0, _btnReset.y + _btnReset.height + 20, "Back", goBack);
		_btnBack.screenCenter(true, false);
		add(_btnBack);
		
		//Loads the saved volume and displays it
		updateVolume();
	}
	
	override public function destroy():Void {
		super.destroy();
		
		//Destroys all objects
		_txtTitle = FlxDestroyUtil.destroy(_txtTitle);
		_txtVolume = FlxDestroyUtil.destroy(_txtVolume);
		_txtVolumeStat = FlxDestroyUtil.destroy(_txtVolumeStat);
		_btnReset = FlxDestroyUtil.destroy(_btnReset);
		_btnBack = FlxDestroyUtil.destroy(_btnBack);
		_btnFullscreen = FlxDestroyUtil.destroy(_btnFullscreen);
		_btnVolumeDown = FlxDestroyUtil.destroy(_btnVolumeDown);
		_btnVolumeUp = FlxDestroyUtil.destroy(_btnVolumeUp);
		
		_save.destroy();
		_save = null;
	}
	
	private function updateVolume() {
		//Gets the current volume and updates the volume bar and text
		var vol:Int = Math.round(FlxG.sound.volume * 100);
		_barVolume.currentValue = vol;
		_txtVolumeStat.text = Std.string(vol + "%");
	}
	
	private function volumeDown() {
		//Decreases the volume by 5%, saves the current volume and finally updates the bar and text
		FlxG.sound.volume -= 0.05;
		_save.data.volume = FlxG.sound.volume;
		updateVolume();
	}
	
	private function volumeUp() {
		//Increases the volume by 5%, saves the current volume and finally updates the bar and text
		FlxG.sound.volume += 0.05;
		_save.data.volume = FlxG.sound.volume;
		updateVolume();
	}
	
	private function goBack() {
		_save.close();
		FlxG.camera.fade(FlxColor.BLACK,.33, false, function() {
			FlxG.switchState(new MenuState());
		});
	}
	
	private function toggleFullscreen() {
		FlxG.fullscreen = !FlxG.fullscreen;
		_btnFullscreen.text = FlxG.fullscreen ? "Windowed" : "Fullscreen";
		_save.data.fullscreen = FlxG.fullscreen;
	}
	
	private function resetDefault() {
		FlxG.sound.volume = 0.5;
		_save.data.volume = FlxG.sound.volume;
		updateVolume();
		
		if (FlxG.fullscreen) {
			toggleFullscreen();
		}
	}
}