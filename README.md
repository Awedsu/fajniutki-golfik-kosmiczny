# Fajniutki Kosmiczny Golf

Projekt edukacyjno-symulacyjny stworzony w silniku **Godot Engine 4.6.2**, skupiający się na odtworzeniu realnych zjawisk fizycznych związanych z astrodynamiką i grawitacją w przestrzeni kosmicznej. Gracz kontroluje trajektorię lotu rakiety (lub całej floty), manipulując siłą ciągu oraz wykorzystując oddziaływanie grawitacyjne ciał niebieskich, aby bezpiecznie zadokować w stacji orbitalnej.

---

## Kluczowe Funkcje i Mechaniki Fizyczne

Gra realizuje zaawansowane koncepcje fizyczne i architektoniczne, eliminując typowe flopy projektowe na rzecz czystego kodu i stabilnej mechaniki:

1. **Symulacja Grawitacyjna (Studnie Grawitacyjne):** Obiekty posiadają zdefiniowaną masę i oddziałują na rakietę zgodnie z prawem powszechnego ciążenia, dynamicznie modyfikując jej wektor przyspieszenia w czasie rzeczywistym.
2. **Asysta Grawitacyjna (Manewr Voyagera):** Poziomy demonstracyjne uczą precyzyjnego wykorzystania grawitacji planet do zakrzywiania trajektorii i zyskiwania dodatkowego pędu (Thrust Boost).
3. **Punkty Lagrange'a:** Poziomy odwzorowujące strefy równowagi sił grawitacyjnych, gdzie przyciąganie dwóch ciał o identycznej masie idealnie się znosi, umożliwiając lot po prostej linii.
4. **Złudzenie Masy (Pułapki Grawitacyjne):** Implementacja ciał niebieskich o ekstremalnej gęstości, które mimo małych rozmiarów wizualnych posiadają olbrzymią masę.
5. **System Zarządzania Flotą:** Poziomy wymagające jednoczesnego doprowadzenia wielu rakiet do celu. Stacja orbitalna dynamicznie zlicza żywe instancje z grupy obiektów i aktywuje sekwencję wygranej dopiero po zadokowaniu ostatniej jednostki.
6. **Zaawansowana Izolacja Kolizji:** Wykorzystanie masek i warstw fizycznych (Collision Layers & Masks) w celu uzyskania tzw. *Ghost Mode* – rakiety mogą przenikać przez siebie nawzajem, jednocześnie bezbłędnie reagując na planety, bariery oraz stację docelową.

---

## Sterowanie i Interfejs (Quality of Life)

* **Myszka:** Celowanie oraz dynamiczne ładowanie siły wystrzału (w trybie procy) wraz z wizualnym podglądem na elemencie `ProgressBar`.
* **Klawisz [R]:** Natychmiastowy reset poziomu (`reload_current_scene`). Implementacja oparta na `_unhandled_input` gwarantuje, że akcja działa w dowolnym momencie lotu oraz nie jest blokowana przez warstwę GUI.
* **Menu Poziomów:** Trzykolumnowy, w pełni responsywny interfejs oparty na strukturze `HBoxContainer` i `VBoxContainer` wykorzystujący mechanizm flag wielkościowych (`Expand` & `Fill`), eliminujący sztywne pozycjonowanie pikseli.
* **Dynamiczne Główne Menu:** System generowania losowego tła (80% szans na rakietę, 20% na UFO) z pełną synchronizacją wektorów obrotu wzdłuż ścieżki lotu `Tween`.

---

## Technologie i Architektura

* **Silnik:** Godot Engine 4.6.2
* **Język skryptowy:** GDScript
* **Główne Węzły:** `CharacterBody2D` (Rakieta), `StaticBody2D` (Planety/Bariery), `Area2D` (Stacja), `Control` (Dynamiczne GUI / Kontenery).

---

## Instalacja i Uruchomienie

1. Sklonuj repozytorium:
   > git clone https://github.com/Awedsu/orbital-gravity-simulator.git

2. Otwórz program **Fajniutki Kosmiczny Golf.exe**.

---
*Projekt stworzony z pasją do fizyki i czystej architektury kodu.*
