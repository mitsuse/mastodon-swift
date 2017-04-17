// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "Mastodon",
    targets: [
        Target(name: "Mastodon"),
        Target(
            name: "mammut",
            dependencies: [
                .Target(name: "Mastodon"),
            ]
        ),
    ],
    dependencies: [
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
    ]
)
