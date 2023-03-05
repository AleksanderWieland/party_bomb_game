import 'const.dart';

List<String> kLang = kLangPL;
List<String> kLangPL = [
  //settings
  'Wybierz język:',
  'Ustaw minimalny i maksymalny czas [sekundy]:',
  'Wartość domyślna',
  'Ustaw ilość graczy:',
  'Zapisz',
  //info_page
  'BOMBA\ngra imprezowa',
  '\nWstęp\n',
  'Gra polega na wymyślaniu słów zawierających w sobie cząstkę wyświetloną na ekranie.\n',
  '\nJak grać?\n',
  'Na początku należy wybrać odpowiednią liczbę graczy. Można to zrobić w zakładce "Ustawienia", do której można wejść klikając przycisk w prawym górnym rogu na głównej stronie aplikacji. Kółka na dole głównego ekranu reprezentują graczy. Każdy z uczestników zabawy powinien wybrać sobie swój kolor. Następnie należy wyznaczyć gracza, który będzie zaczynał. Można przyjąć, że grę rozpoczyna najstarszy gracz.\n\nRundę zaczynamy wciskając duży przycisk z ikona bomby. Po wciśnięciu bomby następuje losowanie cząstki wyrazu oraz tego, w którym miejscu słowa dana cząstka może się znajdować. W zależności od losowania wyświetlana cząstka:\n- nie może pojawić się na początku wyrazu,\n- nie może znaleźć się na końcu wyrazu,\n- może znaleźć się w każdym miejscu wyrazu.\n\nPo naciśnięciu przycisku rozpoczyna się odliczanie czasu do losowej liczby z przedziału. Domyślny przedział wynosi od ${kDefaultMinSeconds.toStringAsFixed(0)} sekund do ${kDefaultMaxSeconds.toStringAsFixed(0)} sekund. Przedział może zostać zmieniony w ustawieniach, ale zaleca się zostawienie domyślnego.\n\nRozpoczynający gracz jako pierwszy musi wymyśleć słowo. Po wypowiedzeniu hasła powinien on wskazać na kolejnego (idąc zgodnie z ruchem wskazówek zegara) gracza lub podać mu jakiś wybrany przez Waszą grupę przedmiot, który byłby odpowiednikiem plastikowej, tykającej bomby z oryginalnej wersji gry.\n\nJeśli dany gracz nie zdoła wypowiedzieć słowa przed wybuchem bomby, to otrzymuje punkt. Punty można dodawać w dolnej części głównej strony aplikacji. Punkt dodaje się poprzez kliknięcie odpowiedniego koloru kółka. Jeśli podczas dodawania punktów popełniliśmy błąd, to możemy go cofnąć poprzez przytrzymanie palca na danym kółku. Gracz z najmniejszą ilością punktów wygrywa.\n\nUwaga! Każde słowo powinno być rzeczownikiem w formie mianownika.\n\n',
  'Dźwięki\n',
  'Dźwięki pochodzą z Pixabay:\n',
  '- Tykanie (link)',
  '- Wybuch (link)\n\n',
  'Ikony\n',
  'Ikony pochodzą z Font Awesome Icons.\n\n',
  'Autor\n',
  'Aleksander Wieland\n\n',
  '',
  '',
  //bomb_page (random_text.dart)
  'Nie na początku',
  'Może być wszędzie',
  'Nie na końcu',
  'Runda',
];

List<String> kLangEN = <String>[
  //settings
  'Choose language:',
  'Set min. and max. timer values [seconds]:',
  'Default value',
  'Set the number of players: ',
  'Save',
  //info_page
  'BOOM\nParty Word Game',
  '\nIntroduction\n',
  'The game is about coming up with words containing a particle displayed on the screen.\n',
  '\nHow to play?\n',
  "Firstly, you need to select the appropriate number of players. This can be done in the 'Settings' tab, which can be accessed by clicking the button in the upper right corner of the main page of the app. The circles at the bottom of the main screen represent the players. Each player should choose their own color. The player who will start should then be designated. It can be assumed that the game is started by the oldest player.\n\nThe round starts by pressing the big button with the bomb icon on it. After pressing the bomb, the word particle is drawn. The place, where the particle can be located will be displayed. Possible options are:\n- mustn't appear at the beginning of the word,\n- mustn't be at the end of the word,\n- can be anywhere in the word.\n\nAfter pressing the button, the countdown to a random number begins. The default interval is from ${kDefaultMinSeconds.toStringAsFixed(0)} seconds to ${kDefaultMaxSeconds.toStringAsFixed(0)} seconds. The interval can be changed in the settings, but it is recommended to leave the default setting.\n\nThe starting player must be the first to think of a word. After saying the word, he or she should point to the next (going clockwise) player or give him or her some object of your group's choice, which would be the equivalent of the plastic ticking bomb from the classic version of the game.\n\nIf the player in question does not manage to say the word before the bomb explodes, he or she gets a point. Points can be added at the bottom of the app's main page. A point is added by clicking on the circle in the color of the player. If you make a mistake while adding points, you can undo it by holding your finger on the circle in question. The player with the fewest points wins.\n\nNote: Each word should be a noun in the nominative form.\n\n",
  'Sound assets\n',
  'Sounds downloaded from Pixabay:\n',
  '- Ticking (link)',
  '- Explosion (link)\n\n',
  'Icons\n',
  'Icons from Font Awesome Icons.\n\n',
  'Author\n',
  'Aleksander Wieland\n\n',
  '',
  '',
  //bomb_page (random_text.dart)
  'Not at the beginning',
  'Can be anywhere',
  'Not at the end',
  'Round',
];

List<String> kLangGE = <String>[
  //Einstellungen
  'Sprache wählen:',
  'Minimale und Maximale Timerwerte [Sekunden] einstellen:',
  'Standardwert',
  'Anzahl der Spieler festlegen: ',
  'Speichern',
  //info_seite
  'BOOM\nParty-Wortspiel',
  '\nEinführung\n',
  'Bei diesem Spiel geht es darum, Wörter zu finden, die ein auf dem Bildschirm angezeigtes Teilchen enthalten.\n',
  '\nWie wird gespielt?\n',
  "Zunächst müssen Sie die entsprechende Anzahl von Spielern auswählen. Dies kann auf der Registerkarte 'Einstellungen' erfolgen, die durch Klicken auf die Schaltfläche in der oberen rechten Ecke der Hauptseite der App aufgerufen werden kann. Die Kreise am unteren Rand des Hauptbildschirms stellen die Spieler dar. Jeder Spieler sollte seine eigene Farbe wählen. Anschließend sollte der Spieler bestimmt werden, der beginnen soll. Es ist davon auszugehen, dass der älteste Spieler das Spiel beginnt.\n\nDie Runde beginnt, indem man den großen Knopf mit dem Bombensymbol darauf drückt. Nachdem die Bombe gedrückt wurde, wird das Wortteilchen gezogen. Der Ort, an dem sich das Teilchen befinden kann, wird angezeigt. Mögliche Optionen sind:\n- darf nicht am Anfang des Wortes stehen,\n- darf nicht am Ende des Wortes stehen,\n- kann an beliebiger Stelle im Wort stehen.\n\nNach dem Drücken des Knopfes beginnt der Countdown für eine Zufallszahl. Das Standardintervall liegt zwischen ${kDefaultMinSeconds.toStringAsFixed(0)} Sekunden und ${kDefaultMaxSeconds.toStringAsFixed(0)} Sekunden. Das Intervall kann in den Einstellungen geändert werden, es wird jedoch empfohlen, die Standardeinstellung beizubehalten.\n\nDer Startspieler muss der erste sein, dem ein Wort einfällt. Nachdem er das Wort gesagt hat, sollte er auf den nächsten Spieler (im Uhrzeigersinn) zeigen oder ihm einen Gegenstand Ihrer Wahl geben, der der tickenden Plastikbombe aus der klassischen Version des Spiels entspricht.\n\nWenn der betreffende Spieler es nicht schafft, das Wort zu sagen, bevor die Bombe explodiert, erhält er einen Punkt. Die Punkte können unten auf der Hauptseite der App hinzugefügt werden. Ein Punkt wird hinzugefügt, indem man auf den Kreis in der Farbe des Spielers klickt. Wenn du beim Hinzufügen von Punkten einen Fehler machst, kannst du ihn rückgängig machen, indem du deinen Finger auf den betreffenden Kreis hältst. Der Spieler mit den wenigsten Punkten gewinnt.\n\nHinweis: Jedes Wort sollte ein Substantiv im Nominativ sein.\n\n",
  'Sound assets\n',
  'Von Pixabay heruntergeladene Sounds:\n',
  '- Ticken (Link)',
  '- Explosion (Link)\n\n',
  'Icons\n',
  'Icons von Font Awesome Icons.\n\n',
  'Author\n',
  'Aleksander Wieland\n\n',
  '',
  '',
//bomb_page (random_text.dart)
  'Nicht am Anfang',
  'Kann überall sein',
  'Nicht am Ende',
  'Runde',
];

List<String> kLangSE = <String>[
//inställningar
  'Välj språk:',
  'Ställ in min. och max. timervärden [sekunder]:',
  'Standardvärde',
  'Ställ in antalet spelare: ',
  'Spara',
//info_page
  'BOOM\nParty Ordspel',
  "\nIntroduktion\n",
  'Spelet går ut på att hitta på ord som innehåller en partikel som visas på skärmen.\n',
  "\nHur man spelar?\n",
  "För det första måste du välja lämpligt antal spelare. Detta kan du göra under fliken 'Inställningar', som du når genom att klicka på knappen i det övre högra hörnet på appens huvudsida. Cirklarna längst ner på huvudskärmen representerar spelarna. Varje spelare ska välja sin egen färg. Därefter ska den spelare som ska börja utses. Det kan antas att spelet startas av den äldsta spelaren.\nRundan startar genom att man trycker på den stora knappen med bombikonen på. Efter att ha tryckt på bomben dras ordet partikel. Platsen, där partikeln kan placeras, visas. Möjliga alternativ är:\n- får inte finnas i början av ordet,\n- får inte finnas i slutet av ordet,\n- kan finnas var som helst i ordet.\n\nEfter att ha tryckt på knappen börjar nedräkningen till ett slumpmässigt nummer. Standardintervallet är från ${kDefaultMinSeconds.toStringAsFixed(0)} sekunder till ${kDefaultMaxSeconds.toStringAsFixed(0)} sekunder. Intervallet kan ändras i inställningarna, men det rekommenderas att lämna standardinställningen.\n\nStartspelaren måste vara den första som kommer på ett ord. Efter att ha sagt ordet ska han eller hon peka på nästa spelare (medurs) eller ge honom eller henne något föremål som gruppen väljer, vilket skulle motsvara den tickande plastbomben från den klassiska versionen av spelet.\n\nOm spelaren i fråga inte lyckas säga ordet innan bomben exploderar, får han eller hon en poäng. Poäng kan läggas till längst ner på appens huvudsida. En poäng läggs till genom att klicka på cirkeln i spelarens färg. Om du gör ett misstag när du lägger till poäng kan du ångra det genom att hålla fingret på cirkeln i fråga. Spelaren med minst antal poäng vinner.\n\nObservera: Varje ord ska vara ett substantiv i nominativ form.\n\n",
  "Ljudtillgångar\n",
  'Ljud hämtade från Pixabay:\n',
  '- Tickande (länk)',
  '- Explosion (länk)\n\n',
  "Ikoner\n",
  "Ikoner från Font Awesome Icons.\n\n",
  "Författare\n",
  "Aleksander Wieland\n\n\n",
  '',
  '',
//bomb_page (random_text.dart)
  "Inte i början",
  "Kan vara var som helst",
  "Inte i slutet",
  "Runt",
];
