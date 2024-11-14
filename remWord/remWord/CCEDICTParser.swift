//
//  CCEDICTParser.swift
//  remWord
//
//  Created by Johnny Li on 11/9/24.
//

import Foundation

// Function to parse CC-CEDICT and return a dictionary mapping English words to Chinese translations
func loadCCCEDICT() -> [String: String] {
    var translationDictionary: [String: String] = [:]

    // Locate the CEDICT file in the app bundle
    if let path = Bundle.main.path(forResource: "cedict_ts", ofType: "u8") {
        do {
            let content = try String(contentsOfFile: path, encoding: .utf8)
            let lines = content.components(separatedBy: "\n")

            for line in lines {
                // Skip comment lines or empty lines
                guard !line.isEmpty && !line.hasPrefix("#") else { continue }

                // Match "English [pinyin] /Chinese/"
                if let match = line.range(of: #"\s+\[(.*?)\]\s+/(.*?)/"#, options: .regularExpression) {
                    let english = String(line[..<match.lowerBound]).trimmingCharacters(in: .whitespaces)
                    let chinese = String(line[match.upperBound...]).trimmingCharacters(in: .whitespaces)

                    translationDictionary[english] = chinese
                }
            }
        } catch {
            print("Error loading CEDICT file: \(error)")
        }
    }
    return translationDictionary
}

