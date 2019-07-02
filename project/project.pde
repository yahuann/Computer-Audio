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
        // CATALAN, INDONESIAN, FINNISH,  HUNGARIAN, ESTONIAN,


        public Foreign(String name, int numOfSyllable) {
            this.name = name;
            this.numOfSyllable = numOfSyllable;
        }

        public Foreign(String name){
            this(name, 1);
        }

        Foreign catalan1 = new Foreign("afecte");
        Foreign catalan2 = new Foreign("ira");
        Foreign catalan3 = new Foreign("amor");
        Foreign catalan4 = new Foreign("ensurt");
        Foreign catalan5 = new Foreign("senglar");
        Foreign catalan6 = new Foreign("pollastre");
        Foreign catalan7 = new Foreign("gos");
        Foreign catalan8 = new Foreign("atac");
        Foreign catalan9 = new Foreign("explosio");
        Foreign catalan10 = new Foreign("lluita");
        Foreign catalan11 = new Foreign("tir");
        Foreign catalan12 = new Foreign("calenta");
        Foreign catalan13 = new Foreign("fred");
        Foreign catalan14 = new Foreign("fort");
        Foreign catalan15 = new Foreign("por");
        Foreign catalan16 = new Foreign("impressionant");


        Foreign indonesian1 = new Foreign("sukacita");
        Foreign indonesian2 = new Foreign("kemarahan");
        Foreign indonesian3 = new Foreign("cinta");
        Foreign indonesian4 = new Foreign("kepanikan");
        Foreign indonesian5 = new Foreign("babi hutan");
        Foreign indonesian6 = new Foreign("ayam");
        Foreign indonesian7 = new Foreign("anjiny");
        Foreign indonesian8 = new Foreign("serangan");
        Foreign indonesian9 = new Foreign("ledakan");
        Foreign indonesian10 = new Foreign("pertarungan");
        Foreign indonesian11 = new Foreign("tembakan");
        Foreign indonesian12 = new Foreign("panas");
        Foreign indonesian13 = new Foreign("dingin");
        Foreign indonesian14 = new Foreign("keras");
        Foreign indonesian15 = new Foreign("mengerikan");
        Foreign indonesian16 = new Foreign("luar biasa");


        Foreign finnish1 = new Foreign("kiintymys");
        Foreign finnish2 = new Foreign("viha");
        Foreign finnish3 = new Foreign("rakkaus");
        Foreign finnish4 = new Foreign("sokki");
        Foreign finnish5 = new Foreign("rillisika");
        Foreign finnish6 = new Foreign("kana");
        Foreign finnish7 = new Foreign("koira");
        Foreign finnish8 = new Foreign("hyokkays");
        Foreign finnish9 = new Foreign("rajahdys");
        Foreign finnish10 = new Foreign("kamppailu");
        Foreign finnish11 = new Foreign("laukaus");
        Foreign finnish12 = new Foreign("kuuma");
        Foreign finnish13 = new Foreign("kylma");
        Foreign finnish14 = new Foreign("aanekos");
        Foreign finnish15 = new Foreign("pelottava");
        Foreign finnish16 = new Foreign("mahtara");
        

        Foreign hungarian1 = new Foreign("vanzalan");
        Foreign hungarian2 = new Foreign("harag");
        Foreign hungarian3 = new Foreign("szerelem");
        Foreign hungarian4 = new Foreign("ijedtseg");
        Foreign hungarian5 = new Foreign("vaddiszno");
        Foreign hungarian6 = new Foreign("tyuk");
        Foreign hungarian7 = new Foreign("kutya");
        Foreign hungarian8 = new Foreign("tamadas");
        Foreign hungarian9 = new Foreign("robbanas");
        Foreign hungarian10 = new Foreign("kuzdelem");
        Foreign hungarian11 = new Foreign("loves");
        Foreign hungarian12 = new Foreign("forro");
        Foreign hungarian13 = new Foreign("hideg");
        Foreign hungarian14 = new Foreign("hangos");
        Foreign hungarian15 = new Foreign("ijedos");
        Foreign hungarian16 = new Foreign("fnatasztikus");



        Foreign estonian1 = new Foreign("kiindumus");
        Foreign estonian2 = new Foreign("raev");
        Foreign estonian3 = new Foreign("armastus");
        Foreign estonian4 = new Foreign("ehmatus");
        Foreign estonian5 = new Foreign("metssiga");
        Foreign estonian6 = new Foreign("tibu");
        Foreign estonian7 = new Foreign("koer");
        Foreign estonian8 = new Foreign("runnak");
        Foreign estonian9 = new Foreign("plahvatus");
        Foreign estonian10 = new Foreign("voitlus");
        Foreign estonian11 = new Foreign("lask");
        Foreign estonian12 = new Foreign("karsta");
        Foreign estonian13 = new Foreign("salta");
        Foreign estonian14 = new Foreign("garsiai");
        Foreign estonian15 = new Foreign("baugus");
        Foreign estonian16 = new Foreign("nuostabu");


        final Foreign [] FINNISH = {finnish1,finnish2,finnish3,finnish4,
                finnish5,finnish6,finnish7,finnish8,finnish9,finnish10,
                finnish11,finnish12,finnish13,finnish14,finnish15,finnish16};

        final Foreign [] INDONESIAN = {indonesian1,indonesian2,indonesian3,indonesian4,
                indonesian5,indonesian6,indonesian7,indonesian8,indonesian9,indonesian10,
                indonesian11,indonesian12,indonesian13,indonesian14,indonesian15,indonesian16};

        final Foreign [] HUNGARIAN = {hungarian1,hungarian2,hungarian3,hungarian4,
                hungarian5,hungarian6,hungarian7,hungarian8,hungarian9,hungarian10,
                hungarian11,hungarian12,hungarian13,hungarian14,hungarian15,hungarian16};

        final Foreign [] ESTONIAN = {estonian1,estonian2,estonian3,estonian4,estonian4,
                estonian5,estonian6,estonian7,estonian8,estonian9,estonian10,
                estonian11,estonian12,estonian13,estonian14,estonian15,estonian16};

        final Foreign [] CATALAN = {catalan1,catalan2,catalan3,catalan4,
                catalan5, catalan6,catalan7,catalan8,catalan9,catalan10,
                catalan11,catalan12, catalan13,catalan14,catalan15,catalan16};

    }



/*
void Volume(int value) {
  glide.setValue(value);
}*/




void draw(){
  background(1,220,177);
}
         
         
         
         
         
         
         
         
