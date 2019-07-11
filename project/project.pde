import controlP5.*;
import beads.*;
import org.jaudiolibs.beads.*;

ControlP5 p5;
Gain gain;
Glide glide;
RadioButton radioButton;
RadioButton wordButton;
RadioButton listButton;
RadioButton languageButton;
SamplePlayer spNoise;
SamplePlayer spPronunciation;
SamplePlayer spCue;
ControlFont font;
Word word;
Foreign foreign;
PFont p;
int wordNum = -1;
int languageNum = -1;
int backgroundNum = -1;
 final Word[] WORDS = new Word[16];
 final Foreign [] FINNISH = new Foreign[16];
 final Foreign [] INDONESIAN = new Foreign[16];
 final Foreign [] HUNGARIAN = new Foreign[16];
 final Foreign [] ESTONIAN = new Foreign[16];
 final Foreign [] CATALAN = new Foreign[16];




void setup() {
  size(500,670);
  ac = new AudioContext();
  p5 = new ControlP5(this);
   //PFont
   p = createFont("Verdana",20); 
   //ControlFont
   font = new ControlFont(p);
   p5.setFont(font);
   buildWords();
   buildForeign();
   
    glide = new Glide(ac,10,1);
    gain = new Gain(ac,1,glide);

   p5.addRadioButton("wordButton")
         .setPosition(20,290)
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
         .addItem("Word13",12)
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
         .addItem("Pronunciation",1)
         .addItem("Audio Cue",2)
         .addItem("Slient",3)
         ;
         
         
  /*  p5.addRadioButton("listButton") 
        .setPosition(20,540)
         .setSize(10,10)
         .setColorForeground(color(120))
         .setColorActive(color(200,18,24))
         .setColorLabel(color(0))
         .setItemsPerRow(1)
         .setSpacingColumn(100)
         .setSpacingRow(10)
         .addItem("L1Fin",0)
         .addItem("L2Indo",1)
         .addItem("L3Hun",2)
         .addItem("L4Eston",3)
         .addItem("L5Cat",4)
         ;
  */
    
    
       
         

    p5.addSlider("Volume")
     .setColorLabel(color(0))
     .setPosition(20,230)
     .setSize(200,20)
     .setRange(0,100)
     .setValue(5)
     ;   
     
  
  
    spNoise = getSamplePlayer("noise.wav");
    spPronunciation = getSamplePlayer("aspaceholder.wav");
    spCue = getSamplePlayer("aspaceholder.wav");
    spNoise.setLoopType(SamplePlayer.LoopType.LOOP_FORWARDS);
    spPronunciation.setLoopType(SamplePlayer.LoopType.LOOP_FORWARDS);
    spCue.setLoopType(SamplePlayer.LoopType.LOOP_FORWARDS);
    
    gain.addInput(spNoise);
    gain.addInput(spPronunciation);
    gain.addInput(spCue);
    
    ac.out.addInput(gain);
    spNoise.pause(true);
    spCue.pause(true);
    spPronunciation.pause(true);
    
    ac.start();
}     


void radioButton(int i) {
  backgroundNum = i; 
  gain.clearInputConnections();
  if (i == 0 ) {
      //noise
      spNoise = getSamplePlayer("noise.wav");
      spNoise.setLoopType(SamplePlayer.LoopType.LOOP_FORWARDS);
      gain.addInput(spNoise);
    
      spNoise.start();
      
       
    } else if (i == 1 ) {
      //pronunciation
       
      
       if (word != null && foreign != null) {
          String s = foreign.name + ".mp3";
          spPronunciation = getSamplePlayer(s);
          gain.addInput(spPronunciation);
          
          spPronunciation.start();
       } else if (word != null && foreign == null) {
         
          String s = word.name + ".mp3";
          spPronunciation = getSamplePlayer(s);
          gain.addInput(spPronunciation);
         
          spPronunciation.start();
       } else {
         
          spPronunciation.pause(true);
       }
      
      
    } else if (i == 2) {
      //cue
      //gain.addInput();
      //spNoise.pause(true);
      //spPronunciation.pause(true);
      //spCue.start();
      
      
      if (word != null && foreign != null) {
          String s = foreign.name + "-mod.mp3";
          spCue = getSamplePlayer(s);
          gain.addInput(spCue);
          spCue.start();
       } else if (word != null && foreign == null) {
         
          String s = word.name + "-mod.mp3";
          spCue = getSamplePlayer(s);
          gain.addInput(spCue);
          spCue.start();
       } else {
          spCue.pause(true);
       }
     
    } else if (i == 3|| i == -1 ) {
       //silent
      spCue.pause(true);
    }
   stateSwitch();
}




void wordButton(int i) {
  wordNum = i;  
  if(i == -1) {
      word = null;
    } else {
      word = WORDS[i];
        if (languageNum == 0) {
          foreign = FINNISH[wordNum]; 
         
        } else if ( languageNum == 1) {
         foreign = INDONESIAN[wordNum]; 
        } else if (languageNum == 2) {
         foreign = HUNGARIAN[wordNum]; 
        } else if (languageNum == 3) {
          foreign = ESTONIAN[wordNum]; 
        } else if (languageNum == 4) {
          foreign = CATALAN [wordNum]; 
        } 
        if(i == -1) {
          foreign = null;
        }
    }
    
   stateSwitch();
}


void languageButton(int i) {
    languageNum = i ;
    if (wordNum != -1) { 
        if (i == 0) {
          foreign = FINNISH[wordNum]; 
         
        } else if (i == 1) {
         foreign = INDONESIAN[wordNum]; 
        } else if (i == 2) {
         foreign = HUNGARIAN[wordNum]; 
        } else if (i == 3) {
          foreign = ESTONIAN[wordNum]; 
        } else if (i == 4) {
          foreign = CATALAN [wordNum]; 
        } 
        if(i == -1) {
          foreign = null;
        }
    }
     stateSwitch();
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
enum Emotion{POSITIVE, NEGATIVE, NEUTRAL;}

public void buildWords() {
    
    Word word1 = new Word("affection", PartOfSpeech.NOUN);
    Word word2 = new Word("anger", PartOfSpeech.NOUN);
    Word word3 = new Word("love", PartOfSpeech.NOUN);
    Word word4 = new Word("shock", PartOfSpeech.NOUN);
    Word word5 = new Word("boar", PartOfSpeech.NOUN);
    Word word6 = new Word("chicken", PartOfSpeech.NOUN);
    Word word7 = new Word("dog", PartOfSpeech.NOUN);

    Word word8 = new Word("attack", PartOfSpeech.VERB);
    Word word9 = new Word("blast", PartOfSpeech.VERB);
    Word word10 = new Word("beat", PartOfSpeech.VERB);
    Word word11 = new Word("shot", PartOfSpeech.VERB);

    Word word12 = new Word("hot", PartOfSpeech.ADJECTIVE);
    Word word13 = new Word("cold", PartOfSpeech.ADJECTIVE);
    Word word14 = new Word("loud", PartOfSpeech.ADJECTIVE);
    Word word15 = new Word("scary", PartOfSpeech.ADJECTIVE);
    Word word16 = new Word("excellent", PartOfSpeech.ADJECTIVE);

    WORDS[0] = word1;
   WORDS[1] = word2;
    WORDS[2] = word3;
   WORDS[3] = word4;
   WORDS[4] = word5;
   WORDS[5] = word6;
    WORDS[6] = word7;
    WORDS[7] = word8;
    WORDS[8] = word9;
    WORDS[9] = word10;
    WORDS[10] = word11;
   WORDS[11] = word12;
    WORDS[12] = word13;
    WORDS[13] = word14;
    WORDS[14] = word15;
    WORDS[15] = word16;

}
    
    
class Foreign {
        public String name;
        public int numOfSyllable;
        // CATALAN, INDONESIAN, FINNISH,  HUNGARIAN, ESTONIAN,


        public Foreign(String name, int numOfSyllable) {
            this.name = name;
            this.numOfSyllable = numOfSyllable;
        }

        public Foreign(String name){
            this(name, 1);
        }

       

      /* final  Foreign [] FINNISH = {finnish1,finnish2,finnish3,finnish4,
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
                catalan11,catalan12, catalan13,catalan14,catalan15,catalan16};*/
                
     

}
    

void buildForeign() {
       Foreign catalan1 = new Foreign("afecte");
        Foreign catalan2 = new Foreign("ira");
        Foreign catalan3 = new Foreign("amor");
        Foreign catalan4 = new Foreign("insurt");
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
        Foreign catalan16 = new Foreign("impressionnant");


        Foreign indonesian1 = new Foreign("sukacita");
        Foreign indonesian2 = new Foreign("kemarahan");
        Foreign indonesian3 = new Foreign("cinta");
        Foreign indonesian4 = new Foreign("kepanikan");
        Foreign indonesian5 = new Foreign("babihutan");
        Foreign indonesian6 = new Foreign("ayam");
        Foreign indonesian7 = new Foreign("anjing");
        Foreign indonesian8 = new Foreign("serangan");
        Foreign indonesian9 = new Foreign("ledakan");
        Foreign indonesian10 = new Foreign("pertarungan");
        Foreign indonesian11 = new Foreign("tembakan");
        Foreign indonesian12 = new Foreign("panas");
        Foreign indonesian13 = new Foreign("dingin");
        Foreign indonesian14 = new Foreign("keras");
        Foreign indonesian15 = new Foreign("mengerikan");
        Foreign indonesian16 = new Foreign("luarbiasa");


        Foreign finnish1 = new Foreign("kiintymys");
        Foreign finnish2 = new Foreign("viha");
        Foreign finnish3 = new Foreign("rakkaus");
        Foreign finnish4 = new Foreign("sokki");
        Foreign finnish5 = new Foreign("villisika");
        Foreign finnish6 = new Foreign("kana");
        Foreign finnish7 = new Foreign("koira");
        Foreign finnish8 = new Foreign("hyokkays");
        Foreign finnish9 = new Foreign("rajahdys");
        Foreign finnish10 = new Foreign("kamppailu");
        Foreign finnish11 = new Foreign("laukaus");
        Foreign finnish12 = new Foreign("kuuma");
        Foreign finnish13 = new Foreign("kulma");
        Foreign finnish14 = new Foreign("aanekas");
        Foreign finnish15 = new Foreign("pelorrava");
        Foreign finnish16 = new Foreign("mahtava");
        

        Foreign hungarian1 = new Foreign("vanzalom");
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
        Foreign hungarian12 = new Foreign("hoseg");
        Foreign hungarian13 = new Foreign("hideg");
        Foreign hungarian14 = new Foreign("hangos");
        Foreign hungarian15 = new Foreign("ijedos");
        Foreign hungarian16 = new Foreign("fantasztikus");



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
        Foreign estonian12 = new Foreign("kuum");
        Foreign estonian13 = new Foreign("kulm");
        Foreign estonian14 = new Foreign("valjusti");
        Foreign estonian15 = new Foreign("hirmutav");
        Foreign estonian16 = new Foreign("suureparane");
        
        FINNISH[0] = finnish1;
        FINNISH[1] = finnish2;
        FINNISH[2] = finnish3;
        FINNISH[3] = finnish4;
        FINNISH[4] = finnish5;
        FINNISH[5] = finnish6;
        FINNISH[6] = finnish7;
        FINNISH[7] = finnish8;
        FINNISH[8] = finnish9;
        FINNISH[9] = finnish10;
        FINNISH[10] = finnish11;
        FINNISH[11] = finnish12;
        FINNISH[12] = finnish13;
        FINNISH[13] = finnish14;
        FINNISH[14] = finnish15;
        FINNISH[15] = finnish16;
        
        
        INDONESIAN[0] = indonesian1;
        INDONESIAN[1] = indonesian2;
        INDONESIAN[2] = indonesian3;
        INDONESIAN[3] = indonesian4;
        INDONESIAN[4] = indonesian5;
        INDONESIAN[5] = indonesian6;
        INDONESIAN[6] = indonesian7;
        INDONESIAN[7] = indonesian8;
        INDONESIAN[8] = indonesian9;
        INDONESIAN[9] = indonesian10;
        INDONESIAN[10] = indonesian11;
        INDONESIAN[11] = indonesian12;
        INDONESIAN[12] = indonesian13;
        INDONESIAN[13] = indonesian14;
        INDONESIAN[14] = indonesian15;
        INDONESIAN[15] = indonesian16;
        
        
        HUNGARIAN[0] = hungarian1;
        HUNGARIAN[1] = hungarian2;
        HUNGARIAN[2] = hungarian3;
        HUNGARIAN[3] = hungarian4;
        HUNGARIAN[4] = hungarian5;
        HUNGARIAN[5] = hungarian6;
        HUNGARIAN[6] = hungarian7;
        HUNGARIAN[7] = hungarian8;
        HUNGARIAN[8] = hungarian9;
        HUNGARIAN[9] = hungarian10;
        HUNGARIAN[10] = hungarian11;
        HUNGARIAN[11] = hungarian12;
        HUNGARIAN[12] = hungarian13;
        HUNGARIAN[13] = hungarian14;
        HUNGARIAN[14] = hungarian15;
        HUNGARIAN[15] = hungarian16;
        
        ESTONIAN[0] = estonian1;
        ESTONIAN[1] = estonian2;
        ESTONIAN[2] = estonian3;
        ESTONIAN[3] = estonian4;
        ESTONIAN[4] = estonian5;
        ESTONIAN[5] = estonian6;
        ESTONIAN[6] = estonian7;
        ESTONIAN[7] = estonian8;
        ESTONIAN[8] = estonian9;
        ESTONIAN[9] = estonian10;
        ESTONIAN[10] = estonian11;
        ESTONIAN[11] = estonian12;
        ESTONIAN[12] = estonian13;
        ESTONIAN[13] = estonian14;
        ESTONIAN[14] = estonian15;
        ESTONIAN[15] = estonian16;
        
        
        CATALAN[0] = catalan1;
        CATALAN[1] = catalan2;
        CATALAN[2] = catalan3;
        CATALAN[3] = catalan4;
        CATALAN[4] = catalan5;
        CATALAN[5] = catalan6;
        CATALAN[6] = catalan7;
        CATALAN[7] = catalan8;
        CATALAN[8] = catalan9;
        CATALAN[9] = catalan10;
        CATALAN[10] = catalan11;
        CATALAN[11] = catalan12;
        CATALAN[12] = catalan13;
        CATALAN[13] = catalan14;
        CATALAN[14] = catalan15;
        CATALAN[15] = catalan16;
  
    
}




void Volume(int value) {
  glide.setValue(value);
}



void stateSwitch(){
  gain.clearInputConnections();
  if (backgroundNum == 0 ) {
      //noise
      spPronunciation.pause(true);
      spCue.pause(true);
      spNoise = getSamplePlayer("noise.wav");
      spNoise.setLoopType(SamplePlayer.LoopType.LOOP_FORWARDS);
      gain.addInput(spNoise);
      spNoise.start();
      
       
    } else if (backgroundNum == 1 ) {
      //pronunciation
       
      
       if (word != null && foreign != null) {
          String s = foreign.name + ".mp3";
          print(s);
          spPronunciation = getSamplePlayer(s);
        //  spPronunciation.setLoopType(SamplePlayer.LoopType.LOOP_FORWARDS);
          gain.addInput(spPronunciation);
          spCue.pause(true);
          spNoise.pause(true);
          spPronunciation.start();
           
       } else if (word != null && foreign == null) {
         
          String s = word.name + ".mp3";
          spPronunciation = getSamplePlayer(s);
         // spPronunciation.setLoopType(SamplePlayer.LoopType.LOOP_FORWARDS);
          gain.addInput(spPronunciation);
          spCue.pause(true);
          spNoise.pause(true);
          spPronunciation.start();
       } else {
          spCue.pause(true);
          spNoise.pause(true);
          spPronunciation.pause(true);
       }
      
      
    } else if (backgroundNum == 2) {
      //cue
         if (word != null && foreign != null) {
           
         
              String s = foreign.name + "-mod.mp3";
                print(s);
              spCue = getSamplePlayer(s);
             
             // spCue.setLoopType(SamplePlayer.LoopType.LOOP_FORWARDS);
              gain.addInput(spCue);
              spCue.start();
           } else if (word != null && foreign == null) {
             
              String s = word.name + "-mod.mp3";
              spCue = getSamplePlayer(s);
             // spCue.setLoopType(SamplePlayer.LoopType.LOOP_FORWARDS);
              gain.addInput(spCue);
              spCue.start();
           } else {
              spCue.pause(true);
           }
     
    } else if (backgroundNum == 3|| backgroundNum == -1 ) {
       //silent
      spCue.pause(true);
      spNoise.pause(true);
      spPronunciation.pause(true);
    }
  
}

void listButton(int i) {
    languageButton(i);
  if(i == 0) {
  //finnish
  
          
  } else if (i == 1) {
  //indoesian
      
  } else if (i == 2) {
  //hungurian
        

              
  } else if (i == 3) {
  //estonian
  
  }else if (i == 4) {
  //cat
      

  }
}
  



void draw(){
  background(1,220,177);
 
  fill(0);
  textSize(20);
  text("English ",20, 440);
  text("Foreign Meaning",300,440);
 
  if(word != null) {
    text(word.name,40,480);
    if (foreign != null) {
      text(foreign.name, 320,480);
    
    }
  } 
}
         
         
         
         
         
         
         
         
