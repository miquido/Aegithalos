// swift-tools-version:5.2
import PackageDescription

let package = Package(
  name: "Aegithalos",
  platforms: [
    .iOS(.v12), .macOS(.v10_13), .tvOS(.v11),
  ],
  products: [
    .library(
      name: "Aegithalos",
      targets: ["Aegithalos"]
    ),
    .library(
      name: "AegithalosCocoa",
      targets: ["AegithalosCocoa"]
    ),
  ],

  dependencies: [],
  targets: [
    .target(
      name: "Aegithalos",
      dependencies: []
    ),
    .testTarget(
      name: "AegithalosTests",
      dependencies: ["Aegithalos"]
    ),
    .target(
      name: "AegithalosCocoa",
      dependencies: ["Aegithalos"]
    ),
  ]
)
