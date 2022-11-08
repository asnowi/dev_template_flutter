import 'package:dev_template_flutter/common/utils/utils.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audio_session/audio_session.dart';

class AudioUtils {


  late AudioPlayer audioPlayer;

  // static _instance，_instance会在编译期被初始化，保证了只被创建一次
  static final AudioUtils _instance = AudioUtils._internal();

  //提供了一个工厂方法来获取该类的实例
  factory AudioUtils(){
    return _instance;
  }

  // 通过私有方法_internal()隐藏了构造方法，防止被误创建
  AudioUtils._internal(){
    audioPlayer = AudioPlayer();
  }


  void onPlay() async{
    final session = await AudioSession.instance;
    await session.configure(const AudioSessionConfiguration.speech());
    try {
      await audioPlayer.setAsset(AssetsProvider.loadAudio('scan_buzzer',type: 'ogg'));
      await audioPlayer.play();
    } catch (ex) {
      LogUtils.GGQ('-----audio-error--->>${ex.toString()}');
    }
  }

}