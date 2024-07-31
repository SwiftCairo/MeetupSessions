// to run: `swift parser.swift coverage.json`
import Foundation


class Parser {
    func parse(_ fileName: String) {
        guard let contents = readFile(fileName) else {
            print("Could not parse coverage structure from \(fileName)")
            return
        }
        let decoder = JSONDecoder()

        do {
            let coverage = try decoder.decode(Coverage.self, from: contents)
            printCoverage(coverage)
        } catch {
            print("Error: \(error)")
        }
    }

    private func readFile(_ fileName: String) -> Data? {
        let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
        guard let fileURL = URL(string: fileName, relativeTo: currentDirectoryURL) else {
            print("file not found: \(currentDirectoryURL.path)/\(fileName)")
            return Data()
        }
        do {
            return try String(contentsOf: fileURL).data(using: .utf8)
        } catch {
            print("Error: \(error)")
            return Data()
        }
    }

    private func printCoverage(_ coverage: Coverage) {

        let nonTestTargets = coverage.targets.filter { target in
            return !target.name.contains(".xctest")
        }

        let nonPodsTargets = nonTestTargets.filter { target in
            return target.files.filter { file in
                return file.path.contains("/Pods/")
            }.count == 0
        }

//        let maxLength = nonPodsTargets.reduce(0) { max($0, $1.name.count) }
//        let title = "Total coverage"

//        print(String(format: "%@: %.3f%%", title.padding(toLength: maxLength, withPad: " ", startingAt: 0), coverage.lineCoverage * 100))
        nonPodsTargets
            .sorted { $0.lineCoverage > $1.lineCoverage }
            .forEach { print("\(Int($0.lineCoverage * 100))") }
//            .forEach { print(String(format: " %@: %.3f%%", $0.name.padding(toLength: maxLength, withPad: " ", startingAt: 0), $0.lineCoverage * 100)) }

    }
}

struct Coverage: Coverable {
    let executableLines: Int
    let coveredLines: Int
    let lineCoverage: Double

    let targets: [Target]
}

struct Target: NamedCoverable {
    let name: String
    let executableLines: Int
    let coveredLines: Int
    let lineCoverage: Double

    let buildProductPath: String
    let files: [File]
}

struct File: NamedCoverable {
    let name: String
    let executableLines: Int
    let coveredLines: Int
    let lineCoverage: Double

    let path: String
    let functions: [Function]
}

struct Function: NamedCoverable {
    let name: String
    let executableLines: Int
    let coveredLines: Int
    let lineCoverage: Double

    let lineNumber: Int
    let executionCount: Int
}

protocol Coverable: Decodable {
    var executableLines: Int { get }
    var coveredLines: Int { get }
    var lineCoverage: Double { get }
}

protocol NamedCoverable: Coverable {
    var name: String { get }
}

if CommandLine.arguments.count > 1 {
    let fileName = CommandLine.arguments[1]
    let parser = Parser()
    parser.parse(fileName)
} else {
    print("Please specify a filename as a command line argument")
}
