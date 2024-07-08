import processing.sound.*;

public class scene6 {
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

  scene6(PApplet parent) {
    music = new SoundFile(parent, "Adegan6.MP3");
  }

  void setup() {
    isFinished = false;
    music.play();
    startTime = millis(); // Simpan waktu saat setup dipanggil
  }

  void draw() {
    int currentTime = millis() - startTime; // Hitung waktu yang telah berlalu sejak setup dipanggil
    float timeInSeconds = currentTime / 1000.0; // Ubah menjadi detik
    int duration = 36; // Durasi dalam detik

    tempatHarta();
    drawHarta(220,530,-348.25171, 166.2254994);
    //System.out.println(timeInSeconds);

    if (timeInSeconds >= duration) {
      isFinished = true;
    } else if (timeInSeconds <= 16) {
      drawBurung((posX/6)*2+250, (posY/6)+320, armAngle, legAngle);
      drawCharacterKapten((posX / 6) * 2 + 250, (posY / 6) + 400, armAngle, legAngle);
    } else if (timeInSeconds >= 16) {
      updatePosition();
      drawBurung((posX/6)*2+250, (posY/6)+320, armAngle, legAngle);
      drawCharacterKapten((posX / 6) * 2 + 250, (posY / 6) + 400, armAngle, legAngle);
    }
  }
  void stopMusic() {
    music.stop();
  }

  void updatePosition() {
    posX += speedX;

    //// Membalik arah ketika mencapai batas layar
    //if (posX >= width - 150) {
    //  speedX *= -1;
    //}

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
