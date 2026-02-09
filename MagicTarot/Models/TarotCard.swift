import SwiftUI

struct TarotCard: Identifiable {
    var id: String { name }
    let name: String
    let description: String
    let color: Color
    let image: String
    let interpretations: CardInterpretations
}

// Толкования для разных позиций
struct CardInterpretations {
    let general: String      // Общее значение (Карта Дня)
    let past: String         // В позиции "Прошлое"
    let present: String      // В позиции "Настоящее"
    let future: String       // В позиции "Будущее"
}

let deck: [TarotCard] = [
    // 0 - Głupiec
    TarotCard(
        name: "Głupiec",
        description: "Nowy początek. Zaryzykuj i skocz w nieznane!",
        color: .yellow,
        image: "m00",
        interpretations: CardInterpretations(
            general: "Dziś jest idealny dzień na nowe początki. Wszechświat zachęca Cię do spontaniczności. Nie analizuj za dużo — po prostu zrób pierwszy krok. Twoja naiwność i otwartość są teraz Twoją siłą.",
            past: "W przeszłości podjąłeś odważną decyzję, która wydawała się szalona. Ten skok w nieznane ukształtował to, kim dziś jesteś. Nie żałuj tamtego wyboru — był potrzebny.",
            present: "Teraz stoisz na krawędzi czegoś nowego. Czujesz niepewność, ale też ekscytację. Zaufaj sobie — ten moment wymaga od Ciebie odwagi, nie perfekcji.",
            future: "Przed Tobą niespodziewana szansa. Pojawi się możliwość, która zmieni Twoje życie. Bądź otwarty i gotowy — nowy rozdział czeka tuż za rogiem."
        )
    ),
    
    // 1 - Mag
    TarotCard(
        name: "Mag",
        description: "Masz wszystkie zasoby. Czas na działanie!",
        color: .purple,
        image: "m01",
        interpretations: CardInterpretations(
            general: "Masz dziś ogromną moc tworzenia. Wszystkie narzędzia są w Twoich rękach. Skup się na tym, czego naprawdę chcesz i zacznij działać. To dzień manifestacji.",
            past: "W przeszłości miałeś moment, kiedy wszystko szło po Twojej myśli. Wykorzystałeś swoje talenty i zasoby. Ta energia wciąż w Tobie jest.",
            present: "Masz teraz wszystko, czego potrzebujesz. Przestań czekać na idealny moment — on jest TERAZ. Twoja kreatywność i umiejętności są na najwyższym poziomie.",
            future: "Wkrótce odkryjesz w sobie nowe umiejętności. Pojawi się okazja, w której pokażesz, na co naprawdę Cię stać. Przygotuj się na swój moment."
        )
    ),
    
    // 2 - Arcykapłanka
    TarotCard(
        name: "Arcykapłanka",
        description: "Słuchaj swojej intuicji. Tajemnica czeka na odkrycie.",
        color: .blue,
        image: "m02",
        interpretations: CardInterpretations(
            general: "Dziś Twoja intuicja jest wyjątkowo silna. Odpowiedzi, których szukasz, są już w Tobie. Nie szukaj ich na zewnątrz — zamknij oczy i posłuchaj wewnętrznego głosu.",
            past: "W przeszłości zignorowałeś swoją intuicję. Było coś, co czułeś głęboko, ale nie posłuchałeś. Ta lekcja nauczyła Cię ufać sobie.",
            present: "Teraz otaczają Cię tajemnice i rzeczy niewypowiedziane. Nie wszystko jest takie, jak się wydaje. Zaufaj swojemu przeczuciu — ono Cię nie zawiedzie.",
            future: "Wkrótce odkryjesz coś, co było przed Tobą ukryte. Tajemnica się wyjaśni. Bądź cierpliwy — prawda objawi się w odpowiednim momencie."
        )
    ),
    
    // 3 - Cesarzowa
    TarotCard(
        name: "Cesarzowa",
        description: "Płodność i obfitość. Twórz i dbaj o innych.",
        color: .green,
        image: "m03",
        interpretations: CardInterpretations(
            general: "Dziś otacza Cię energia obfitości. To doskonały moment na tworzenie — projektów, relacji, pomysłów. Zadbaj o siebie i bliskich. Natura jest po Twojej stronie.",
            past: "W przeszłości ktoś otoczył Cię opieką i miłością. Ta troska dała Ci fundamenty, na których budujesz swoje życie. Bądź wdzięczny za tę energię.",
            present: "Teraz jest czas na tworzenie i pielęgnowanie. Czy to relacja, projekt czy marzenie — daj temu swoją uwagę i miłość. Wszystko, czego dotkniesz, rozkwitnie.",
            future: "Przed Tobą okres obfitości. Twoje wysiłki przyniosą owoce. Spodziewaj się wzrostu — finansowego, emocjonalnego lub duchowego."
        )
    ),
    
    // 4 - Cesarz
    TarotCard(
        name: "Cesarz",
        description: "Stabilność i władza. Czas przejąć kontrolę nad swoim życiem.",
        color: .red,
        image: "m04",
        interpretations: CardInterpretations(
            general: "Dziś potrzebujesz struktury i dyscypliny. Czas podjąć decyzje i wziąć odpowiedzialność. Nie uciekaj od przywództwa — jesteś gotowy.",
            past: "W przeszłości ktoś silny miał wpływ na Twoje życie — ojciec, szef, mentor. Ta relacja ukształtowała Twoje podejście do władzy i kontroli.",
            present: "Teraz musisz być silny i zdecydowany. Ludzie wokół Ciebie potrzebują lidera. Postaw granice i trzymaj się swoich zasad.",
            future: "Czeka Cię awans lub pozycja lidera. Będziesz musiał przejąć kontrolę nad sytuacją. Przygotuj się na odpowiedzialność."
        )
    ),
    
    // 5 - Hierofant
    TarotCard(
        name: "Hierofant",
        description: "Tradycja i mądrość. Szukaj nauczyciela lub mentora.",
        color: .orange,
        image: "m05",
        interpretations: CardInterpretations(
            general: "Dziś szukaj mądrości w tradycji i doświadczeniu innych. Mentor lub nauczyciel może pojawić się w Twoim życiu. Bądź otwarty na naukę.",
            past: "W przeszłości ważna lekcja lub nauczyciel wpłynął na Twoje wartości. Te fundamenty wciąż Cię prowadzą, nawet jeśli o tym nie myślisz.",
            present: "Teraz potrzebujesz przewodnika. Nie musisz wszystkiego rozumieć sam. Szukaj wiedzy u tych, którzy przeszli tę drogę przed Tobą.",
            future: "Wkrótce staniesz się mentorem dla kogoś innego. Twoje doświadczenie będzie cenne. Przygotuj się na rolę nauczyciela."
        )
    ),
    
    // 6 - Kochankowie
    TarotCard(
        name: "Kochankowie",
        description: "Miłość i wybór. Podążaj za głosem serca.",
        color: .pink,
        image: "m06",
        interpretations: CardInterpretations(
            general: "Dziś chodzi o miłość i ważne wybory. Słuchaj serca, nie tylko rozumu. Decyzja, którą podejmiesz, wpłynie na Twoje relacje i wartości.",
            past: "W przeszłości podjąłeś ważny wybór sercowy. Ta decyzja — czy w miłości, czy w wartościach — zdefiniowała Twoją ścieżkę.",
            present: "Stoisz przed ważnym wyborem. Dwie drogi, dwie opcje. Nie wybieraj logicznie — zapytaj serce. Ono zna odpowiedź.",
            future: "Przed Tobą spotkanie z kimś ważnym lub decyzja, która odmieni Twoje życie uczuciowe. Miłość jest bliżej niż myślisz."
        )
    ),
    
    // 7 - Rydwan
    TarotCard(
        name: "Rydwan",
        description: "Determinacja i zwycięstwo. Pędź naprzód z odwagą!",
        color: .gray,
        image: "m07",
        interpretations: CardInterpretations(
            general: "Dziś nic Cię nie powstrzyma! Masz determinację i siłę, by pokonać każdą przeszkodę. Pędź naprzód — zwycięstwo jest Twoje.",
            past: "W przeszłości pokonałeś wielką przeszkodę dzięki swojej determinacji. Ten triumf dał Ci pewność siebie, którą nosisz do dziś.",
            present: "Jesteś w środku walki. Nie poddawaj się teraz — jesteś bliżej celu niż myślisz. Skup się i rusz naprzód z pełną mocą.",
            future: "Czeka Cię wielki triumf. Przeszkody, które teraz widzisz, zostaną pokonane. Zwycięstwo jest na wyciągnięcie ręki."
        )
    ),
    
    // 8 - Siła
    TarotCard(
        name: "Siła",
        description: "Wewnętrzna moc i cierpliwość. Poskrom swoje lęki.",
        color: .orange,
        image: "m08",
        interpretations: CardInterpretations(
            general: "Dziś Twoja prawdziwa siła leży w łagodności i cierpliwości. Nie walcz na siłę — poskrom swoje lęki miłością i zrozumieniem.",
            past: "W przeszłości nauczyłeś się, że prawdziwa siła to nie agresja, lecz opanowanie. Ta lekcja uczyniła Cię silniejszym niż myślisz.",
            present: "Teraz potrzebujesz cierpliwości, nie siły. Sytuacja wymaga łagodnego podejścia. Poskrom swój gniew i lęk — one Ci nie pomogą.",
            future: "Przed Tobą wyzwanie, które wymaga wewnętrznej siły. Poradzisz sobie — ale nie dzięki walce, lecz dzięki opanowaniu i wierze w siebie."
        )
    ),
    
    // 9 - Pustelnik
    TarotCard(
        name: "Pustelnik",
        description: "Czas na refleksję. Odpowiedzi znajdziesz w ciszy.",
        color: .indigo,
        image: "m09",
        interpretations: CardInterpretations(
            general: "Dziś potrzebujesz samotności i ciszy. Odłóż telefon, wyłącz hałas. Odpowiedzi na Twoje pytania znajdziesz tylko w refleksji.",
            past: "W przeszłości okres samotności lub izolacji nauczył Cię czegoś ważnego. To, co wtedy odkryłeś w ciszy, wciąż Cię prowadzi.",
            present: "Teraz czujesz potrzebę wycofania się. To naturalne — Twoja dusza potrzebuje odpoczynku. Daj sobie przestrzeń na myślenie.",
            future: "Przed Tobą okres refleksji. Będziesz musiał się zatrzymać i zajrzeć w głąb siebie. To nie słabość — to mądrość."
        )
    ),
    
    // 10 - Koło Fortuny
    TarotCard(
        name: "Koło Fortuny",
        description: "Zmiany nadchodzą. Los się obraca na twoją korzyść.",
        color: .cyan,
        image: "m10",
        interpretations: CardInterpretations(
            general: "Dziś los się obraca. Coś się zmieni — i to na lepsze. Bądź gotowy na niespodzianki. Wszechświat ma dla Ciebie plan.",
            past: "W przeszłości nagły zwrot losu zmienił bieg Twojego życia. Może wtedy tego nie rozumiałeś, ale teraz widzisz sens tamtej zmiany.",
            present: "Właśnie teraz koło się obraca. Czujesz, że coś się zmienia. Nie opieraj się — płyń z prądem i zaufaj procesowi.",
            future: "Wielka zmiana nadchodzi. Może to nowa praca, relacja lub przeprowadzka. Bądź elastyczny — los przyniesie Ci coś lepszego."
        )
    ),
    
    // 11 - Sprawiedliwość
    TarotCard(
        name: "Sprawiedliwość",
        description: "Prawda wyjdzie na jaw. Bądź uczciwy wobec siebie.",
        color: .blue,
        image: "m11",
        interpretations: CardInterpretations(
            general: "Dziś chodzi o prawdę i uczciwość. Bądź szczery wobec siebie i innych. Karma wraca — zarówno dobra, jak i zła.",
            past: "W przeszłości konsekwencje Twoich działań dosięgły Cię. Sprawiedliwość zadziałała — i dzięki temu jesteś mądrzejszy.",
            present: "Teraz musisz podjąć uczciwą decyzję. Nie oszukuj siebie. Prawda może być trudna, ale jest jedyną drogą naprzód.",
            future: "Sprawiedliwość nadchodzi. Jeśli działałeś uczciwie — zostaniesz nagrodzony. Jeśli nie — czas naprawić błędy."
        )
    ),
    
    // 12 - Wisielec
    TarotCard(
        name: "Wisielec",
        description: "Zmień perspektywę. Czasem trzeba się zatrzymać.",
        color: .teal,
        image: "m12",
        interpretations: CardInterpretations(
            general: "Dziś nic nie rób na siłę. Zatrzymaj się i spójrz na sytuację z innej perspektywy. Czasem najlepsza decyzja to brak decyzji.",
            past: "W przeszłości musiałeś czekać i to czekanie było trudne. Ale właśnie ta pauza dała Ci nowy punkt widzenia.",
            present: "Czujesz się zawieszony — jakby nic nie szło do przodu. To normalne. Nie walcz z tym. Ta pauza jest potrzebna.",
            future: "Będziesz musiał poświęcić coś, by zyskać coś większego. To nie strata — to inwestycja. Zmień perspektywę."
        )
    ),
    
    // 13 - Śmierć
    TarotCard(
        name: "Śmierć",
        description: "Koniec i nowy początek. Puść to, co już nie służy.",
        color: .black,
        image: "m13",
        interpretations: CardInterpretations(
            general: "Nie bój się tej karty! Śmierć oznacza transformację. Coś się kończy, by mogło zacząć się coś nowego i lepszego. Puść przeszłość.",
            past: "W przeszłości przeżyłeś wielki koniec — relacji, pracy lub etapu życia. To było bolesne, ale otworzyło drzwi do tego, gdzie jesteś teraz.",
            present: "Coś w Twoim życiu właśnie się kończy. Nie trzymaj się tego kurczowo. Pozwól odejść temu, co już nie służy Twojemu rozwojowi.",
            future: "Przed Tobą wielka transformacja. Stary rozdział się zamknie, a nowy otworzy. To będzie bolesne, ale konieczne i piękne."
        )
    ),
    
    // 14 - Umiar
    TarotCard(
        name: "Umiar",
        description: "Równowaga i harmonia. Znajdź złoty środek.",
        color: .mint,
        image: "m14",
        interpretations: CardInterpretations(
            general: "Dziś szukaj równowagi we wszystkim. Nie za dużo, nie za mało. Złoty środek jest kluczem do harmonii i spokoju.",
            past: "W przeszłości nauczyłeś się, że skrajności prowadzą donikąd. Lekcja umiaru i cierpliwości ukształtowała Twoje podejście do życia.",
            present: "Teraz potrzebujesz harmonii. Połącz przeciwieństwa — pracę z odpoczynkiem, logikę z intuicją. Balans jest Twoim sprzymierzeńcem.",
            future: "Przed Tobą okres spokoju i harmonii. Po burzliwym czasie nadchodzi równowaga. Ciesz się tym spokojem."
        )
    ),
    
    // 15 - Diabeł
    TarotCard(
        name: "Diabeł",
        description: "Uwolnij się z łańcuchów. Nie daj się zniewolić!",
        color: .red,
        image: "m15",
        interpretations: CardInterpretations(
            general: "Dziś spójrz prawdzie w oczy. Co Cię zniewala? Nałóg, toksyczna relacja, strach? Masz moc, by się uwolnić. Łańcuchy są tylko w Twojej głowie.",
            past: "W przeszłości byłeś zniewolony przez coś — uzależnienie, relację lub przekonanie. Ta niewola nauczyła Cię, czym jest prawdziwa wolność.",
            present: "Teraz coś lub ktoś ma nad Tobą zbyt dużą władzę. Uświadom sobie to. Pierwszy krok do wolności to uznanie, że jesteś zniewolony.",
            future: "Przed Tobą pokusa lub wyzwanie. Coś będzie Cię ciągnąć w złym kierunku. Bądź świadomy — masz wybór i siłę, by powiedzieć 'nie'."
        )
    ),
    
    // 16 - Wieża
    TarotCard(
        name: "Wieża",
        description: "Nagłe zmiany i przełom. Ze zniszczenia rodzi się nowe.",
        color: .gray,
        image: "m16",
        interpretations: CardInterpretations(
            general: "Przygotuj się na wstrząs. Coś, co wydawało się stabilne, może się zawalić. Ale nie panikuj — ze zniszczenia rodzi się coś prawdziwego i trwałego.",
            past: "W przeszłości coś się nagle zawaliło — plany, relacja, praca. To było szokujące, ale teraz widzisz, że to było potrzebne.",
            present: "Teraz czujesz, że grunt ucieka Ci spod nóg. Pozwól temu, co fałszywe, się rozpaść. Tylko prawda przetrwa.",
            future: "Nadchodzi nagła zmiana. Będzie szokująca, ale oczyszczająca. To, co się zawali, nie było zbudowane na solidnych fundamentach."
        )
    ),
    
    // 17 - Gwiazda
    TarotCard(
        name: "Gwiazda",
        description: "Nadzieja i inspiracja. Twoje marzenia są w zasięgu ręki.",
        color: .cyan,
        image: "m17",
        interpretations: CardInterpretations(
            general: "Dziś gwiazdy świecą dla Ciebie. To dzień nadziei, inspiracji i wiary. Twoje marzenia nie są głupie — są drogowskazem. Podążaj za nimi.",
            past: "W przeszłości miałeś moment czystej nadziei — marzenie, które Cię napędzało. Ta iskra wciąż w Tobie płonie, nawet jeśli o niej zapomniałeś.",
            present: "Teraz otacza Cię nadzieja i jasność. Po trudnym okresie wreszcie widzisz światło. Ufaj temu uczuciu — prowadzi Cię we właściwym kierunku.",
            future: "Przed Tobą piękny okres. Twoje marzenia zaczną się spełniać. Nadzieja, którą czujesz, nie jest złudna — jest proroctwem."
        )
    ),
    
    // 18 - Księżyc
    TarotCard(
        name: "Księżyc",
        description: "Iluzje i lęki. Nie wszystko jest takie, jak się wydaje.",
        color: .indigo,
        image: "m18",
        interpretations: CardInterpretations(
            general: "Dziś uważaj na iluzje. Nie wszystko jest takie, jak się wydaje. Twoje lęki mogą wyolbrzymiać problemy. Odróżnij prawdę od wyobraźni.",
            past: "W przeszłości dałeś się zwieść iluzji. Coś lub ktoś nie był tym, za kogo się podawał. Ta lekcja nauczyła Cię ostrożności.",
            present: "Teraz otaczają Cię wątpliwości i niejasności. Nie podejmuj ważnych decyzji — poczekaj, aż mgła opadnie.",
            future: "Przed Tobą okres niepewności. Nie wszystko będzie jasne. Zaufaj intuicji, ale weryfikuj fakty. Prawda objawi się z czasem."
        )
    ),
    
    // 19 - Słońce
    TarotCard(
        name: "Słońce",
        description: "Radość i sukces. Ciepło i światło wypełniają twoje życie!",
        color: .yellow,
        image: "m19",
        interpretations: CardInterpretations(
            general: "Dziś jest Twój dzień! Słońce świeci i wszystko idzie po Twojej myśli. Ciesz się życiem, baw się, śmiej. Sukces i radość są Twoje.",
            past: "W przeszłości przeżyłeś moment czystego szczęścia. Pamiętasz tę radość? Ona nigdy nie odeszła — jest w Tobie.",
            present: "Teraz otacza Cię ciepło i jasność. Wszystko się układa. Nie sabotuj swojego szczęścia — zasługujesz na nie. Ciesz się!",
            future: "Przed Tobą najlepszy okres od dawna. Sukces, radość, spełnienie — wszystko to nadchodzi. Słońce wschodzi nad Twoim życiem."
        )
    ),
    
    // 20 - Sąd
    TarotCard(
        name: "Sąd",
        description: "Odrodzenie i powołanie. Czas na wielkie przebudzenie!",
        color: .purple,
        image: "m20",
        interpretations: CardInterpretations(
            general: "Dziś usłyszysz wezwanie. Coś w Tobie się budzi — powołanie, cel, misja. Nie ignoruj tego głosu. To czas na przebudzenie.",
            past: "W przeszłości przeżyłeś moment przebudzenia. Coś zmieniło Twoje spojrzenie na życie. Tamto doświadczenie wciąż rezonuje.",
            present: "Teraz stoisz przed sądem — ale sędzią jesteś Ty sam. Czas ocenić swoje życie uczciwie. Co chcesz zmienić? Co chcesz zachować?",
            future: "Wielkie przebudzenie nadchodzi. Odkryjesz swoje prawdziwe powołanie. To będzie moment, który zmieni wszystko."
        )
    ),
    
    // 21 - Świat
    TarotCard(
        name: "Świat",
        description: "Spełnienie i ukończenie. Osiągnąłeś cel podróży!",
        color: .green,
        image: "m21",
        interpretations: CardInterpretations(
            general: "Gratulacje! To najlepsza karta w talii. Cykl się zamyka, cel jest osiągnięty. Ciesz się tym momentem — zasłużyłeś na niego.",
            past: "W przeszłości zakończyłeś ważny etap życia. Osiągnąłeś coś, z czego możesz być dumny. Ta pełnia dała Ci fundament na przyszłość.",
            present: "Teraz jesteś w momencie spełnienia. Wszystko, nad czym pracowałeś, przynosi owoce. Doceń ten moment — nie trwa wiecznie.",
            future: "Przed Tobą spełnienie. Cel, do którego dążysz, zostanie osiągnięty. Cykl się zamknie i otworzy się nowy, jeszcze piękniejszy."
        )
    ),
]
