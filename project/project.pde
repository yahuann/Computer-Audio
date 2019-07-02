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
   
    glide = new Glide(ac,10,1);
    gain = new Gain(ac,1,glide);

   p5.addRadioButton("wordButton")
         .setPosition(20,240)
         .setSize(20,20)
         .setColorForeground(color(120))
         .setColorActive(color(200,18,24))
         .setColorLabel(color(0))
         .setItemsPerRow(4)
         .setSpacingColumn(100)
         .setSpacingRow(10)
         .addItem("Word1",0)
         .addItem("Word2",1)
         .addItem("Word3",2)
         .addItem("Word4",3)
         .addItem("Word5",4)
         .addItem("Word6",5)
         .addItem("Word7",6)
         .addItem("Word8",7)
         .addItem("Word9",8)
         .addItem("Word10",9)
         .addItem("Word11",10)
         .addItem("Word12",11)
         .addItem("Word13",1)
         .addItem("Word14",13)
         .addItem("Word15",14)
         .addItem("Word16",15)
         ;
       
       p5.addRadioButton("languageButton")
         .setPosition(20,110)
         .setSize(30,20)
         .setColorForeground(color(120))
         .setColorActive(color(200,18,24))
         .setColorLabel(color(0))
         .setItemsPerRow(2)
         .setSpacingColumn(220)
         .setSpacingRow(10)
         .addItem("finnish",0)
         .addItem("indonesian",1)
         .addItem("hungarian",2)
         .addItem("estonian",3)
         .addItem("catalan",4)
         ; 
     
         
         
     p5.addRadioButton("radioButton")
         .setPosition(20,20)
         .setSize(50,20)
         .setColorForeground(color(120))
         .setColorActive(color(200,18,24))
         .setColorLabel(color(0))
         .setItemsPerRow(2)
         .setSpacingColumn(200)
         .setSpacingRow(10)
         .addItem("Noise",0)
         .addItem("Music",1)
         .addItem("Audio Cue",2)
         .addItem("Slient",3)
         ;
         
         
   /* p5.addButton("listButton") {
        .setPosition(20,80)
         .setSize(30,20)
         .setColorForeground(color(120))
         .setColorActive(color(200,18,24))
         .setColorLabel(color(0))
  
    }*/
    
       
         

   /* p5.addSlider("Volume")
     .setColorLabel(color(0))
     .setPosition(20,150)
     .setSize(200,20)
     .setRange(0,100)
     .setValue(5)
     ;   */
     
  
  
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
    if (i == 0 ) {
      //noise
      spMusic.pause(true);
      spCue.pause(true);
      wpNoise.start();
      
       
    } else if (i == 1 ) {
      //music
      spCue.pause(true);
      wpNoise.pause(true);
      spMusic.start();
      
    } else if (i == 2) {
      //cue
      wpNoise.pause(true);
      spMusic.pause(true);
      spCue.start();
     
    } else if (i == 3|| i == -1 ) {
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


void languageButton(int i) {
    if (i == 1) {
     
    } else if (i == 2) {
     
    } else if (i == 3) {
     
    } else if (i == 4) {
      
    } 
}



void languageButton() {
}


/*
void Volume(int value) {
  glide.setValue(value);
}*/




void draw(){
  background(1,220,177);
}
         
         
         
         
         
         
         
         
