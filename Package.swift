// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "Mastodon",
    dependencies: [
        .Package(
            url: "https://github.com/antitypical/Result.git",
            majorVersion: 3,
            minor: 2
        ),
        .Package(
            url: "https://github.com/ikesyo/Himotoki.git",
            majorVersion: 3,
            minor: 0
        ),
        .Package(
            url: "https://github.com/ishkawa/APIKit.git",
            majorVersion: 3,
            minor: 1
        ),
        .Package(
            url: "https://github.com/ReactiveX/RxSwift.git",
            majorVersion: 3,
            minor: 4
        ),
    ]
)
