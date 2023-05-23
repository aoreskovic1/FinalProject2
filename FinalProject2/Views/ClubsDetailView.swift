

import SwiftUI

struct ClubsDetailView: View {
    @EnvironmentObject var clubs: Clubs
    
    var club: Club
    @Binding var selectedTab: Tabs
    
    @State private var added = false
    @State private var dup = false
    
    var body: some View {
        
        Form {
    
                Section {

                    
                    AsyncImage(url: URL(string: club.getImageLink())) { phase in

                        switch phase {
                            case .empty:
                                ProgressView()
                            case .success(let image):
                                image
                                    .resizable()
                                    .scaledToFill()

                            case .failure:

                                
                                AsyncImage(url: URL(string: club.getImageLink())) { phase in
                                    if let image = phase.image {
                                        image
                                            .resizable()
                                            .scaledToFill()
                                    } else{
                                        Image(systemName: "xmark.octagon")
                                    }
                                }

                        }
                    }

                    .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 200, alignment: .center)
                }
            
            Section {
                ClubInfoSection(club: club)
            }
                
                Section {
                    Text("\(club.getLyrics())")
                        .font(.system(size:23))
                        .fontWeight(.bold)
                        .foregroundColor(.black)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    Button(action: {
                        if let url = URL(string: club.getLink()){
                            UIApplication.shared.open(url, options: [:], completionHandler: nil)                }
                    },label : {
                        Text("\(club.getLink())")
                        .font(.system(size:20))
                        .fontWeight(.bold)
                        
                    })
                    .foregroundColor(.blue)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                }
            
            Section {
                Text("\(club.getLyrics2())")
                    .font(.system(size:23))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                Button(action: {
                    if let url = URL(string: club.getLink2()){
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)                }
                },label : {
                    Text("\(club.getLink2())")
                    .font(.system(size:20))
                    .fontWeight(.bold)
                })
                .foregroundColor(.blue)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            }
            
            Section {
                Text("\(club.getLyrics3())")
                    .font(.system(size:23))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                Button(action: {
                    if let url = URL(string: club.getLink3()){
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)                }
                },label : {
                    Text("\(club.getLink3())")
                    .font(.system(size:20))
                    .fontWeight(.bold)
                })
                .foregroundColor(.blue)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            }
            
            Section {
                Text("\(club.getLyrics4())")
                    .font(.system(size:23))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                Button(action: {
                    if let url = URL(string: club.getLink4()){
                        UIApplication.shared.open(url, options: [:], completionHandler: nil)                }
                },label : {
                    Text("\(club.getLink4())")
                    .font(.system(size:20))
                    .fontWeight(.bold)
                })
                .foregroundColor(.blue)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            }
                
                
                Section {
                    FavoritesButton(club: club, showAdded: $added, showDuplicate: $dup)
                }
                
            }
        .navigationBarTitle("\(club.getClubName())", displayMode: .automatic)
        
        .alert(isPresented: $added) {
            Alert(title: Text("Favorites"), message: Text("\(club.getClubName()) added to Favorites"), dismissButton: .default(Text("OK")))
        }

       
    }
    
    @ViewBuilder
    private func view(for phase: AsyncImagePhase) -> some View {
        switch phase {
        case .empty:
            ProgressView()
        case .success(let image):
            image
                .resizable()
                .aspectRatio(contentMode: .fit)
        case .failure(let error):

            AsyncImage(url: URL(string: club.getImageLink())) { phase in
                            if let image = phase.image {
                                image
                                    .resizable()
                                    .scaledToFill()
                            } else{
                                Image(systemName: "xmark.octagon")
                            }
                        }
            }
        
    }
}

struct ClubDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ClubsDetailView(club: Clubs().list.first!, selectedTab: .constant(Tabs.list))
        }
    }
}

struct ClubInfoSection: View {
    var club: Club
    var body: some View {
        Text("\(club.getClubName())")
            .font(.system(size:20))
            .fontWeight(.bold)
            .foregroundColor(.black)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
        Text("\(club.getArenaName())")
            .foregroundColor(.black)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
        
        Text("Capacity: \(club.getCapacity())")
            .foregroundColor(.black)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
        
        Text("Year Formed: \(club.getDateFormed())")
            .foregroundColor(.black)
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
    }
}

struct FavoritesButton: View {
    var club: Club
    @Binding var showAdded: Bool
    @Binding var showDuplicate: Bool
    
    var body: some View {
        Button(action: {
            var array = (UserDefaults.standard.array(forKey: "favorites") ?? []) as! [String]
           
            if !array.contains(club.getClubName()) {
                array.append(club.getClubName())
                showAdded.toggle()
            } else {
                
                showDuplicate.toggle()
            }
            
            UserDefaults.standard.set(array, forKey:"favorites")
            
        },label : {
            Text("Add to Favorites")
                .font(.system(size:20))
                .fontWeight(.bold)
        })
        .foregroundColor(.blue)
        .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
        .alert(isPresented: $showDuplicate) {
            Alert(title: Text("Favorites"), message: Text("\(club.getClubName()) is already in Favorites"), dismissButton: .default(Text("OK")))
        }
    }
}
