import processing.sound.*;
public class scene4 {
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
  
  scene4(PApplet parent) {
    music = new SoundFile(parent, "Adegan4.MP3");
  }

  void setup() {
    isFinished = false;
    music.play();
    startTime = millis(); // Simpan waktu saat setup dipanggil
  }

  void draw() {
    int currentTime = millis() - startTime; // Hitung waktu yang telah berlalu sejak setup dipanggil
    float timeInSeconds = currentTime / 1000.0; // Ubah menjadi detik
    int duration = 35; // Durasi dalam detik
    
    tengahLaut();
    updatePosition();
    //System.out.println(timeInSeconds);
    
    if (timeInSeconds >= duration) { 
      isFinished = true;
    } else if (timeInSeconds <= 12) {
      drawCharacter1((posX/6)*3+320, (posY/6)+235, armAngle, legAngle);
      drawKapal((posX/6)+40,(posY/6),3);
      drawBurung((posX/6)*3+420, (posY/6)+190, armAngle, legAngle);
      drawCharacterKapten((posX/6)*3+380, (posY/6)+270, armAngle, legAngle);
      drawCharacter2((posX/6)*3+420, (posY/6)+280, armAngle, legAngle);
    } else if (timeInSeconds <= 17) {
      drawCharacter2((posX/6)*3+200, (posY/6)+235, armAngle, legAngle);
      drawKapal((posX/6)+40,(posY/6),3);
      drawCharacter1((posX/6)*3+460, (posY/6)+280, armAngle, legAngle);
      drawBurung((posX/6)*3+480, (posY/6)+190, armAngle, legAngle);
      drawCharacterKapten((posX/6)*3+480, (posY/6)+270, armAngle, legAngle);
    } else if (timeInSeconds <= 24) {
      drawBurung((posX/6)*3+250, (posY/6)+150, armAngle, legAngle);
      drawCharacterKapten((posX/6)*3+250, (posY/6)+230, armAngle, legAngle);
      drawKapal((posX/6)+40,(posY/6),3);
      drawCharacter1((posX/6)*3+460, (posY/6)+280, armAngle, legAngle);
      drawCharacter2((posX/6)*3+420, (posY/6)+280, armAngle, legAngle);
    } else if (timeInSeconds <= 28) {
      drawCharacter1((posX/6)*3+320, (posY/6)+235, armAngle, legAngle);
      drawKapal((posX/6)+40,(posY/6),3);
      drawBurung((posX/6)*3+420, (posY/6)+190, armAngle, legAngle);
      drawCharacterKapten((posX/6)*3+380, (posY/6)+270, armAngle, legAngle);
      drawCharacter2((posX/6)*3+420, (posY/6)+280, armAngle, legAngle);
    } else if (timeInSeconds <= 32) {
      drawBurung((posX/6)*3+250, (posY/6)+150, armAngle, legAngle);
      drawCharacterKapten((posX/6)*3+250, (posY/6)+230, armAngle, legAngle);
      drawKapal((posX/6)+40,(posY/6),3);
      drawCharacter1((posX/6)*3+460, (posY/6)+280, armAngle, legAngle);
      drawCharacter2((posX/6)*3+420, (posY/6)+280, armAngle, legAngle);
    } else if (timeInSeconds >= 32) {
      drawCharacter2((posX/6)*3+200, (posY/6)+235, armAngle, legAngle);
      drawKapal((posX/6)+40,(posY/6),3);
      drawCharacter1((posX/6)*3+460, (posY/6)+280, armAngle, legAngle);
      drawBurung((posX/6)*3+480, (posY/6)+190, armAngle, legAngle);
      drawCharacterKapten((posX/6)*3+480, (posY/6)+270, armAngle, legAngle);
    }
  }
  
  void stopMusic() {
    music.stop();
  }
  
  void updatePosition() {
    posX += speedX;
    
    if (posX >= width + 650) {
      posX = -650;
    }

    armAngle += armSpeed;
    
    if (armAngle > PConstants.PI / 6 || armAngle < -PConstants.PI / 6) {
      armSpeed *= -1;
    }
  }
}
