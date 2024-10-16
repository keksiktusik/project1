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

    void addToStart(int value) {
        Node* newNode = new Node(value);
        if (!head) {
            head = tail = newNode;
        } else {
            newNode->next = head;
            head->prev = newNode;
            head = newNode;
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

    //Testowanie dodania elementu na poczatek
    list.addToStart(10);
    list.addToStart(20);
    int commit;
    cout<<"pierwszy commit"<<endl;
    cin>>commit;

    return 0;

}