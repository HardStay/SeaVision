import processing.sound.*;

public class scene5 {
  SoundFile music1;
  SoundFile music2;
  PApplet parent;
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
  boolean musicChanged = false;
  boolean viewChanged = false;
  
  scene5(PApplet parent) {
    this.parent = parent;
    music1 = new SoundFile(parent, "Adegan5.MP3");
    music2 = new SoundFile(parent, "Adegan5-1.MP3");
  }

  void setup() {
    isFinished = false;
    music1.play();
    startTime = millis(); // Simpan waktu saat setup dipanggil
  }

  void draw() {
    int currentTime = millis() - startTime; // Hitung waktu yang telah berlalu sejak setup dipanggil
    float timeInSeconds = currentTime / 1000.0; // Ubah menjadi detik
    int duration = 62; // Durasi dalam detik
    
    Pulau3();
    //System.out.println(timeInSeconds);
    
    if (timeInSeconds >= duration) {
      isFinished = true;
    } else if (timeInSeconds <= 33) {
      drawKapal(146, 10, 3);
      drawBurung((posX/6)*3+300, (posY/6)+370, armAngle, legAngle);
      drawCharacterKapten((posX / 6) * 3 + 300, (posY / 6) + 450, armAngle, legAngle);
      drawCharacter1((posX / 6) * 3 + 250, (posY / 6) + 480, armAngle, legAngle);
      drawCharacter2((posX / 6) * 3 + 380, (posY / 6) + 480, armAngle, legAngle);
    } else if (timeInSeconds <= 48) {
      if (timeInSeconds >= 34 && !musicChanged) {
        music1.stop();
        music2.play();
        musicChanged = true; // Tandai bahwa musik telah berganti
      }
      updatePosition();
      drawCharacter1((posX / 6) * 3 + 320, (posY / 6) + 85, armAngle, legAngle);
      drawKapal((posX / 6)+40, (posY / 6)-50, 3);
      drawBurung(620, 430, armAngle, legAngle);
      drawCharacterKapten(620, 510, 0, 0);
      drawCharacter2((posX / 6) * 3 + 380, (posY / 6) + 135, armAngle, legAngle);
    } else if (timeInSeconds >= 48) {
      if(timeInSeconds>=48 && !viewChanged){
        posX = 640;
        armAngle = 0;
        legAngle = 0;
        viewChanged = true;
      }
      drawBurung((posX/6)*3+300, (posY/6)+370, armAngle, legAngle);
      drawCharacterKapten((posX / 6) * 3 + 300, (posY / 6) + 450, 0, 0);
      //drawCharacter1((posX / 6) * 3 - 50, (posY / 6) + 480, armAngle, legAngle);
      //drawCharacter2((posX / 6) * 3 + 80, (posY / 6) + 480, armAngle, legAngle);
    }
  }

  void stopMusic() {
    music1.stop();
    music2.stop();
  }

  void updatePosition() {
    posX += speedX;

     //Membalik arah ketika mencapai batas layar
    //if (posX >= parent.width + 650) {
    //  posX = 640;
    //  armAngle = 0;
    //  legAngle = 0;
    //}

    armAngle += armSpeed;
    //legAngle += legSpeed;

    // Membalik arah gerakan ayunan
    if (armAngle > PConstants.PI / 6 || armAngle < -PConstants.PI / 6) {
      armSpeed *= -1;
    }
    //if (legAngle > PConstants.PI / 6 || legAngle < -PConstants.PI / 6) {
    //  legSpeed *= -1;
    //}
  }
}
