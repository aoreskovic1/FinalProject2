
import SwiftUI
import CoreLocation

enum SortType {
    case ascending
    case descending
}

struct SortSelect {
    var title: String
    var sortType: SortType
}


struct ClubsListView: View {
    
    @EnvironmentObject var clubs: Clubs
        
    @Binding var selectedTab : Tabs
    
    @State private var sortM = 0
    @State private var sortS = [SortSelect(title: "A-Z", sortType: .ascending), SortSelect(title: "Z-A", sortType: .descending)]
    
    init(selectedTab: Binding<Tabs>) {
        _selectedTab = selectedTab
        

    }
    
    var body: some View {
        NavigationView {
            VStack {
                if clubs.list.isEmpty {
                    Text("No Clubs Exist")
                        
                } else {
                   
                    List(clubs.list) { club in
                        NavigationLink( destination: ClubsDetailView(club: club, selectedTab: $selectedTab)) {
                            ClubRow(club: club)
                        }
                        
                    }
                    .listStyle(PlainListStyle())
                }
            
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    Picker(selection: $sortM, label: EmptyView()) {
                                    ForEach(0 ..< sortS.count) {
                                        Text(self.sortS[$0].title)
                                            .tag($0)
                                    }
                    }
                    .pickerStyle(SegmentedPickerStyle())
                    .onChange(of: sortM) { value in
                        switch (value) {
                            case 0:
                                clubs.list.sort(by: {$0.getClubName() < $1.getClubName()})
                            case 1:
                                clubs.list.sort(by: {$0.getClubName() > $1.getClubName()})
        
                            default:
                                break
                        }
                    }
                }
            }
        }
        
    }
}
    
struct ClubRow: View {
    var club: Club
    
    var body: some View {
        LazyVStack(alignment: .leading) {
                
            Text("\(club.getClubName())")
                .font(.custom("Slim", size: 18, relativeTo: .title3))
                .fontWeight(.medium)
                .foregroundColor(Color.black)

        }
    }
}

struct ClubsListView_Previews: PreviewProvider {
    static var previews: some View {
        ClubsListView(selectedTab: .constant(Tabs.list)).environmentObject(Clubs())
    }
}
