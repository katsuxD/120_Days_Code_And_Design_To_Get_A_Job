void main(){
  print(sum([1,2,3,4]));
}
  double sum(List<double> list){
    var total=0.0;
    for (var i in list){
      total +=i;
    }
    return total;
  }