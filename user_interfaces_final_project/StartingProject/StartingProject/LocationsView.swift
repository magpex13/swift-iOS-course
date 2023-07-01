import SwiftUI

struct LocationsView: View {
    @EnvironmentObject var model:Model
    
    var body: some View {
        let restaurants = model.restaurants
        let isReservation: Bool = model.displayingReservationForm
        
            VStack {
                LittleLemonLogo() // 1
                    .padding(.top, 50)
                
                Text(isReservation ? "Reservation Details" : "Select a location")// 2
                .padding([.leading, .trailing], 40)
                .padding([.top, .bottom], 8)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(20)
                
                NavigationView {
                    List {
                        ForEach(restaurants, id: \.self) { restaurant in
                            NavigationLink(destination: ReservationForm(restaurant), label: {RestaurantView(restaurant)})
                        }
                    }
                    .navigationBarTitle("")
                    .navigationBarHidden(true)
                    .navigationBarBackButtonHidden(true)
                }
             
            }
            .padding(.top, -10)

        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LocationsView().environmentObject(Model())
    }
}

