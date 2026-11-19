// fonction qui retourne la somme d'une liste d'entiers
int somme(List<int> nombres) {
  return nombres.fold(0, (total, nombre) => total + nombre);
}
