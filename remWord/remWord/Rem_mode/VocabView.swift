//
//  VocabView.swift
//  remWord
//
//  Created by Johnny Li on 11/5/24.
//

import Foundation
import SwiftUI

struct VocabView: View
{
    let VocabNames = ["abandon","about","abort"]
    let index: Int
    var body: some View
    {
        Text(VocabNames[index])
    }
}
    


