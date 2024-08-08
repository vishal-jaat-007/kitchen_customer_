class SubscriptionCategeroyModel {
  int id;
  String title;
  double price;
  double totalprice;
  int days;
 
  String time;
  SubscriptionCategeroyModel(
      this.id, this.title, this.price, this.totalprice, this.days,this.time);
}

var SubscriptionCategeroyModeldata = [
  SubscriptionCategeroyModel(1, "Weekly Meal Plan ", 40, 350, 7,"06-07-24"),
  SubscriptionCategeroyModel(2, "15 days Meal Plan ", 80, 1200, 15,"06-07-24"),
  SubscriptionCategeroyModel(3, "1 Month Meal  Plan ", 120, 3600, 30,"06-07-24"),
];
