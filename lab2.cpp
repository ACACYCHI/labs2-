#include "stdafx.h"
#include <iostream>
#include <string>
#include <vector>

using namespace std;
class Addres{
private:
	int index, home;
	string city, street;
public:
	void setter(int index, string city, string street, int home){
		this->index = index;
		this->city = city;
		this->street = street;
		this->home = home;

	}
	void getter(){
		cout << "index: " << index << " city: " << city << " street: " << street << " home: " << home;
	}

	Addres(){}

};

void Menu(int &point){
	system("cls");
	cout << "1.Add address" << endl;
	cout << "2.change address" << endl;
	cout << "3.delete address" << endl;
	cout << "4.show address" << endl;
	cin >> point;
}


void Menu2(int &punkt){
	system("cls");
	cout << "select whats you'll change" << endl;
	cout << "1.index" << endl;
	cout << "2.city" << endl;
	cout << "3.street" << endl;
	cout << "4.home" << endl;
	cin >> punkt;

}


void Add(int &id, vector<Addres*> &DB),
	Change(int &punkt);
int _tmain(int argc, _TCHAR* argv[])
{
	int point, punkt, id=0;
	vector<Addres*> DB;

	//Addres; Addres *add = new Addres;
	Menu(point);
	while (point > 0 && point < 5){
		switch (point)
		{
		case 1:
			Add(id, DB);
			Menu(point);
			break;
		case 2:
			Change(punkt);
			Menu(point);
			break;
		/*case 3:
			//
			Menu(point);
			break;*/
		case 4:
			for (int i = 0; i < id+1; i++){
				cout << DB.at(i) << "\t";
				if (i % 3 == 0 && i != 0)
					cout << endl;
			}
			system("pause");
			Menu(point);
			break;
		}
	}
	return 0;
}

void Change(int &punkt){
	Menu2(punkt);
	while (punkt > 0 && punkt < 5){
		switch (punkt)
		{
		case 1:
			//
			Menu2(punkt);
			break;
		case 2:
			//
			Menu2(punkt);
			break;
		case 3:
			//
			Menu2(punkt);
			break;
		case 4:
			//
			Menu2(punkt);
			break;
		}
	}
}

void Add(int &id, vector<Addres*> &DB){
	int index, home;
	string city, street;

	cout << "1.index" << endl; cin >> index;
	cout << "2.city" << endl; cin >> city;
	cout << "3.street" << endl; cin >> street;
	cout << "4.home" << endl; cin >> home;
	
	Addres *add = new Addres;
	add->setter(index, city, street, home);
	id++;
	//DB.push_back(add);
}
