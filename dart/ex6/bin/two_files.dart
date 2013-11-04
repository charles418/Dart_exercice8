library two_files;

part 'fcns.dart';

/**
 * On place chaque lettre à partir de la fin
 * dans une nouvelle String
 * pour ensuite la tester contre la string originale
 */
ex6_1(word) {
  var reversedWord = "";
  word = word.toLowerCase();
  
  for(var i = word.length - 1; i >= 0; i--){
    reversedWord += word[i];
  }
  
  if(reversedWord == word){
    print("Le mot est un Palindrome");
  }
  else{
    print("Le mot n'est pas un Palindrome");
  }
}

/**
 * On créer deux objet DateTime pour les
 * comparer par la suite.
 */
ex6_2(dateFrom, dateTo) {
  DateTime from = DateTime.parse(dateFrom);
  DateTime to = DateTime.parse(dateTo);
  Duration difference = from.difference(to);
  var jours = difference.inDays;
  print("La différence en jours entre " + dateFrom + " et " + dateTo + " est de " + jours.toString() + " jours.");
}

ex6_3(grade){
    for(var i = 100; i >=0; i--){
    if(grade >= 90){
      return 'A';
    }
    if(grade >= 80){
      return 'B';
    }
    if(grade >= 70){
      return 'C';
    }
    else{
      return 'D';
    }
  }
}

/**
 * On loop sur la liste de nom
 * on determine la longueur et le place
 * dans la bonne liste
 */
ex6_4(){
  var names = ['Anthony', 'Jack', 'Zack', 'Paul', 'Eric', 'Samantha', 'Gertrude', 'Pierre-Paulin'];
  var namesLess8 = [], namesAre8 = [], namesHigher8 = [];
  for(var name in names){
    if(name.length < 8){
      namesLess8.add(name);
    }
    else if(name.length == 8){
      namesAre8.add(name);
    }
    else{
      namesHigher8.add(name);
    }
  }
  print(namesLess8);
  print(namesAre8);
  print(namesHigher8);
}

ex6_5(){

}

void main() {
  ex6_1('Natan');
  ex6_2("2013-01-01", "2013-01-12");
  print(ex6_3(63));
  ex6_4();
  ex6_5();
}
