// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "FormulaExMachina",
    platforms: [.macOS(.v15)],
    products: [
        .executable(name: "FormulaExMachina", targets: ["FormulaExMachina"]),
        .library(name: "FormulaEngine", targets: ["FormulaEngine"]),
        .library(name: "FormulaExMachinaKit", targets: ["FormulaExMachinaKit"]),
    ],
    targets: [
        // Pure mathematical AST, solver, parser, unit converter
        .target(
            name: "FormulaEngine",
            dependencies: []
        ),
        // Domain models, catalog database, search index
        .target(
            name: "FormulaExMachinaKit",
            dependencies: ["FormulaEngine"]
        ),
        // Native macOS SwiftUI Application
        .executableTarget(
            name: "FormulaExMachina",
            dependencies: [
                "FormulaExMachinaKit",
                "FormulaEngine"
            ],
            swiftSettings: [
                .defaultIsolation(MainActor.self)
            ]
        ),
        // Tests
        .testTarget(
            name: "FormulaEngineTests",
            dependencies: ["FormulaEngine"]
        ),
        .testTarget(
            name: "FormulaExMachinaKitTests",
            dependencies: ["FormulaExMachinaKit"]
        ),
    ]
)
