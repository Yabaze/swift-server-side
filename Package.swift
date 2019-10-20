// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let versions =  "3.0.0"
let urls = [
    "https://github.com/PerfectlySoft/Perfect-HTTPServer.git",
    "https://github.com/PerfectlySoft/Perfect-FastCGI.git",
    "https://github.com/PerfectlySoft/Perfect-CURL.git",
    "https://github.com/PerfectlySoft/Perfect-PostgreSQL.git",
    "https://github.com/PerfectlySoft/Perfect-SQLite.git",
    "https://github.com/PerfectlySoft/Perfect-Redis.git",
    "https://github.com/PerfectlySoft/Perfect-MySQL.git",
    "https://github.com/PerfectlySoft/Perfect-MongoDB.git",
    "https://github.com/PerfectlySoft/Perfect-WebSockets.git",
    "https://github.com/PerfectlySoft/Perfect-Notifications.git",
    "https://github.com/PerfectlySoft/Perfect-Mustache.git"
]
 
let package = Package(
    name: "sample",
    //dependencies: urls.map { .package(url: $0, majorVersion:versions) }, targets: []

    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: urls[0], from: "3.0.0"),
        
        .package(url: urls[1], from: "3.0.0"),
        
        .package(url: urls[2], from: "3.0.0"),
        
        .package(url: urls[3], from: "3.0.0"),
        
        .package(url: urls[4], from: "3.0.0"),
        
        .package(url: urls[5], from: "3.0.0"),
        
        .package(url: urls[6], from: "3.0.0"),
        
        .package(url: urls[7], from: "3.0.0"),
        
        .package(url: urls[8], from: "3.0.0"),
        
        .package(url: urls[9], from: "3.0.0"),
        
        .package(url: urls[10], from: "3.0.0"),
                    
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "sample",
            dependencies: ["PerfectHTTPServer","PerfectMustache"]),
    ]
)
