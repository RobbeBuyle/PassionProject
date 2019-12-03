class User {
  final int id;
  final String name;
  final String imageUrl;
  final String email;
  final int statsNotes;
  final int statsSaves;
  final int statsChecks;

  User(
      {this.id,
      this.name,
      this.imageUrl,
      this.email,
      this.statsNotes,
      this.statsSaves,
      this.statsChecks});
}

final User currentUser = User(
    id: 0,
    name: 'Myriam.dietchy',
    imageUrl: 'assets/images/myriam.jpg',
    email: 'myriam.dietchy@yahoo.com',
    statsNotes: 34,
    statsSaves: 112,
    statsChecks: 248);
