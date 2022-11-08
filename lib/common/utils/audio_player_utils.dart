
import 'package:audioplayers/audioplayers.dart';

class AudioPlayerUtils {

  late AudioPlayer audioPlayer;

  // static _instance，_instance会在编译期被初始化，保证了只被创建一次
  static final AudioPlayerUtils _instance = AudioPlayerUtils._internal();

  //提供了一个工厂方法来获取该类的实例
  factory AudioPlayerUtils(){
    return _instance;
  }

  // 通过私有方法_internal()隐藏了构造方法，防止被误创建
  AudioPlayerUtils._internal(){
    audioPlayer = AudioPlayer();
  }

  // /// 设置路径
  Future<AudioPlayerUtils> loadSource(String audioName) async{
    await audioPlayer.setSourceAsset('sounds/${audioName}');
    return this;
  }

  /// 播放
  Future<void> play(String name) async {
    await audioPlayer.play(UrlSource(name));
  }

  /// 释放资源
  Future<void> release() async{
    await audioPlayer.release();
  }


}