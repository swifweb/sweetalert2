// swift-tools-version:5.7
import PackageDescription

let package = Package(
    name: "sweetalert2",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .library(name: "SweetAlert", type: .static, targets: ["SweetAlert"])
    ],
    dependencies: [
        .package(url: "https://github.com/swifweb/web", from: "1.0.0-beta.2.0.0")
    ],
    targets: [
        .target(name: "SweetAlert", dependencies: [
            .product(name: "Web", package: "web")
        ], resources: [
            .copy("css/swal-wordpress-admin.css"),
            .copy("css/swal-dark.css"),
            .copy("css/swal-bootstrap-4.css"),
            .copy("css/swal-minimal.css"),
            .copy("css/swal-bulma.css"),
            .copy("css/swal-material-ui.css"),
            .copy("css/swal-borderless.css"),
            .copy("css/swal-default.css"),
            .copy("css"),
            .copy("js/sweetalert2.min.js"),
            .copy("js"),
        ]),
        .testTarget(name: "SweetAlertTests", dependencies: ["SweetAlert"])
    ]
)
