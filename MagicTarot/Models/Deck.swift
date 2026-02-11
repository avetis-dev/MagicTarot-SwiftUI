import SwiftUI

// MARK: - Полная колода 78 карт

let deck: [TarotCard] = majorArcana + cupsCards + pentaclesCards + wandsCards + swordsCards

// MARK: - Старшие Арканы (22 карты)
let majorArcana: [TarotCard] = [
    TarotCard(
        name: "Głupiec",
        description: "Nowy początek. Zaryzykuj i skocz w nieznane!",
        color: .yellow,
        image: "m00",
        suit: .major,
        interpretations: CardInterpretations(
            general: "Dziś jest idealny dzień na nowe początki. Wszechświat zachęca Cię do spontaniczności.",
            past: "W przeszłości podjąłeś odważną decyzję, która wydawała się szalona.",
            present: "Teraz stoisz na krawędzi czegoś nowego. Zaufaj sobie.",
            future: "Przed Tobą niespodziewana szansa. Bądź otwarty i gotowy."
        )
    ),
    TarotCard(
        name: "Mag",
        description: "Masz wszystkie zasoby. Czas na działanie!",
        color: .purple,
        image: "m01",
        suit: .major,
        interpretations: CardInterpretations(
            general: "Masz dziś ogromną moc tworzenia. Wszystkie narzędzia są w Twoich rękach.",
            past: "W przeszłości miałeś moment, kiedy wszystko szło po Twojej myśli.",
            present: "Masz teraz wszystko, czego potrzebujesz. Przestań czekać.",
            future: "Wkrótce odkryjesz w sobie nowe umiejętności."
        )
    ),
    TarotCard(
        name: "Arcykapłanka",
        description: "Słuchaj swojej intuicji. Tajemnica czeka na odkrycie.",
        color: .blue,
        image: "m02",
        suit: .major,
        interpretations: CardInterpretations(
            general: "Dziś Twoja intuicja jest wyjątkowo silna.",
            past: "W przeszłości zignorowałeś swoją intuicję.",
            present: "Teraz otaczają Cię tajemnice. Zaufaj przeczuciu.",
            future: "Wkrótce odkryjesz coś ukrytego."
        )
    ),
    TarotCard(
        name: "Cesarzowa",
        description: "Płodność i obfitość. Twórz i dbaj o innych.",
        color: .green,
        image: "m03",
        suit: .major,
        interpretations: CardInterpretations(
            general: "Dziś otacza Cię energia obfitości.",
            past: "W przeszłości ktoś otoczył Cię opieką i miłością.",
            present: "Teraz jest czas na tworzenie i pielęgnowanie.",
            future: "Przed Tobą okres obfitości."
        )
    ),
    TarotCard(
        name: "Cesarz",
        description: "Stabilność i władza. Czas przejąć kontrolę.",
        color: .red,
        image: "m04",
        suit: .major,
        interpretations: CardInterpretations(
            general: "Dziś potrzebujesz struktury i dyscypliny.",
            past: "W przeszłości ktoś silny miał wpływ na Twoje życie.",
            present: "Teraz musisz być silny i zdecydowany.",
            future: "Czeka Cię pozycja lidera."
        )
    ),
    TarotCard(
        name: "Hierofant",
        description: "Tradycja i mądrość. Szukaj mentora.",
        color: .orange,
        image: "m05",
        suit: .major,
        interpretations: CardInterpretations(
            general: "Dziś szukaj mądrości w tradycji.",
            past: "W przeszłości ważna lekcja wpłynęła na Twoje wartości.",
            present: "Teraz potrzebujesz przewodnika.",
            future: "Wkrótce staniesz się mentorem."
        )
    ),
    TarotCard(
        name: "Kochankowie",
        description: "Miłość i wybór. Podążaj za sercem.",
        color: .pink,
        image: "m06",
        suit: .major,
        interpretations: CardInterpretations(
            general: "Dziś chodzi o miłość i ważne wybory.",
            past: "W przeszłości podjąłeś ważny wybór sercowy.",
            present: "Stoisz przed ważnym wyborem. Zapytaj serce.",
            future: "Przed Tobą spotkanie z kimś ważnym."
        )
    ),
    TarotCard(
        name: "Rydwan",
        description: "Determinacja i zwycięstwo!",
        color: .gray,
        image: "m07",
        suit: .major,
        interpretations: CardInterpretations(
            general: "Dziś nic Cię nie powstrzyma!",
            past: "W przeszłości pokonałeś wielką przeszkodę.",
            present: "Jesteś w środku walki. Nie poddawaj się.",
            future: "Czeka Cię wielki triumf."
        )
    ),
    TarotCard(
        name: "Siła",
        description: "Wewnętrzna moc i cierpliwość.",
        color: .orange,
        image: "m08",
        suit: .major,
        interpretations: CardInterpretations(
            general: "Dziś Twoja siła leży w łagodności.",
            past: "Nauczyłeś się, że prawdziwa siła to opanowanie.",
            present: "Teraz potrzebujesz cierpliwości, nie siły.",
            future: "Przed Tobą wyzwanie wymagające wewnętrznej siły."
        )
    ),
    TarotCard(
        name: "Pustelnik",
        description: "Czas na refleksję. Odpowiedzi w ciszy.",
        color: .indigo,
        image: "m09",
        suit: .major,
        interpretations: CardInterpretations(
            general: "Dziś potrzebujesz samotności i ciszy.",
            past: "Okres samotności nauczył Cię czegoś ważnego.",
            present: "Twoja dusza potrzebuje odpoczynku.",
            future: "Przed Tobą okres refleksji."
        )
    ),
    TarotCard(
        name: "Koło Fortuny",
        description: "Zmiany nadchodzą. Los się obraca.",
        color: .cyan,
        image: "m10",
        suit: .major,
        interpretations: CardInterpretations(
            general: "Dziś los się obraca na Twoją korzyść.",
            past: "Nagły zwrot losu zmienił bieg Twojego życia.",
            present: "Właśnie teraz koło się obraca.",
            future: "Wielka zmiana nadchodzi."
        )
    ),
    TarotCard(
        name: "Sprawiedliwość",
        description: "Prawda wyjdzie na jaw.",
        color: .blue,
        image: "m11",
        suit: .major,
        interpretations: CardInterpretations(
            general: "Dziś chodzi o prawdę i uczciwość.",
            past: "Konsekwencje Twoich działań dosięgły Cię.",
            present: "Musisz podjąć uczciwą decyzję.",
            future: "Sprawiedliwość nadchodzi."
        )
    ),
    TarotCard(
        name: "Wisielec",
        description: "Zmień perspektywę. Zatrzymaj się.",
        color: .teal,
        image: "m12",
        suit: .major,
        interpretations: CardInterpretations(
            general: "Dziś nic nie rób na siłę.",
            past: "Czekanie dało Ci nowy punkt widzenia.",
            present: "Czujesz się zawieszony. To normalne.",
            future: "Będziesz musiał poświęcić coś."
        )
    ),
    TarotCard(
        name: "Śmierć",
        description: "Koniec i nowy początek.",
        color: .black,
        image: "m13",
        suit: .major,
        interpretations: CardInterpretations(
            general: "Nie bój się! Śmierć oznacza transformację.",
            past: "Przeżyłeś wielki koniec. To otworzyło nowe drzwi.",
            present: "Coś się kończy. Pozwól odejść.",
            future: "Przed Tobą wielka transformacja."
        )
    ),
    TarotCard(
        name: "Umiar",
        description: "Równowaga i harmonia.",
        color: .mint,
        image: "m14",
        suit: .major,
        interpretations: CardInterpretations(
            general: "Dziś szukaj równowagi we wszystkim.",
            past: "Nauczyłeś się, że skrajności prowadzą donikąd.",
            present: "Potrzebujesz harmonii.",
            future: "Przed Tobą okres spokoju."
        )
    ),
    TarotCard(
        name: "Diabeł",
        description: "Uwolnij się z łańcuchów!",
        color: .red,
        image: "m15",
        suit: .major,
        interpretations: CardInterpretations(
            general: "Co Cię zniewala? Masz moc, by się uwolnić.",
            past: "Byłeś zniewolony. To nauczyło Cię wolności.",
            present: "Coś ma nad Tobą zbyt dużą władzę.",
            future: "Przed Tobą pokusa. Bądź świadomy."
        )
    ),
    TarotCard(
        name: "Wieża",
        description: "Nagłe zmiany. Ze zniszczenia rodzi się nowe.",
        color: .gray,
        image: "m16",
        suit: .major,
        interpretations: CardInterpretations(
            general: "Przygotuj się na wstrząs.",
            past: "Coś się nagle zawaliło. To było potrzebne.",
            present: "Grunt ucieka spod nóg. Pozwól temu co fałszywe odejść.",
            future: "Nadchodzi nagła zmiana."
        )
    ),
    TarotCard(
        name: "Gwiazda",
        description: "Nadzieja i inspiracja.",
        color: .cyan,
        image: "m17",
        suit: .major,
        interpretations: CardInterpretations(
            general: "Dziś gwiazdy świecą dla Ciebie.",
            past: "Miałeś moment czystej nadziei.",
            present: "Po trudnym okresie widzisz światło.",
            future: "Twoje marzenia zaczną się spełniać."
        )
    ),
    TarotCard(
        name: "Księżyc",
        description: "Iluzje i lęki. Nie daj się zwieść.",
        color: .indigo,
        image: "m18",
        suit: .major,
        interpretations: CardInterpretations(
            general: "Dziś uważaj na iluzje.",
            past: "Dałeś się zwieść iluzji.",
            present: "Otaczają Cię wątpliwości. Poczekaj.",
            future: "Przed Tobą okres niepewności."
        )
    ),
    TarotCard(
        name: "Słońce",
        description: "Radość i sukces!",
        color: .yellow,
        image: "m19",
        suit: .major,
        interpretations: CardInterpretations(
            general: "Dziś jest Twój dzień! Sukces i radość.",
            past: "Przeżyłeś moment czystego szczęścia.",
            present: "Wszystko się układa. Ciesz się!",
            future: "Przed Tobą najlepszy okres od dawna."
        )
    ),
    TarotCard(
        name: "Sąd",
        description: "Odrodzenie i przebudzenie!",
        color: .purple,
        image: "m20",
        suit: .major,
        interpretations: CardInterpretations(
            general: "Dziś usłyszysz wezwanie. Czas na przebudzenie.",
            past: "Przeżyłeś moment przebudzenia.",
            present: "Czas ocenić swoje życie uczciwie.",
            future: "Wielkie przebudzenie nadchodzi."
        )
    ),
    TarotCard(
        name: "Świat",
        description: "Spełnienie i ukończenie!",
        color: .green,
        image: "m21",
        suit: .major,
        interpretations: CardInterpretations(
            general: "Gratulacje! Cykl się zamyka, cel osiągnięty.",
            past: "Zakończyłeś ważny etap życia.",
            present: "Jesteś w momencie spełnienia.",
            future: "Cel zostanie osiągnięty."
        )
    ),
]

// MARK: - Kielichy / Cups (14 карт)
let cupsCards: [TarotCard] = [
    TarotCard(name: "As Kielichów", description: "Nowa miłość, emocje, intuicja.", color: .blue, image: "c01", suit: .cups,
        interpretations: CardInterpretations(general: "Nowe uczucie wkracza w Twoje życie.", past: "Początek ważnej relacji emocjonalnej.", present: "Otwórz serce na nowe emocje.", future: "Nadchodzi nowa miłość lub głęboka więź.")),
    TarotCard(name: "Dwójka Kielichów", description: "Partnerstwo, połączenie, harmonia.", color: .blue, image: "c02", suit: .cups,
        interpretations: CardInterpretations(general: "Dziś chodzi o połączenie z drugą osobą.", past: "Ważne partnerstwo ukształtowało Cię.", present: "Buduj mosty, nie mury.", future: "Czeka Cię piękne partnerstwo.")),
    TarotCard(name: "Trójka Kielichów", description: "Celebracja, przyjaźń, wspólnota.", color: .blue, image: "c03", suit: .cups,
        interpretations: CardInterpretations(general: "Czas na świętowanie z bliskimi!", past: "Wspomnienia radosnych chwil z przyjaciółmi.", present: "Otaczają Cię ludzie, którzy Cię kochają.", future: "Czeka Cię radosne spotkanie.")),
    TarotCard(name: "Czwórka Kielichów", description: "Apatia, niezadowolenie, melancholia.", color: .blue, image: "c04", suit: .cups,
        interpretations: CardInterpretations(general: "Czujesz znudzenie? Spójrz na to, co masz.", past: "Przegapiłeś okazję przez apatię.", present: "Nie widzisz szans, które są przed Tobą.", future: "Przebudzisz się z marazmu.")),
    TarotCard(name: "Piątka Kielichów", description: "Strata, żal, ale nie wszystko stracone.", color: .blue, image: "c05", suit: .cups,
        interpretations: CardInterpretations(general: "Smutek jest naturalny, ale spójrz za siebie.", past: "Strata nauczyła Cię doceniać.", present: "Żałujesz czegoś, ale masz jeszcze szansę.", future: "Ból minie, a mądrość zostanie.")),
    TarotCard(name: "Szóstka Kielichów", description: "Nostalgia, wspomnienia, niewinność.", color: .blue, image: "c06", suit: .cups,
        interpretations: CardInterpretations(general: "Dziś wspomnienia wracają.", past: "Dzieciństwo i niewinność kształtowały Cię.", present: "Tęsknisz za przeszłością.", future: "Ktoś z przeszłości wróci.")),
    TarotCard(name: "Siódemka Kielichów", description: "Iluzje, marzenia, fantazje.", color: .blue, image: "c07", suit: .cups,
        interpretations: CardInterpretations(general: "Nie wszystko, co widzisz, jest prawdziwe.", past: "Żyłeś w świecie fantazji.", present: "Za dużo marzeń, za mało działania.", future: "Czas zacząć realizować marzenia.")),
    TarotCard(name: "Ósemka Kielichów", description: "Odejście, poszukiwanie głębi.", color: .blue, image: "c08", suit: .cups,
        interpretations: CardInterpretations(general: "Czas odejść od tego, co nie daje spełnienia.", past: "Odszedłeś od czegoś ważnego.", present: "Czujesz pustkę mimo pozornego szczęścia.", future: "Znajdziesz to, czego naprawdę szukasz.")),
    TarotCard(name: "Dziewiątka Kielichów", description: "Spełnienie życzeń! Radość!", color: .blue, image: "c09", suit: .cups,
        interpretations: CardInterpretations(general: "Twoje życzenie się spełni!", past: "Pamiętasz moment pełnego szczęścia.", present: "Ciesz się tym, co masz. Zasłużyłeś.", future: "Wielka radość nadchodzi!")),
    TarotCard(name: "Dziesiątka Kielichów", description: "Szczęście rodzinne, harmonia.", color: .blue, image: "c10", suit: .cups,
        interpretations: CardInterpretations(general: "Pełnia emocjonalna i rodzinna.", past: "Miałeś piękne chwile z rodziną.", present: "Otaczają Cię miłość i harmonia.", future: "Czeka Cię rodzinne szczęście.")),
    TarotCard(name: "Paź Kielichów", description: "Romantyczna wiadomość, wrażliwość.", color: .blue, image: "c11", suit: .cups,
        interpretations: CardInterpretations(general: "Dziś przyjdzie romantyczna wiadomość.", past: "Młodzieńcza miłość nauczyła Cię uczuć.", present: "Bądź otwarty na nowe emocje.", future: "Ktoś wyznaje Ci uczucia.")),
    TarotCard(name: "Rycerz Kielichów", description: "Romantyk, marzyciel, propozycja.", color: .blue, image: "c12", suit: .cups,
        interpretations: CardInterpretations(general: "Nadchodzi ktoś romantyczny.", past: "Ktoś walczył o Twoje serce.", present: "Podążaj za emocjami, nie logiką.", future: "Romantyczna propozycja jest blisko.")),
    TarotCard(name: "Królowa Kielichów", description: "Empatia, intuicja, troska.", color: .blue, image: "c13", suit: .cups,
        interpretations: CardInterpretations(general: "Zaufaj swojej empatii i intuicji.", past: "Kobieca energia Cię kształtowała.", present: "Bądź opiekuńczy wobec siebie i innych.", future: "Ktoś troskliwy wejdzie w Twoje życie.")),
    TarotCard(name: "Król Kielichów", description: "Mądrość emocjonalna, spokój.", color: .blue, image: "c14", suit: .cups,
        interpretations: CardInterpretations(general: "Panuj nad emocjami z mądrością.", past: "Nauczyłeś się kontrolować emocje.", present: "Bądź dojrzały emocjonalnie.", future: "Staniesz się emocjonalnym liderem.")),
]

// MARK: - Pentakle / Pentacles (14 карт)
let pentaclesCards: [TarotCard] = [
    TarotCard(name: "As Pentakli", description: "Nowa szansa finansowa, dobrobyt.", color: .yellow, image: "p01", suit: .pentacles,
        interpretations: CardInterpretations(general: "Nowa szansa finansowa!", past: "Początek Twojej drogi do dobrobytu.", present: "Złap tę okazję!", future: "Nadchodzi finansowy przełom.")),
    TarotCard(name: "Dwójka Pentakli", description: "Balans, żonglowanie, elastyczność.", color: .yellow, image: "p02", suit: .pentacles,
        interpretations: CardInterpretations(general: "Żongluj priorytetami z gracją.", past: "Nauczyłeś się balansować.", present: "Za dużo na głowie? Ustal priorytety.", future: "Będziesz musiał być elastyczny.")),
    TarotCard(name: "Trójka Pentakli", description: "Praca zespołowa, mistrzostwo.", color: .yellow, image: "p03", suit: .pentacles,
        interpretations: CardInterpretations(general: "Współpraca przyniesie sukces.", past: "Praca z innymi nauczyła Cię wiele.", present: "Szukaj wsparcia zespołu.", future: "Wspólny projekt odniesie sukces.")),
    TarotCard(name: "Czwórka Pentakli", description: "Bezpieczeństwo, oszczędzanie.", color: .yellow, image: "p04", suit: .pentacles,
        interpretations: CardInterpretations(general: "Chroń to co masz, ale nie bądź skąpy.", past: "Za bardzo trzymałeś się pieniędzy.", present: "Oszczędzaj, ale żyj.", future: "Stabilność finansowa nadchodzi.")),
    TarotCard(name: "Piątka Pentakli", description: "Trudności finansowe, izolacja.", color: .yellow, image: "p05", suit: .pentacles,
        interpretations: CardInterpretations(general: "Trudny okres, ale pomocy jest blisko.", past: "Przeżyłeś trudny okres finansowy.", present: "Nie bój się prosić o pomoc.", future: "Trudności miną. Trzymaj się.")),
    TarotCard(name: "Szóstka Pentakli", description: "Hojność, dawanie i otrzymywanie.", color: .yellow, image: "p06", suit: .pentacles,
        interpretations: CardInterpretations(general: "Dziś dziel się z innymi.", past: "Ktoś pomógł Ci w trudnym momencie.", present: "Bądź hojny — wróci do Ciebie.", future: "Otrzymasz niespodziewaną pomoc.")),
    TarotCard(name: "Siódemka Pentakli", description: "Cierpliwość, inwestycja, wzrost.", color: .yellow, image: "p07", suit: .pentacles,
        interpretations: CardInterpretations(general: "Cierpliwość się opłaci.", past: "Inwestycja czasu przyniosła owoce.", present: "Nie spiesz się. Wzrost wymaga czasu.", future: "Twoje wysiłki przyniosą rezultaty.")),
    TarotCard(name: "Ósemka Pentakli", description: "Pracowitość, doskonalenie, rzemiosło.", color: .yellow, image: "p08", suit: .pentacles,
        interpretations: CardInterpretations(general: "Skup się na doskonaleniu swoich umiejętności.", past: "Ciężka praca ukształtowała Twoje talenty.", present: "Czas poświęcić się rzemiosłu.", future: "Staniesz się mistrzem w swoim fachu.")),
    TarotCard(name: "Dziewiątka Pentakli", description: "Luksus, niezależność, sukces.", color: .yellow, image: "p09", suit: .pentacles,
        interpretations: CardInterpretations(general: "Cieszysz się owocami swojej pracy!", past: "Twoja praca przyniosła dobrobyt.", present: "Zasługujesz na to, co masz.", future: "Luksus i niezależność są na wyciągnięcie ręki.")),
    TarotCard(name: "Dziesiątka Pentakli", description: "Bogactwo rodzinne, dziedzictwo.", color: .yellow, image: "p10", suit: .pentacles,
        interpretations: CardInterpretations(general: "Bogactwo wykracza poza pieniądze.", past: "Rodzina dała Ci solidne fundamenty.", present: "Dbaj o rodzinne wartości.", future: "Zostawisz piękne dziedzictwo.")),
    TarotCard(name: "Paź Pentakli", description: "Nowa nauka, ambicja, początek.", color: .yellow, image: "p11", suit: .pentacles,
        interpretations: CardInterpretations(general: "Czas uczyć się czegoś nowego!", past: "Młodzieńcza ambicja napędzała Cię.", present: "Bądź pilny i skupiony.", future: "Nowa umiejętność zmieni Twoje życie.")),
    TarotCard(name: "Rycerz Pentakli", description: "Cierpliwość, odpowiedzialność.", color: .yellow, image: "p12", suit: .pentacles,
        interpretations: CardInterpretations(general: "Powoli ale pewnie do celu.", past: "Wytrwałość doprowadziła Cię tutaj.", present: "Bądź cierpliwy i konsekwentny.", future: "Twoja pracowitość zostanie nagrodzona.")),
    TarotCard(name: "Królowa Pentakli", description: "Obfitość, praktyczność, dom.", color: .yellow, image: "p13", suit: .pentacles,
        interpretations: CardInterpretations(general: "Zadbaj o dom i finanse.", past: "Ktoś praktyczny i kochający Cię wspierał.", present: "Połącz komfort z mądrością.", future: "Domowe szczęście i stabilność nadchodzą.")),
    TarotCard(name: "Król Pentakli", description: "Sukces materialny, stabilność.", color: .yellow, image: "p14", suit: .pentacles,
        interpretations: CardInterpretations(general: "Jesteś na drodze do sukcesu materialnego.", past: "Zbudowałeś solidne fundamenty.", present: "Zarządzaj mądrze swoimi zasobami.", future: "Czeka Cię finansowa stabilność.")),
]

// MARK: - Różdżki / Wands (14 карт)
let wandsCards: [TarotCard] = [
    TarotCard(name: "As Różdżek", description: "Inspiracja, nowy projekt, energia!", color: .orange, image: "w01", suit: .wands,
        interpretations: CardInterpretations(general: "Nowy pomysł płonie w Tobie!", past: "Iskra inspiracji zmieniła Twoje życie.", present: "Działaj! Energia jest teraz.", future: "Nowy ekscytujący projekt nadchodzi.")),
    TarotCard(name: "Dwójka Różdżek", description: "Planowanie, decyzje, wizja.", color: .orange, image: "w02", suit: .wands,
        interpretations: CardInterpretations(general: "Czas planować następny krok.", past: "Twoja wizja ukształtowała przyszłość.", present: "Stoisz na rozdrożu. Wybierz mądrze.", future: "Wielkie plany czekają na realizację.")),
    TarotCard(name: "Trójka Różdżek", description: "Ekspansja, rozwój, podróże.", color: .orange, image: "w03", suit: .wands,
        interpretations: CardInterpretations(general: "Twoje plany się rozwijają!", past: "Odwaga otworzyła Ci nowe horyzonty.", present: "Czas rozszerzyć swoje horyzonty.", future: "Czeka Cię podróż lub ekspansja.")),
    TarotCard(name: "Czwórka Różdżek", description: "Świętowanie, stabilność, dom.", color: .orange, image: "w04", suit: .wands,
        interpretations: CardInterpretations(general: "Czas świętować osiągnięcia!", past: "Zbudowałeś coś trwałego.", present: "Cieszysz się z tego, co stworzyłeś.", future: "Stabilność i radość nadchodzą.")),
    TarotCard(name: "Piątka Różdżek", description: "Konflikt, rywalizacja, napięcie.", color: .orange, image: "w05", suit: .wands,
        interpretations: CardInterpretations(general: "Konflikty mogą prowadzić do wzrostu.", past: "Rywalizacja hartowała Cię.", present: "Nie unikaj konfrontacji.", future: "Napięcie się rozwiąże.")),
    TarotCard(name: "Szóstka Różdżek", description: "Zwycięstwo, uznanie, triumf!", color: .orange, image: "w06", suit: .wands,
        interpretations: CardInterpretations(general: "Zwycięstwo jest Twoje!", past: "Twój triumf dał Ci pewność siebie.", present: "Ludzie Cię doceniają.", future: "Publiczne uznanie nadchodzi.")),
    TarotCard(name: "Siódemka Różdżek", description: "Obrona, wytrwałość, wyzwanie.", color: .orange, image: "w07", suit: .wands,
        interpretations: CardInterpretations(general: "Broń swoich przekonań!", past: "Musiałeś walczyć o swoje.", present: "Nie poddawaj się pod presją.", future: "Wyzwanie, które Cię wzmocni.")),
    TarotCard(name: "Ósemka Różdżek", description: "Szybkość, ruch, postęp!", color: .orange, image: "w08", suit: .wands,
        interpretations: CardInterpretations(general: "Wszystko przyspiesza!", past: "Szybkie zmiany zmieniły Twoje życie.", present: "Sprawy nabierają tempa.", future: "Szybki postęp nadchodzi.")),
    TarotCard(name: "Dziewiątka Różdżek", description: "Wytrwałość, odporność, siła.", color: .orange, image: "w09", suit: .wands,
        interpretations: CardInterpretations(general: "Jesteś silniejszy niż myślisz.", past: "Przetrwałeś najtrudniejsze.", present: "Trzymaj się. Koniec jest blisko.", future: "Ostatnia przeszkoda przed sukcesem.")),
    TarotCard(name: "Dziesiątka Różdżek", description: "Przeciążenie, odpowiedzialność.", color: .orange, image: "w10", suit: .wands,
        interpretations: CardInterpretations(general: "Niesiesz za dużo. Poproś o pomoc.", past: "Brałeś za dużo na siebie.", present: "Czas oddelegować część obowiązków.", future: "Ciężar się zmniejszy.")),
    TarotCard(name: "Paź Różdżek", description: "Entuzjazm, odkrycie, wiadomość.", color: .orange, image: "w11", suit: .wands,
        interpretations: CardInterpretations(general: "Ekscytująca wiadomość nadchodzi!", past: "Młodzieńczy entuzjazm napędzał Cię.", present: "Bądź otwarty na nowe możliwości.", future: "Odkrycie, które Cię zainspiruje.")),
    TarotCard(name: "Rycerz Różdżek", description: "Akcja, przygoda, odwaga!", color: .orange, image: "w12", suit: .wands,
        interpretations: CardInterpretations(general: "Czas na działanie!", past: "Odwaga zaprowadziła Cię daleko.", present: "Nie czekaj. Działaj teraz!", future: "Przygoda życia nadchodzi.")),
    TarotCard(name: "Królowa Różdżek", description: "Charyzma, pewność, niezależność.", color: .orange, image: "w13", suit: .wands,
        interpretations: CardInterpretations(general: "Twoja charyzma przyciąga ludzi.", past: "Silna kobieta Cię inspirowała.", present: "Bądź pewny siebie i niezależny.", future: "Twoja charyzma otworzy nowe drzwi.")),
    TarotCard(name: "Król Różdżek", description: "Przywództwo, wizja, inspiracja.", color: .orange, image: "w14", suit: .wands,
        interpretations: CardInterpretations(general: "Jesteś naturalnym liderem.", past: "Lider zainspirował Twoje działania.", present: "Prowadź innych swoją wizją.", future: "Staniesz się liderem.")),
]

// MARK: - Miecze / Swords (14 карт)
let swordsCards: [TarotCard] = [
    TarotCard(name: "As Mieczy", description: "Przełom, prawda, jasność umysłu.", color: .gray, image: "s01", suit: .swords,
        interpretations: CardInterpretations(general: "Moment prawdy i jasności!", past: "Przełomowy moment zmienił Twoje myślenie.", present: "Prawda jest teraz krystalicznie jasna.", future: "Nadchodzi moment przełomu.")),
    TarotCard(name: "Dwójka Mieczy", description: "Dylemat, impas, trudna decyzja.", color: .gray, image: "s02", suit: .swords,
        interpretations: CardInterpretations(general: "Stoisz przed trudnym wyborem.", past: "Unikałeś trudnej decyzji.", present: "Nie możesz dłużej zwlekać.", future: "Decyzja musi zostać podjęta.")),
    TarotCard(name: "Trójka Mieczy", description: "Ból serca, zdrada, smutek.", color: .gray, image: "s03", suit: .swords,
        interpretations: CardInterpretations(general: "Ból jest tymczasowy. Uleczysz się.", past: "Zdrada lub rozczarowanie zraniły Cię.", present: "Pozwól sobie na ból. To część uzdrowienia.", future: "Rana się zagoi.")),
    TarotCard(name: "Czwórka Mieczy", description: "Odpoczynek, regeneracja, wycofanie.", color: .gray, image: "s04", suit: .swords,
        interpretations: CardInterpretations(general: "Twój umysł potrzebuje odpoczynku.", past: "Odpoczynek dał Ci siłę.", present: "Zatrzymaj się i zregeneruj.", future: "Przed działaniem — odpocznij.")),
    TarotCard(name: "Piątka Mieczy", description: "Konflikt, oszustwo, pyrrusowe zwycięstwo.", color: .gray, image: "s05", suit: .swords,
        interpretations: CardInterpretations(general: "Nie każde zwycięstwo jest warte ceny.", past: "Wygrałeś, ale straciłeś coś ważnego.", present: "Uważaj na oszustwo.", future: "Wybierz mądrze swoje bitwy.")),
    TarotCard(name: "Szóstka Mieczy", description: "Ucieczka, zmiana, nowy początek.", color: .gray, image: "s06", suit: .swords,
        interpretations: CardInterpretations(general: "Czas ruszyć dalej.", past: "Uciekłeś od trudnej sytuacji.", present: "Odejdź od tego, co Ci szkodzi.", future: "Przeprowadzka lub wielka zmiana.")),
    TarotCard(name: "Siódemka Mieczy", description: "Spryt, strategia, ostrożność.", color: .gray, image: "s07", suit: .swords,
        interpretations: CardInterpretations(general: "Działaj sprytnie, nie na siłę.", past: "Spryt pomógł Ci w trudnej sytuacji.", present: "Bądź strategiczny.", future: "Potrzebna będzie dyplomacja.")),
    TarotCard(name: "Ósemka Mieczy", description: "Uwięzienie, ograniczenia, bezsilność.", color: .gray, image: "s08", suit: .swords,
        interpretations: CardInterpretations(general: "Czujesz się uwięziony? Wyjście istnieje!", past: "Byłeś ograniczony przez okoliczności.", present: "Ograniczenia są w Twojej głowie.", future: "Uwolnisz się z pułapki.")),
    TarotCard(name: "Dziewiątka Mieczy", description: "Lęk, niepokój, koszmary.", color: .gray, image: "s09", suit: .swords,
        interpretations: CardInterpretations(general: "Twoje lęki są gorsze niż rzeczywistość.", past: "Niepokój nie pozwalał Ci spać.", present: "Nie daj się ponieść lękom.", future: "Okaże się, że bałeś się niepotrzebnie.")),
    TarotCard(name: "Dziesiątka Mieczy", description: "Koniec, dno, ale i nowy świt.", color: .gray, image: "s10", suit: .swords,
        interpretations: CardInterpretations(general: "To dno — ale stąd droga prowadzi tylko w górę!", past: "Osiągnąłeś dno i wstałeś.", present: "Najgorsze jest za Tobą.", future: "Po ciemności zawsze przychodzi świt.")),
    TarotCard(name: "Paź Mieczy", description: "Ciekawość, nowe pomysły, vigilance.", color: .gray, image: "s11", suit: .swords,
        interpretations: CardInterpretations(general: "Bądź ciekawy i czujny!", past: "Ciekawość otworzyła Ci oczy.", present: "Szukaj informacji. Wiedza to potęga.", future: "Nowy pomysł zmieni perspektywę.")),
    TarotCard(name: "Rycerz Mieczy", description: "Ambicja, determinacja, pośpiech.", color: .gray, image: "s12", suit: .swords,
        interpretations: CardInterpretations(general: "Pędzisz naprzód! Ale uważaj na zakrętach.", past: "Twoja ambicja napędzała Cię.", present: "Działaj szybko, ale mądrze.", future: "Szybki postęp, ale bądź ostrożny.")),
    TarotCard(name: "Królowa Mieczy", description: "Niezależność, intelekt, prawda.", color: .gray, image: "s13", suit: .swords,
        interpretations: CardInterpretations(general: "Myśl jasno i mów prawdę.", past: "Silna kobieta nauczyła Cię niezależności.", present: "Bądź uczciwy i bezpośredni.", future: "Twoja mądrość poprowadzi innych.")),
    TarotCard(name: "Król Mieczy", description: "Autorytet, logika, sprawiedliwość.", color: .gray, image: "s14", suit: .swords,
        interpretations: CardInterpretations(general: "Podejmuj decyzje logicznie.", past: "Autorytet wpłynął na Twoje myślenie.", present: "Bądź sprawiedliwy i obiektywny.", future: "Zostaniesz szanowany za mądrość.")),
]
