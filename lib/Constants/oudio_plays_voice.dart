class oudio_plays_voice{
  List oudio_plays_voice_sleep=[];
  List oudio_plays_voice_morning=[];
  List oudio_plays_voice_evening=[];
  azkar_texts(int index) {
    if (index == 3) {
      oudio_plays_voice_sleep = [
          "oudio_plays/sleep.mp3",
      ];
    }
    if (index == 1) {
      oudio_plays_voice_morning = [
        "oudio_plays/morning.mp3",
      ];
    }
    if (index == 2) {
      oudio_plays_voice_evening = [
        "oudio_plays/evening.mp3",
      ];
    }
  }
  oudio_plays_voice_sleep_index(int index,int item) {
    if (index == 3) {
      return oudio_plays_voice_sleep[item];
    }
    if (index == 1) {
      return oudio_plays_voice_morning[item];
    }
    if (index == 2) {
      return oudio_plays_voice_evening[item];
    }
  }
}