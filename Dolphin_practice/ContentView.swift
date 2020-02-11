//
//  searchBar_view.swift
//  Dolphin_practice
//
//  Created by 박찬영 on 2020/02/12.
//  Copyright © 2020 박찬영. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var dates = ["hello","HI","welcome","world","asdfs","fdskfljsd","박찬영","김성원","박성원"]
    @State var txt = ""
    var body: some View {
        VStack{
            searchview(txt: $txt)
            
            
            List(dates.filter{ txt == "" ? true : $0.localizedCaseInsensitiveContains(txt)},id: \.self){i in
                Text(i).fontWeight(.heavy)
            }
        }
    }
}

struct searchBar_view_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct searchview : UIViewRepresentable {
    func makeUIView(context: UIViewRepresentableContext<searchview>) -> UISearchBar {
        let searchbar = UISearchBar()
        searchbar.barStyle = .default
        searchbar.autocapitalizationType = .none
        searchbar.delegate = context.coordinator
        return searchbar
    }
    
    @Binding var txt : String
    
    func makeCoordinator() -> searchview.Coordinator{
        return searchview.Coordinator(parent1: self)
    }
    
    func updateUIView(_ uiView : UISearchBar,context: UIViewRepresentableContext<searchview>){
        
    }
    class Coordinator : NSObject,UISearchBarDelegate{
        var parent : searchview!
        
        init(parent1 : searchview){
            parent = parent1
        }
        
        func searchBar(_ searchBar: UISearchBar, textDidChange searchText : String){
            parent.txt = searchText
        }
    }
}
