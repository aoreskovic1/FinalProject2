
import SwiftUI
import CoreLocation
import Foundation
import SwiftUI
import AudioToolbox



enum Tabs: Hashable {

    case list
    case favorites
    case lyrics


}

struct ContentView: View {
    
    @EnvironmentObject var clubs: Clubs
    @State private var selectedTab = Tabs.list
    @State var count = 0
    let persistenceController = PersistenceController.shared

    
    
    var body: some View {
        TabView(selection: $selectedTab){
            
            
            ClubsListView(selectedTab: $selectedTab)
                .tabItem {
                    Image(systemName: "list.bullet")
                    Text("Clubs")
                    
                }
                .tag(Tabs.list)
            
            FavoritesView(selectedTab: $selectedTab)
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorites")
                }
                .tag(Tabs.favorites)
            
            
            ToDoo()
                .tabItem {
                    Image(systemName: "guitars")
                    Text("Add new lyrics")
                }
                .tag(Tabs.lyrics)
         
        }
        
        
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environmentObject(Clubs())
    }
}
