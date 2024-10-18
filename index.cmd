/**
 * @file doubly_linked_list.cpp
 * @brief Implementacja dwukierunkowej listy wiązanej w C++.
 * 
 * Ta klasa reprezentuje dwukierunkową listę wiązaną i implementuje podstawowe operacje
 * takie jak dodanie elementu na początek oraz inne funkcje (do rozwinięcia w pełnej wersji).
 */
#include <iostream>
using namespace std;


/**
 * @class DoublyLinkedList
 * @brief Klasa reprezentująca dwukierunkową listę wiązaną.
 * 
 * Ta klasa przechowuje węzły listy, umożliwia dodawanie elementów na początek,
 * oraz w pełnej wersji będzie zawierała więcej funkcji operujących na liście.
 */

class DoublyLinkedList {
private:

  /**
     * @struct Node
     * @brief Struktura reprezentująca węzeł listy.
     * 
     * Każdy węzeł przechowuje dane (data) oraz wskaźniki na poprzedni (prev)
     * i następny (next) element listy.
     */

    struct Node {
        int data;
        Node* next;
        Node* prev;

        /**
         * @brief Konstruktor tworzący nowy węzeł z daną wartością.
         * @param value Wartość do przechowania w węźle.
         */


        Node(int value) : data(value), next(nullptr), prev(nullptr) {}
    }

    Node* head;
    Node* tail;

public:
 
 /**
     * @brief Konstruktor domyślny, inicjuje pustą listę.
     */
    DoublyLinkedList() : head(nullptr), tail(nullptr) {}
 /**
     * @brief Dodanie elementu na początek listy.
     * 
     * Tworzy nowy węzeł i umieszcza go na początku listy. Jeśli lista była pusta, 
     * nowy węzeł staje się zarówno początkiem, jak i końcem listy.
     * 
     * @param value Wartość elementu do dodania na początek listy.
     */

      void addToStart(int value);

    /**
     * @brief Dodanie elementu na koniec listy.
     * 
     * Tworzy nowy węzeł i umieszcza go na końcu listy. Jeśli lista była pusta, 
     * nowy węzeł staje się zarówno początkiem, jak i końcem listy.
     * 
     * @param value Wartość elementu do dodania na koniec listy.
     */
    void addToEnd(int value);

    /**
     * @brief Dodanie elementu pod wskazany indeks.
     * 
     * Dodaje nowy węzeł do listy na wskazanym indeksie. Jeśli indeks jest równy 0,
     * element jest dodawany na początek. Jeśli indeks przekracza długość listy,
     * element jest dodawany na koniec.
     * 
     * @param index Indeks, pod który ma być dodany nowy element.
     * @param value Wartość elementu do dodania.
     */
    void addAtIndex(int index, int value);

    /**
     * @brief Usunięcie elementu z początku listy.
     * 
     * Usuwa pierwszy element z listy, jeśli lista nie jest pusta.
     */
    void removeFromStart();

    /**
     * @brief Usunięcie elementu z końca listy.
     * 
     * Usuwa ostatni element z listy, jeśli lista nie jest pusta.
     */
    void removeFromEnd();

    /**
     * @brief Usunięcie elementu pod wskazanym indeksem.
     * 
     * Usuwa węzeł z listy znajdujący się pod podanym indeksem. Jeśli indeks jest 0,
     * usuwa pierwszy element. Jeśli indeks przekracza długość listy, operacja jest ignorowana.
     * 
     * @param index Indeks węzła do usunięcia.
     */
    void removeAtIndex(int index);

    /**
     * @brief Wyświetlenie całej listy.
     * 
     * Przechodzi przez listę od początku do końca i wyświetla dane każdego węzła.
     */
    void display();

    /**
     * @brief Wyświetlenie listy w odwrotnej kolejności.
     * 
     * Przechodzi przez listę od końca do początku i wyświetla dane każdego węzła.
     */
    void displayReverse();

    /**
     * @brief Wyświetlenie następnego elementu.
     * 
     * Wyświetla wartość następnego elementu po podanym węźle.
     * 
     * @param current Wskaźnik do bieżącego węzła.
     */
    void displayNext(Node* current);

    /**
     * @brief Wyświetlenie poprzedniego elementu.
     * 
     * Wyświetla wartość poprzedniego elementu przed podanym węzłem.
     * 
     * @param current Wskaźnik do bieżącego węzła.
     */
    void displayPrevious(Node* current);

    /**
     * @brief Czyszczenie całej listy.
     * 
     * Usuwa wszystkie elementy z listy, zwalniając pamięć.
     */
    void clear();
};

    void DoublyLinkedList::void addToStart(int value) {
        Node* newNode = new Node(value);
        if (!head) {
            head = tail = newNode;
        } else {
            newNode->next = head;
            head->prev = newNode;
            head = newNode;
        }
    }

    void DoublyLinkedList::void addToEnd(int value) {
        Node* newNode = new Node(value);
        if (!tail) {
            head = tail = newNode;
        } else {
            tail->next = newNode;
            newNode->prev = tail;
            tail = newNode;
        }
    }
    void DoublyLinkedList::addAtIndex(int index, int value) {
    if (index <= 0) {
        addToStart(value);
        return;
    }

    Node* current = head;
    int count = 0;

    while (current && count < index) {
        current = current->next;
        count++;
    }

    if (!current) {
        addToEnd(value);
    } else {
        Node* newNode = new Node(value);
        newNode->prev = current->prev;
        newNode->next = current;
        if (current->prev) {
            current->prev->next = newNode;
        }
        current->prev = newNode;
        if (current == head) {
            head = newNode;
        }
    }
}

void DoublyLinkedList::removeFromStart() {
    if (!head) return;
    Node* temp = head;
    head = head->next;
    if (head) {
        head->prev = nullptr;
    } else {
        tail = nullptr;
    }
    delete temp;
}

void DoublyLinkedList::removeFromEnd() {
    if (!tail) return;
    Node* temp = tail;
    tail = tail->prev;
    if (tail) {
        tail->next = nullptr;
    } else {
        head = nullptr;
    }
    delete temp;
}

void DoublyLinkedList::removeAtIndex(int index) {
    if (index < 0 || !head) return;
    if (index == 0) {
        removeFromStart();
        return;
    }

    Node* current = head;
    int count = 0;

    while (current && count < index) {
        current = current->next;
        count++;
    }

    if (current) {
        if (current->prev) {
            current->prev->next = current->next;
        }
        if (current->next) {
            current->next->prev = current->prev;
        }
        if (current == head) {
            head = current->next;
        }
        if (current == tail) {
            tail = current->prev;
        }
        delete current;
    }
}

void DoublyLinkedList::display() {
    Node* current = head;
    while (current) {
        cout << current->data << " ";
        current = current->next;
    }
    cout << endl;
}

void DoublyLinkedList::displayReverse() {
    Node* current = tail;
    while (current) {
        cout << current->data << " ";
        current = current->prev;
    }
    cout << endl;
}

void DoublyLinkedList::displayNext(Node* current) {
    if (current && current->next) {
        cout << current->next->data << endl;
    }
}

void DoublyLinkedList::displayPrevious(Node* current) {
    if (current && current->prev) {
        cout << current->prev->data << endl;
    }
}

void DoublyLinkedList::clear() {
    while (head) {
        removeFromStart();
    }
}

};
    /**
 * @brief Funkcja główna programu.
 * 
 * Testowanie podstawowych operacji na liście, takich jak dodanie elementu.
 * 
 * @return Zwraca 0, jeśli program zakończył się poprawnie.
 */

int main(){
    DoublyLinkedList list;

    list.addToStart(9);
    list.addToStart(5);
    list.addToEnd(1);
     list.addAtIndex(2, 8);
    // Wyświetlenie listy
    list.display();

    // Wyświetlenie listy w odwrotnej kolejności
    list.displayReverse();

    // Usunięcie elementu z początku
    list.removeFromStart();
    list.display();

    // Usunięcie elementu z końca
    list.removeFromEnd();
    list.display();

    // Usunięcie elementu z indeksu 1
    list.removeAtIndex(1);
    list.display();

    // Czyszczenie listy
    list.clear();
    list.display();

    return 0;
    testuje cofanie commitów bo mi nie wyszlo wcześniej :<
}