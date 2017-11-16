//: Playground - noun: a place where people can play

import Foundation

struct User {
    let username: String
    let displayName: String
}

struct Tweet {
    let user: User
    let createdAt: Date
    let retweetCount: Int
    let favoriteCount: Int
    let body: String
}

struct UserViewModel : CustomStringConvertible {
    private let user: User
    
    init(user: User) {
        self.user = user
    }
    
    var description: String {
        return "\(user.displayName) • \(user.username)"
    }
}

struct TweetViewModel : CustomStringConvertible {
    private let tweet: Tweet
    private let user: UserViewModel
    
    init(tweet: Tweet) {
        self.tweet = tweet
        self.user = UserViewModel(user: tweet.user)
    }
    
    var description: String {
        return """
        \(user)
        \(body)
        \(tweetMetrics)
        """
    }
    
    var tweetMetrics: String {
        return "\(retweets) • \(favorites)"
    }
    
    var retweets: String {
        return pluralize("RT", count: tweet.retweetCount)
    }
    
    var favorites: String {
        return pluralize("fav", count: tweet.favoriteCount)
    }
    
    var body: String {
        return tweet.body
    }
    
    private func pluralize(_ term: String, count: Int) -> String {
        return "\(count) \(term)\(count == 1 ? "" : "s")"
    }
}

let user = User(username: "@groot", displayName: "Groot")
let tweet = Tweet(user: user, createdAt: Date(), retweetCount: 1, favoriteCount: 5, body: "I AM GROOT")

func display(tweet: TweetViewModel) {
    print(tweet)
}

display(tweet: TweetViewModel(tweet: tweet))

