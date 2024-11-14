//
//  Rem_modeView.swift
//  remWord
//
//  Created by Johnny Li on 11/3/24.
//

import Foundation
import SwiftUICore
import SwiftData
import SwiftUI

struct Rem_modeView: View
{
    @Binding var strings: [String]
    @State private var newStrings: [String]
    @State private var currentIndex: Int = 0
    @State private var translationDictionary: [String: String] = [:]
    @State private var translatedText: String = "Translating..."
    
    init(strings: Binding<[String]>)
    {
            self._strings = strings
            self._newStrings = State(initialValue: strings.wrappedValue)
    }
    var body: some View
    {
        VStack
        {
            if !newStrings.isEmpty && currentIndex < newStrings.count
            {
                let currentString = newStrings[currentIndex]
                let translatedText = translationDictionary[currentString] ?? "Translation not found"
                
                VStack
                {
                    Text(currentString)
                        .font(.largeTitle)
                        .padding()
                    Text(translatedText) // Show the translated text
                        .font(.title2)
                        .foregroundColor(.gray)
                        .padding(.top, 5)
                }
                .onAppear
                {
                    loadTranslationDictionary() // Load translations when view appears
                }
//                Text(newStrings[currentIndex])
//                    .font(.largeTitle)
//                    .padding()

                    // Buttons for "I remember" and "No, I don't"
                HStack
                {
                    Button("I remember")
                    {
                        rememberCurrentString()
                    }
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)

                    Button("No, I don't")
                    {
                        nextPage()
                    }
                        .padding()
                        .background(Color.red)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
            }
            else
            {
                Text("Well done!")
                    .font(.largeTitle)
                    .padding()
            }
        }
            .navigationTitle("String Tabs")
    }

    private func loadTranslationDictionary()
    {
        translationDictionary = loadCCCEDICT()
    }
        // Move to the next page and delete the current string
    private func rememberCurrentString()
    {
        if currentIndex < newStrings.count
        {
            newStrings.remove(at: currentIndex)
                
            if currentIndex >= newStrings.count
            {
                currentIndex = max(0, newStrings.count - 1)
            }
        }
    }

        // Just move to the next page without deleting the string
    private func nextPage()
    {
        if currentIndex < newStrings.count - 1
        {
            currentIndex += 1
        } else {
            currentIndex = 0 // Wrap around to the first page
        }
    }
}
//struct ViewTutorial: View
//{
//    var body: some View
//    {
//        Rem_modeView(strings: $strings)
//    }
//}
//struct ViewTutorial_Preview: PreviewProvider
//{
//    static var previews: some View
//    {
//        ViewTutorial()
//    }
//}
