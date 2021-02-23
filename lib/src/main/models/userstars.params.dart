class UserStarsParams {
  String user;

  UserStarsParams(this.user);

  String toJson() => """{
    user(login: "${this.user}") {
      name
      avatarUrl(size: 250)
      login
      bioHTML
      url
      email
      location
      starredRepositories {
        totalCount
        nodes {
          name
          stargazerCount
          url
          updatedAt
          forkCount
          description
        }
      }
    }
  }""";
}
