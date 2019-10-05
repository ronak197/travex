class Attraction {
    final String name;
    final String category;
    final String bestSeason;
    final double rating;
    final String description;
    final double averageCost;
    final String startTime;
    final String endTime;
    final double latitude;
    final double longitude;
    final String imgUrl;

    Attraction(
        {this.name,
            this.bestSeason,
            this.category,
            this.rating,
            this.description,
            this.startTime,
            this.averageCost,
            this.endTime,
            this.longitude,
            this.latitude,
            this.imgUrl});
}
