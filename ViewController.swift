//
//  ViewController.swift
//  Danish
//
//  Created by Krishna Prasad Khanal on 29/11/2017.
//  Copyright © 2017 Krishna Prasad Khanal. All rights reserved.

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet var Label1: UILabel!
    @IBOutlet var Label2: UILabel!
    @IBOutlet var textField: UITextField!
    let synth = AVSpeechSynthesizer()
    var myUtterance = AVSpeechUtterance(string: "")
  
    @IBOutlet var result: UILabel!
    
    @IBOutlet var click: UIView!
    @IBOutlet var Label3: UILabel!
    let alert = "you are wrong"
    let correct = "you are right"
    let enWord = ["1.accept", "2.warn", "3.deliver", "4.finish", "5.reveal", "6.reject", "7.breastfeed", "8.suspect", "9.attack", "10.arrest", "11.accuse", "12.arrive", "13.employ", "14.work", "15.bathe", "15.bake", "16.knock", "17.shave", "18.blame", "19.ask-pray", "20.deceive", "21.free", "22.burry", "23.limit", "24.begin", "25.desire", "26.treat", "27.keep", "28.need", "29.confirm", "30.worry", "31.deny", "32.calculate", "33.soothe", "34.defeat", "35.damage", "36.describe", "37.protect", "38.decide", "39.order", "40.consist", "41.reply", "42.faint", "43.visit", "44.pay", "45.observe", "46.mean", "47.prove", "48.move", "49.bite", "50.tie", "51.mix", "52.fade", "53.flash", "54.stay", "55.blow", "56.live","57.drill", "58.brake", "59.bring", "60.grumble", "61.spend, use", "62.break off", "63.wrestle", "64.break", "65.burn", "66.ought to", "67.offer", "68.build", "69.swap or exchange", "70.carry", "71.bend", "72.brush(hair)", "73.shock", "74.cycle", "75.shape", "76.dance", "77.define", "78.divide", "79.participate", "80.demonstrate", "81.design", "82.discuss", "83.turn", "84.drink", "85.tease","86.drift,float", "87.drown", "88.kill", "89.dream", "90.smell", "91.fail", "92.dive", "93.cover", "94.die", "95.judge", "96.investigate", "97.abandon", "97.own", "98.love", "99.end", "100.admit", "101.replace", "102.fall,decline", "103.settle", "104.catch", "105.color", "106.attach", "107.determine", "108.understand", "109.sweep", "110.fail", "111.find", "112.remove", "113.flow/float","114.escape", "115.move", "116.fly", "117.whistle", "118.feed(animal)", "119.fold", "120.improve", "121.prepare", "122.connect", "123.consume", "124.ban", "125.pretend", "126.unite", "127.prefer", "127.decay", "128.prevent", "129.explain", "130.spoil", "131.leave", "132.extend", "133.minimize", "134.sense", "135.ensure", "136.delay", "137.startle", "138.suggest", "139.sprain", "140.interrupt", "141.strengthen","142.understand", "143.defend", "144.disappear", "145.provide", "146.try/attempt", "147.earn/deserve", "148.regret", "149.continue", "150.tell", "151.expect", "152.confuse", "153.increase", "154.cause", "155.step down", "156.emphasise", "157.encourage", "158.appear", "159.tempt", "160.freeze", "161.complete", "162.fill", "163.fire", "164.feel", "165.follow", "166.get","167.yawn", "168.benefit", "169.hide/store/save", "170.bother/annoy", "171.recognise", "172soak", "173.carry through", "174.go through", "175.see through", "176.rebuild", "177.resume", "178.repeate", "179.feel like", "180.marry", "181.give", "182.forget", "183.slip/slide", "184.please", "185.glow", "186.rub", "187.approve", "188.dig", "189.grab/grip", "190.laugh", "191.cry/weep", "192.swing", "193.be valid", "194.guess", "195.do", "196.go/walk", "197.oppose", "198.hate", "199.hail", "200.chop"]
    let dkWord = ["accepterer","advarer","afleverer","afslutter","afslører","afviser","ammer","aner","angriber","anholder","anklager","ankommer","ansætter","arbejder","bader","bager","banker","barberer","bebrejder","beder","bedrager","befri(e)r","begraver","begrænser","begynder","begærer","behandler","beholder","behøver","bekræfter","bekymrer","benægter","beregner","beroliger","besejrer","beskadiger","beskriver","beskytter","beslutter","bestiller","består","besvarer","besvimer","besøger","betaler","betragter","betyder","beviser","bevæger","bider","binder","blander","blegner","blinker","bliver","blæser","bor","borer","bremser","bringer","brokker sig","bruger","bryder","brydes","brækker","brænder","bør","byder","bygger","bytter","bærer","bøjer","børster","chokerer","cykler","danner","danser","definerer","deler","deltager","demonstrerer","designer","diskuterer","drejer","drikker","driller","driver","drukner","dræber","drømmer","dufter","dumper","dykker","dækker","dør","dømmer","efterforsker","efterlader","ejer","elsker","ender","erkender","erstatter","falder","falder til","fanger","farver","fastgør","fastslår","fatter","fejer","fejler","finder","fjerner","flyder","flygter","flytter","flyver","fløjter","fodrer","folder","forbedrer","forbereder","forbinder","forbruger","forbyder","foregiver","forener","foretrækker","forfalder","forhindrer","forklarer","forkæler","forlader","forlænger","formindsker","fornemmer","forsikrer","forsinker","forskrækker","foreslår","forstuver","forstyrrer","forstærker","forstår","forsvarer","forsvinder","forsyner","forsøger","fortjener","fortryder","fortsætter","fortæller","forventer","forvirrer","forøger","forårsager","fratræder","fremhæver","fremmer","fremstår","frister","fryser","fuldfører","fylder","fyrer","føler","følger","får","gaber","gavner","gemmer","generer","genkender","gennembløder","gennemfører","gennemgår","gennemskuer","genopbygger","genoptager","gentager","gider","gifter sig","giver","glemmer","glider","glæder","gløder","gnider","godkender","graver","griber","griner","græder","gynger","gælder","gætter","gør","går","går imod","hader","hagler","hakker"]
   let dkExample = ["accepterer","advarer","afleverer","afslutter","afslører","afviser","ammer","aner","angriber","anholder","anklager","ankommer","ansætter","arbejder","bader","bager","banker","barberer","bebrejder","beder","bedrager","befri(e)r","begraver","begrænser","begynder","begærer","behandler","beholder","behøver","bekræfter","bekymrer","benægter","beregner","beroliger","besejrer","beskadiger","beskriver","beskytter","beslutter","bestiller","består","besvarer","besvimer","besøger","betaler","betragter","betyder","beviser","bevæger","bider","binder","blander","blegner","blinker","bliver","blæser","bor","borer","bremser","bringer","brokker sig","bruger","bryder","brydes","brækker","brænder","bør","byder","bygger","bytter","bærer","bøjer","børster","chokerer","cykler","danner","danser","definerer","deler","deltager","demonstrerer","designer","diskuterer","drejer","drikker","driller","driver","drukner","dræber","drømmer","dufter","dumper","dykker","dækker","dør","dømmer","efterforsker","efterlader","ejer","elsker","ender","erkender","erstatter","falder","falder til","fanger","farver","fastgør","fastslår","fatter","fejer","fejler","finder","fjerner","flyder","flygter","flytter","flyver","fløjter","fodrer","folder","forbedrer","forbereder","forbinder","forbruger","forbyder","foregiver","forener","foretrækker","forfalder","forhindrer","forklarer","forkæler","forlader","forlænger","formindsker","fornemmer","forsikrer","forsinker","forskrækker","foreslår","forstuver","forstyrrer","forstærker","forstår","forsvarer","forsvinder","forsyner","forsøger","fortjener","fortryder","fortsætter","fortæller","forventer","forvirrer","forøger","forårsager","fratræder","fremhæver","fremmer","fremstår","frister","fryser","fuldfører","fylder","fyrer","føler","følger","får","gaber","gavner","gemmer","generer","genkender","gennembløder","gennemfører","gennemgår","gennemskuer","genopbygger","genoptager","gentager","gider","gifter sig","giver","glemmer","glider","glæder","gløder","gnider","godkender","graver","griber","griner","græder","gynger","gælder","gætter","gør","går","går imod","hader","hagler","hakker"]
    let dkDatil = ["accepterede","advarede","afleverede","afsluttede","afslørede","afviste","ammede","anede","angreb","anholdt","anklagede","ankom","ansatte","arbejdede","badede","bagte","bankede","barberede","bebrejdede","bad","bedrog","befriede","begravede","begrænsede","begyndte","begærede","behandlede","beholdt","behøvede","bekræftede","bekymrede","benægtede","beregnede","beroligede","besejrede","beskadigede","beskrev","beskyttede","besluttede","bestilte","bestod","besvarede","besvimede","besøgte","betalte","betragtede","betød","beviste","bevægede","bed","bandt","blandede","blegnede","blinkede","blev","blæste","boede","borede","bremsede","bragte","brokkede sig","brugte","brød","brødes","brækkede","brændte","burde","bød","byggede","byttede","bar","bøjede","børstede","chokerede","cyklede","dannede","dansede","definerede","delte","deltog","demonstrerede","designede","diskuterede","drejede","drak","drillede","drev","druknede","dræbte","drømte","duftede","dumpede","dykkede","dækkede","døde","dømte","efterforskede","efterlod","ejede","elskede","endte","erkendte","erstattede","faldt","faldt til","fangede","farvede","fastgjorde","fastslog","fattede","fejede","fejlede","fandt","fjernede","flød","flygtede","flyttede","fløj","fløjtede","fodrede","foldede","forbedrede","forberedte","forbandt","forbrugte","forbød","foregav","forenede","foretrak","forfaldt","forhindrede","forklarede","forkælede","forlod","forlængede","formindskede","fornemmede","forsikrede","forsinkede","forskrækkede","foreslog","forstuvede","forstyrrede","forstærkede","forstod","forsvarede","forsvandt","forsynede","forsøgte","fortjente","fortrød","fortsatte","fortalte","forventede","forvirrede","forøgede","forårsagede","fratrådte","fremhævede","fremmede","fremstod","fristede","frøs","fuldførte","fyldte","fyrede","følte","fulgte","fik","gabede/gabte","gavnede","gemte","generede","genkendte","gennemblødte","gennemførte","gennemgik","gennemskuede","genopbyggede","genoptog","gentog","gad","giftede sig","gav","glemte","gled","glædede","glødede","gned","godkendte","gravede","greb","grinede","græd","gyngede","gjaldt","gættede","gjorde","gik","gik imod","hadede","haglede","hakkede"]
    var timesClicked = 0
    override func viewDidLoad() {
        super.viewDidLoad()
    
        Label2.text = enWord[timesClicked]
        
        Label3.text = dkExample[timesClicked]
        Label3.isHidden = true
        result.text = dkDatil[timesClicked]
        result.isHidden = true


    }
    @IBAction func playClicked(_ sender: UIButton) {
       
            myUtterance = AVSpeechUtterance(string: dkWord[timesClicked-1])
            myUtterance.voice = AVSpeechSynthesisVoice(language: "da-DK")
            myUtterance.rate = 0.3
            synth.speak(myUtterance)
        }
    
    
    @IBAction func pastClicked(_ sender: Any) {
       
        result.textColor = UIColor.blue
        result.isHidden = false
        
    }
    @IBAction func hideClicked(_ sender: Any) {
        Label3.isHidden = true
        result.isHidden = true
        
    }
    @IBAction func helpClicked(_ sender: Any) {
    Label3.isHidden = false
        
    
    }
    @IBAction func Clicked(_ sender: UIButton) {
   let numberNotInArray = timesClicked + 1
        
        if numberNotInArray > enWord.count {
            timesClicked = 0
            
        }
        else {
            textField.text = ""
            Label2.text = enWord[timesClicked]
            Label3.text = dkExample[timesClicked]
            result.text = dkDatil[timesClicked]
            timesClicked = timesClicked + 1

           
            
            
        }
        
    }
    
    
    
    
    
    
    
    
    
  


}
