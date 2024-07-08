import processing.sound.*;

public class scene2 {
  SoundFile music;
  int startFrame;
  boolean isFinished;
  float posX = 640;
  float posY = 360;
  float speedX = 2;
  float speedY = 1.5;

  float armAngle = 0;
  float legAngle = 0;
  float armSpeed = 0.05;
  float legSpeed = 0.05;

  int startTime;
  boolean musicPaused = false;
  boolean musicResumed = false;
  
  scene2(PApplet parent) {
    music = new SoundFile(parent, "Adegan2.MP3");
  }

  void setup() {
    isFinished = false;
    music.play();
    startTime = millis(); // Simpan waktu saat setup dipanggil
  }

  void draw() {
    int currentTime = millis() - startTime; // Hitung waktu yang telah berlalu sejak setup dipanggil
    float timeInSeconds = currentTime / 1000.0; // Ubah menjadi detik
    int duration = 46; // Durasi dalam detik
    
    Pulau1();
    drawKapal(146, 10, 3);
    //System.out.println(timeInSeconds);
    
    if (timeInSeconds >= duration) {
      isFinished = true;
    } else if (timeInSeconds <= 11) {
      drawBurung((posX/6)*3+300, (posY/6)+370, armAngle, legAngle);
      drawCharacterKapten((posX / 6) * 3 + 300, (posY / 6) + 450, armAngle, legAngle);
      drawCharacter1((posX / 6) * 3 + 250, (posY / 6) + 480, armAngle, legAngle);
      drawCharacter2((posX / 6) * 3 + 380, (posY / 6) + 480, armAngle, legAngle);
    } else if (timeInSeconds <= 11 + 11) {
      if (timeInSeconds >= 13 && !musicPaused) {
        music.pause();
        musicPaused = true; // Tandai bahwa musik telah dijeda
      }
      updatePosition();
      drawBurung((posX/6)*3+300, (posY/6)+370, armAngle, legAngle);
      drawCharacterKapten((posX / 6) * 3 + 300, (posY / 6) + 450, armAngle, legAngle);
      drawCharacter1((posX / 6) * 3 + 250, (posY / 6) + 480, armAngle, legAngle);
      drawCharacter2((posX / 6) * 3 + 380, (posY / 6) + 480, armAngle, legAngle);
    } else if (timeInSeconds > 11 + 11) {
      if (timeInSeconds >= 23 && !musicResumed) {
        music.play();
        musicResumed = true; // Tandai bahwa musik telah diputar kembali
      }
      drawBurung((posX/6)*3, (posY/6)+370, armAngle, legAngle);
      drawCharacterKapten((posX / 6) * 3, (posY / 6) + 450, armAngle, legAngle);
      drawCharacter1((posX / 6) * 3 - 50, (posY / 6) + 480, armAngle, legAngle);
      drawCharacter2((posX / 6) * 3 + 80, (posY / 6) + 480, armAngle, legAngle);
    }
  }

  void stopMusic() {
    music.stop();
  }

  void updatePosition() {
    posX += speedX;

    // Membalik arah ketika mencapai batas layar
    if (posX >= width + 650) {
      posX = 640;
      armAngle = 0;
      legAngle = 0;
    }

    armAngle += armSpeed;
    legAngle += legSpeed;

    // Membalik arah gerakan ayunan
    if (armAngle > PConstants.PI / 6 || armAngle < -PConstants.PI / 6) {
      armSpeed *= -1;
    }
    if (legAngle > PConstants.PI / 6 || legAngle < -PConstants.PI / 6) {
      legSpeed *= -1;
    }
  }
}
