library two_files;
import "dart:math";

part 'fcns.dart';

/**
 * Selon une liste de noms, verbes et adverbes
 * on créer des phrases au hasard
 */
ex8_1() {
  var nouns = ['Paul', 'Gertrude', 'Alain', 'Claude'];
  var verbs = ['joue', 'appel', 'marche', 'mange'];
  var adverbs = ['lentement', 'courageusement', 'patiemment', 'prudemment'];
  final _random = new Random(); // objet qui va servir à sélectionner de manière random un element dans une liste
  
  for(var i = 0; i < 4; i++){
    var noun = nouns[_random.nextInt(nouns.length)];
    var verb = verbs[_random.nextInt(verbs.length)];
    var adverb = adverbs[_random.nextInt(adverbs.length)];
    var phrase = noun + " " + verb + " " + adverb + ".";
    print(phrase);
  }
  
}

/**
 * On loop sur tous les noms pour trouver celui dont la première
 * lettre est comme la lettre passée en paramètre
 */
ex8_2(var firstLetter) {
  var associations = [
              {"name": "IS", "description": "Information Systems", "members": 
                [{"firstName": "Dzenan", "lastName": "Ridjanovic", "email": "dr@gmail.com"},
                 {"firstName": "Robert", "lastName": "Nelson", "email": "rn@gmail.com"}]},
                 {"name": "CS", "description": "Computer Science",  "members": 
                   [{"firstName": "David", "lastName": "Curtis", "email": "dc@gmail.com"}]}
                 ];
  for(var asso in associations){
    for(var member in asso['members']){
      var lastName = member['lastName'];
      if(lastName[0] == firstLetter){
        print(member['firstName'] + " " + member['lastName']);
      }
    }
  }
  
}

/**
 * Création d'un model member/associations
 */
ex8_3()
{
  var model = new Model();
  model.ajouterAssociation("IS", "Information Systems");
  model.ajouterAssociation("CS", "Computer Science");
  model.ajouterMembre("Ridjanovic", "Dzenan", "dr@gmail.com");
  model.ajouterMembre("Nelson", "Robert", "rn@gmail.com");
  model.ajouterMembre("Curtis", "David", "dc@gmail.com");
  
  print(model.getMembres());
  model.modifierMembre(1, 'Mathieu', 'Poulin', 'np@gmail.com');
  print(model.getMembres());
  
  print(model.getAssos());
  model.modifierAssos(0, 'CA', 'Comptables agréés');
  print(model.getAssos());
  
  model.supprimerAssos(0);
  print(model.getAssos());
  
  model.supprimerMembre(0);
  print(model.getMembres());
}

/**
 * Classe model qui représente
 * la liste des membres
 * et la liste des associations
 */
class Model {
  List members = [];
  List associations = [];

  /**
   * Constructeur
   */
  Model() {}
  
  void ajouterMembre(var nom, var prenom, var email){
    var map = new Map();
    map['lastName'] = nom;
    map['firstName'] = prenom;
    map['email'] = email;
    this.members.add(map);
  }
  
  void ajouterAssociation(var nom, var description){
    var map = new Map();
    map['name'] = nom;
    map['description'] = description;
    this.associations.add(map);
  }
  
  void modifierMembre(var no, var nom, var prenom, var courriel){
    var membre = this.members[no];
    membre['lastName'] = nom;
    membre['firstName'] = prenom;
    membre['email'] = courriel;
  }
  
  void modifierAssos(var no, var nom, var description){
    var assos = this.associations[no];
    assos['name'] = nom;
    assos['description'] = description;
  }
  
  void supprimerMembre(var no){
    this.members.removeAt(no);
  }
  
  void supprimerAssos(var no){
    this.associations.removeAt(no);
  }
  
  List getAssos(){
    return this.associations;
  }
  
  List getMembres(){
    return this.members;
  }
  
}


ex8_4(){
  var matrix = [
                [1,0,1,1,1,0,0,0],
                [1,0,1,1,0,0,0,1]
                ];
  var matrixBool = [
                [false,false,false,false,false,false,false,false],
                [false,false,false,false,false,false,false,false]
                    ];
  var rows = matrix.length;
  var columns = matrix[0].length;
  
  trouverGroupes(matrix, matrixBool, 0, 0);
  
}

void trouverGroupes(var matrix, var matrixBool , int i, int j) {
  
  if(i >= 0 && i < matrix.length && j >=0 && j < matrix[0].length
      && matrixBool[i][j] != true && matrix[i][j] != 0) {
    
    matrixBool[i][j] = true;
    
    trouverGroupes(matrix, matrixBool, i-1, j);
    trouverGroupes(matrix, matrixBool, i+1, j);
    
    trouverGroupes(matrix, matrixBool, i, j-1);
    trouverGroupes(matrix, matrixBool, i, j+1);
    
    trouverGroupes(matrix, matrixBool, i+1, j+1);
    trouverGroupes(matrix, matrixBool, i-1, j-1);
    
    trouverGroupes(matrix, matrixBool, i+1, j-1);
    trouverGroupes(matrix, matrixBool, i-1, j+1);
    
    print("Hit!");
  }
}

ex8_5(){
  
}

void main() {
  ex8_1();
  ex8_2('R');
  ex8_3();
  ex8_4();
  ex8_5();
}
