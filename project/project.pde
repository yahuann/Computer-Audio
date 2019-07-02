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
    spMusic = getSamplePlayer("Mozart-Lacrimosa.wav");
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



public class Word {
    String name;
    PartOfSpeech pos;
    Emotion emo;
   
    public Word(String name, PartOfSpeech pos, Emotion emo) {
        this. name = name;
        this.pos = pos;
        this.emo = emo;
    }
    public Word(String name, PartOfSpeech pos) {
        this(name, pos, Emotion.NEGATIVE);
    }
}


enum PartOfSpeech {ADJECTIVE, NOUN, VERB;}
//enum Language{FINNISH, INDONESIAN, HUNGARIAN, ESTONIAN, CATALAN;}
enum Emotion{POSITIVE, NEGATIVE, NEUTRAL;}

public void buildWords() {
    Word[] words = new Word[16];

    Word word1 = new Word("affection", PartOfSpeech.NOUN);
    Word word2 = new Word("anger", PartOfSpeech.NOUN);
    Word word3 = new Word("love", PartOfSpeech.NOUN);
    Word word4 = new Word("shook", PartOfSpeech.NOUN);
    Word word5 = new Word("boar", PartOfSpeech.NOUN);
    Word word6 = new Word("chicken", PartOfSpeech.NOUN);
    Word word7 = new Word("dog", PartOfSpeech.NOUN);

    Word word8 = new Word("attack", PartOfSpeech.VERB);
    Word word9 = new Word("blast", PartOfSpeech.VERB);
    Word word10 = new Word("fight", PartOfSpeech.VERB);
    Word word11 = new Word("shot", PartOfSpeech.VERB);

    Word word12 = new Word("hot", PartOfSpeech.ADJECTIVE);
    Word word13 = new Word("cold", PartOfSpeech.ADJECTIVE);
    Word word14 = new Word("loud", PartOfSpeech.ADJECTIVE);
    Word word15 = new Word("scary", PartOfSpeech.ADJECTIVE);
    Word word16 = new Word("excellent", PartOfSpeech.ADJECTIVE);

    words[0] = word1;
    words[1] = word2;
    words[2] = word3;
    words[3] = word4;
    words[4] = word5;
    words[5] = word6;
    words[6] = word7;
    words[7] = word8;
    words[8] = word9;
    words[9] = word10;
    words[10] = word11;
    words[11] = word12;
    words[12] = word13;
    words[13] = word14;
    words[14] = word15;
    words[15] = word16;

    }
    
    
    class Foreign{
        String name;
        int numOfSyllable;
        // FINNISH, INDONESIAN, HUNGARIAN, ESTONIAN, CATALAN;
        final Foreign [] FINNISH = new Foreign[16];
        final Foreign [] INDONESIAN = new Foreign[16];
        final Foreign [] HUGARIAN = new Foreign[16];
        final Foreign [] ESTONIAN = new Foreign[16];
        final Foreign [] CATALAN = new Foreign[16];

        public Foreign(String name, int numOfSyllable) {
            this.name = name;
            this.numOfSyllable = numOfSyllable;
        }

        public Foreign(String name){
            this(name, 1);
        }





    }



/*
void Volume(int value) {
  glide.setValue(value);
}*/




void draw(){
  background(1,220,177);
}
         
         
         
         
         
         
         
         
