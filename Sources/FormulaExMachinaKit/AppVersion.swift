// Generated automatically by tools/bump_version.sh
// DO NOT EDIT MANUALLY
import Foundation

public enum AppVersion: Sendable {
    public static let version = "1.1.1"
    public static let build = "202611221950"
    public static let buildMonth = "2026.11"
    
    public static var displayString: String {
        "v\(version)"
    }
    
    public static var fullDescription: String {
        "\(version) (SonnerStudio Build \(buildMonth))"
    }
}
