void main() {
  var restaurants = [
    {
      'name': 'kteam',
      'cuisine': 'vietnamese',
      'ratings': [4.0, 3.5, 4.5],
    },
    {
      'name': 'kquiz',
      'cuisine': 'vigga',
      'ratings': [5.0, 4.5, 4.0],
    },
    {
      'name': 'kter',
      'cuisine': 'vietkieu',
      'ratings': [4.0, 4.5, 4.0],
    },
  ];
  for (var restau in restaurants){
    final ratings = restau['ratings'] as List<double>;
    var total = 0.0;
    for (var rate in ratings){
      total += rate; 
    }
    final avgRate = total / ratings.length;
    restau['avgRatings'] = avgRate;
    print(restau);
  }
  //print(avgRate);
}
