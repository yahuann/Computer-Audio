import controlP5.*;
import beads.*;
import org.jaudiolibs.beads.*;

ControlP5 p5;
Gain gain;
Glide glide;
RadioButton radioButton;
RadioButton wordButton;
Button listButton;
WavePlayer wpNoise;
SamplePlayer spMusic;
SamplePlayer spCue;


void setup() {
  size(500,670);
  ac = new AudioContext();
  p5 = new ControlP5(this);
   PFont p = createFont("Verdana",20); 
   ControlFont font = new ControlFont(p);
   p5.setFont(font);
   
    glide = new Glide(ac,0.0,1);
    gain = new Gain(ac,1,glide);

   p5.addRadioButton("wordButton")
         .setPosition(20,200)
         .setSize(20,20)
         .setColorForeground(color(120))
         .setColorActive(color(200,18,24))
         .setColorLabel(color(0))
         .setItemsPerRow(4)
         .setSpacingColumn(100)
         .setSpacingRow(20)
         .addItem("Word1",1)
         .addItem("Word2",2)
         .addItem("Word3",3)
         .addItem("Word4",4)
         .addItem("Word5",5)
         .addItem("Word6",6)
         .addItem("Word7",7)
         .addItem("Word8",8)
             
         ;
       
         
         
     p5.addRadioButton("radioButton")
         .setPosition(20,20)
         .setSize(30,20)
         .setColorForeground(color(120))
         .setColorActive(color(200,18,24))
         .setColorLabel(color(0))
         .setItemsPerRow(2)
         .setSpacingColumn(200)
         .setSpacingRow(20)
         .addItem("Noise",1)
         .addItem("Music",2)
         .addItem("Audio Cue",3)
         .addItem("Slient",4)
         ;
         
         
    p5.addButton("listButton") {
        .setPosition(20,80)
         .setSize(30,20)
         .setColorForeground(color(120))
         .setColorActive(color(200,18,24))
         .setColorLabel(color(0))
  
    }
    
       
         

    p5.addSlider("Volume")
     .setColorLabel(color(0))
     .setPosition(20,150)
     .setSize(200,20)
     .setRange(0,100)
     .setValue(5)
     ;   
     
  
  
    wpNoise = new WavePlayer(ac,440,Buffer.SINE);
    spMusic = getSamplePlayer("test1.wav");
    spCue = getSamplePlayer("test2.wav");
    gain.addInput(wpNoise);
    gain.addInput(spMusic);
    gain.addInput(spCue);
    
    ac.out.addInput(gain);
    wpNoise.pause(true);
    spCue.pause(true);
    spMusic.pause(true);
    
    ac.start();
}     


void radioButton(int i) {
    if (i == 1) {
      //noise
      spMusic.pause(true);
      spCue.pause(true);
      wpNoise.start();
      
       
    } else if (i == 2) {
      //music
      spCue.pause(true);
      wpNoise.pause(true);
      spMusic.start();
    } else if (i == 3) {
      //cue
      wpNoise.pause(true);
      spMusic.pause(true);
      spCue.start();
     
    } else if (i == 4) {
       //silent
      spCue.pause(true);
      wpNoise.pause(true);
      spMusic.pause(true);
    }
}




void wordButton(int i) {
    if (i == 1) {
     
    } else if (i == 2) {
     
    } else if (i == 3) {
     
    } else if (i == 4) {
      
    } else if (i == 5) {
    
    } else if (i == 6) {
    
    } else if (i == 7) {
    
    } else if (i == 8) {
    
    }
}


void Volume(int value) {
  glide.setValue(value);
}


void draw(){
  background(1,220,177);
}
         
         
         
         
