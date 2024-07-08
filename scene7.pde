import processing.sound.*;

public class scene7 {
  SoundFile music1;
  SoundFile music2;
  int startFrame;
  boolean isFinished;
  float posX = 640;
  float posXPeti = 640;
  float posY = 360;
  float speedX = 2;
  float speedY = 1.5;
  PApplet parent;
  float armAngle = 0;
  float legAngle = 0;
  float armSpeed = 0.05;
  float legSpeed = 0.05;

  int startTime;
  boolean musicChanged = false;
  boolean viewChanged = false;

  scene7(PApplet parent) {
    this.parent = parent;
    music1 = new SoundFile(parent, "Adegan7.MP3");
    music2 = new SoundFile(parent, "Adegan7-1.MP3");
  }

  void setup() {
    isFinished = false;
    music1.play();
    startTime = millis(); // Simpan waktu saat setup dipanggil
  }

  void draw() {
    int currentTime = millis() - startTime; // Hitung waktu yang telah berlalu sejak setup dipanggil
    float timeInSeconds = currentTime / 1000.0; // Ubah menjadi detik
    int duration = 87; // Durasi dalam detik

    //System.out.println(timeInSeconds);

    if (timeInSeconds >= duration) {
      isFinished = true;
    } else if (timeInSeconds <= 37) {
      tempatTerakhir();
      drawBurung((posX/6)*2+240, (posY/6)+320, armAngle, legAngle);
      drawCharacterKapten((posX / 6) * 2 + 240, (posY / 6) + 400, armAngle, legAngle);
      drawKapal2((posX/6)+40,(posY/6),3);
      drawHarta(220,530,-348, 166);
    } else if (timeInSeconds <= 45) {
      tempatTerakhir();
      if (timeInSeconds >= 38 && !musicChanged) {
        music1.stop();
        music2.play();
        musicChanged = true; // Tandai bahwa musik telah berganti
      }
      drawBurung((posX/6)*3+243, (posY/6)+260, armAngle, legAngle);
      drawCharacterKapten((posX / 6) * 3 + 243, (posY / 6) + 340, armAngle, legAngle);
      drawKapal2((posX/6)+40,(posY/6)+40,3);
      drawHarta((posX/6)*3+406,(posY/6)+465,((-posXPeti/6)-78),(posY/6)+106);
    } else if (timeInSeconds <= 58) {
      tempatTerakhir();
      updatePosition();
      drawBurung((posX/6)*3+243, (posY/6)+260, armAngle, legAngle);
      drawCharacterKapten((posX / 6) * 3 + 243, (posY / 6) + 340, armAngle, legAngle);
      drawKapal2((posX/6)+40,(posY/6)+40,3);
      drawHarta((posX/6)*3+406,(posY/6)+465,((-posXPeti/6)-78),(posY/6)+106);
    } else if (timeInSeconds >= 58) {
      if(timeInSeconds>=57 && !viewChanged){
        posX = -650;
        posXPeti = -195;
        viewChanged = true;
      }
      tengahLaut();
      updatePosition();
      drawBurung((posX/6)*3+250, (posY/6)+150, armAngle, legAngle);
      drawCharacterKapten((posX/6)*3+250, (posY/6)+230, armAngle, legAngle);
      drawKapal2((posX/6)+40,(posY/6),3);
      drawHarta((posX/6)*3+406,(posY/6)+345,((-posXPeti/6)-425),(posY/6)+66);
    }
  }
  
  void stopMusic() {
    music1.stop();
    music2.stop();
  }

  void updatePosition() {
    posX += speedX;
    posXPeti -= speedX;

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
