//
//  SaveWord.swift
//  remWord
//
//  Created by Johnny Li on 11/8/24.
//

import Foundation
import SwiftUI

struct SaveWord: View {
    @State private var strings: [String] = []
    @State private var newString: String = ""

    var body: some View {
        NavigationView {
            VStack {
                // TextField for input
                TextField("Enter new word", text: $newString)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                // Button to add a new string to the list
                Button(action: {
                    if !newString.isEmpty {
                        strings.append(newString)
                        newString = ""
                    }
                }) {
                    Text("Add word")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }

                // Navigation button to go to Rem_modeView
                NavigationLink(destination:Rem_modeView(strings:$strings)) {
                    Text("Remember mode")
                        .padding()
                        .background(Color.green)
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()

                // List to display the strings
                List(strings, id: \.self) { string in
                    Text(string)
                }
            }
            .navigationTitle("Wordlist")
            .padding()
        }
    }
}

struct Viewhelper: View
{
    var body: some View
    {
        SaveWord()
    }
}
struct Viewhelper_Preview: PreviewProvider
{
    static var previews: some View
    {
        Viewhelper()
    }
}
