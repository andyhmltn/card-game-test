//
//  Grid.swift
//  Memorize
//
//  Created by Andy Hamilton on 08/11/2020.
//

import SwiftUI

struct Grid<Item, ItemView>: View where Item: Identifiable, ItemView: View {
    var items: [Item]
    var viewForItem: (Item) -> ItemView

    var body: some View {
        GeometryReader { geometry in
            body(for: GridLayout(itemCount: items.count, in: geometry.size))
        }
    }
    
    func body(for layout: GridLayout) -> some View {
        ForEach(items) { item in
            let index = items.firstIndex(matching: item)!
            
            viewForItem(item)
                .frame(width: layout.itemSize.width, height: layout.itemSize.height)
                .position(layout.location(ofItemAt: index))
    
        }
    }

    
    init(_ items: [Item], viewForItem: @escaping (Item) -> ItemView) {
        self.items = items
        self.viewForItem = viewForItem
    }
}

struct Grid_Previews: PreviewProvider {
    static var previews: some View {
        let items = [GridItem("Hello"), GridItem("World"), GridItem("Test"), GridItem("New Item")]

        Grid(items) { item in
            ZStack {
                RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/).strokeBorder(lineWidth: 1)
                Text(item.content)
            }
                .padding(10)
                .foregroundColor(.black)
        }
    }
    
    struct GridItem: Identifiable {
        var content: String;
        var id: String;
        
        init(_ content: String) {
            self.content = content
            self.id = content
        }
    }
}
