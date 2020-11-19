//
//  Array+Indentifiable.swift
//  Memorize
//
//  Created by Andy Hamilton on 08/11/2020.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element)  -> Int? {
        for (index, currentItem) in self.enumerated() {
            if currentItem.id == matching.id {
                return index;
            }
        }
        
        return nil
    }
}
