//import processing.sound.*;
//SoundFile file1;
//SoundFile file2;
//float time = 0;
int currentScene = 0;
scene1 scene1;
scene2 scene2;
scene3 scene3;
scene4 scene4;
scene5 scene5;
scene6 scene6;
scene7 scene7;
void setup() {
  size(1280, 720);
  scene1 = new scene1(this);
  scene2 = new scene2(this);
  scene3 = new scene3(this);
  scene4 = new scene4(this);
  scene5 = new scene5(this);
  scene6 = new scene6(this);
  scene7 = new scene7(this);
  scene1.setup();
  frameRate(30);
}

void draw() {
  background(0);
  scene1.draw();
  switch (currentScene) {
    case 0:
      scene1.draw();
      if (scene1.isFinished) {
        currentScene = 1;
        scene1.stopMusic();
        scene2.setup();
      }
      break;
    case 1:
      scene2.draw();
      if (scene2.isFinished) {
        currentScene = 2;
        scene2.stopMusic();
        scene3.setup();
      }
      break;
    case 2:
      scene3.draw();
      if (scene3.isFinished) {
        currentScene = 3;
        scene3.stopMusic();
        scene4.setup();
      }
      break;
    case 3:
      scene4.draw();
      if (scene4.isFinished) {
        currentScene = 4;
        scene4.stopMusic();
        scene5.setup();
      }
      break;
    case 4:
      scene5.draw();
      if (scene5.isFinished) {
        currentScene = 5;
        scene5.stopMusic();
        scene6.setup();
      }
      break;
    case 5:
      scene6.draw();
      if (scene6.isFinished) {
        currentScene = 6;
        scene6.stopMusic();
        scene7.setup();
      }
      break;
    case 6:
      scene7.draw();
      if (scene7.isFinished) {
        exit();
      }
      break;
  }
  //time++;
}
