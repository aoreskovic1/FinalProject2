

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var clubs: Clubs
    
    @State private var eMode = EditMode.inactive
    
    @State private var fav: [String] = []
        
    @Binding var selectedTab : Tabs
    
    init(selectedTab: Binding<Tabs>) {
        _selectedTab = selectedTab
        

    }
    
    var body: some View {
        NavigationView {
            VStack {
                if fav.isEmpty {
                    Text("No Favorites Exist")
                        .font(.system(size: 40))
                      
                        
                } else {
                    
                    List{
                        ForEach(fav, id:\.self) { fav in
                            let club = clubs.list.first{$0.getClubName() == fav }
                            NavigationLink( destination: ClubsDetailView(club: club!, selectedTab: $selectedTab)) {
                                FavoritesRow(club: fav)
                            }
                        }
                        .onMove { (indexSet, index) in
                            fav.move(fromOffsets: indexSet, toOffset: index)
                            UserDefaults.standard.set(fav, forKey:"favorites")
                        }
                        .onDelete { indexSet in
                            fav.remove(atOffsets: indexSet)
                            UserDefaults.standard.set(fav, forKey:"favorites")
                        }
                        
                    }
                    .listStyle(PlainListStyle())
                    
                    
                }
            
            }
            .onAppear{
                self.fav = (UserDefaults.standard.array(forKey: "favorites") ?? []) as! [String]
            }
            
            .navigationBarTitle(Text("Favorites"),displayMode: .automatic)
            .navigationBarItems(trailing: EditButton())
            .environment(\.editMode, $eMode)
            
            
        }
        
    }
        
}
    
struct FavoritesRow: View {
    var club: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(club)")
                .font(.custom("Slim", size: 25, relativeTo: .title3))
                .fontWeight(.bold)
                .foregroundColor(Color.black)
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView(selectedTab: .constant(Tabs.list)).environmentObject(Clubs())
    }
}

extension String: Identifiable {
    public var id: String {
        return self
    }
}
