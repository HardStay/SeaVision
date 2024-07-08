import processing.sound.*;

public class scene3 {
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

  scene3(PApplet parent) {
    music = new SoundFile(parent, "Adegan3.MP3");
  }

  void setup() {
    isFinished = false;
    music.play();
    startTime = millis(); // Simpan waktu saat setup dipanggil
  }

  void draw() {
    int currentTime = millis() - startTime; // Hitung waktu yang telah berlalu sejak setup dipanggil
    float timeInSeconds = currentTime / 1000.0; // Ubah menjadi detik
    int duration = 43; // Durasi dalam detik

    Pulau2();
    drawKapal(146, 380, 1);
    //System.out.println(timeInSeconds);

    if (timeInSeconds >= duration) {
      isFinished = true;
    } else if (timeInSeconds <= 14) {
      drawBurung((posX/6)*2+250, (posY/6)+220, armAngle, legAngle);
      drawCharacterKapten((posX / 6) * 2 + 250, (posY / 6) + 300, armAngle, legAngle);
      drawCharacter1((posX / 6) * 2 + 200, (posY / 6) + 300, armAngle, legAngle);
      drawCharacter2((posX / 6) * 2 + 330, (posY / 6) + 300, armAngle, legAngle);
    } else if (timeInSeconds <= 14 + 16) {
      updatePosition();
      drawBurung((posX/6)*2+250, (posY/6)+220, armAngle, legAngle);
      drawCharacterKapten((posX / 6) * 2 + 250, (posY / 6) + 300, armAngle, legAngle);
      drawCharacter1((posX / 6) * 2 + 200, (posY / 6) + 300, armAngle, legAngle);
      drawCharacter2((posX / 6) * 2 + 330, (posY / 6) + 300, armAngle, legAngle);
    } else if (timeInSeconds > 14 + 16) {
      drawBurung((posX/6)*2+250, (posY/6)+220, armAngle, legAngle);
      drawCharacterKapten((posX / 6) * 2 + 250, (posY / 6) + 300, armAngle, legAngle);
      drawCharacter1((posX / 6) * 2 + 200, (posY / 6) + 300, armAngle, legAngle);
      drawCharacter2((posX / 6) * 2 + 330, (posY / 6) + 300, armAngle, legAngle);
    }
  }
  
  void stopMusic() {
    music.stop();
  }

  void updatePosition() {
    posX += speedX;

    // Membalik arah ketika mencapai batas layar
    if (posX >= width - 150 || posX <= 250) {
      speedX *= -1;
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
