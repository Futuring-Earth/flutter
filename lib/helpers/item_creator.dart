//Used as a paramater in the functions so the parent function (who
//knows the variable type) can pass the constructor to the variable.
//This is necessary because dart handles generics a bit
//different and it's not possible to declare a new generic variable
// by just using 'new T()'
typedef S ItemCreator<S>(Map<String, dynamic> values);
