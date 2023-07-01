import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext
    
    @FetchRequest(sortDescriptors: [], animation: .default)
    private var desserts : FetchedResults<Dessert>

    var body: some View {
        NavigationView{
            VStack{
                Text("DESSERTS")
                    .font(.title)
                List {
                    ForEach(desserts) { dessert in
                        VStack(alignment:.leading){
                            Text (dessert.name!)
                                .font(.system(size: 16, weight: .bold))

                            HStack{
                                Text (dessert.size!)
                                Spacer()
                                Text("$\(dessert.price, specifier: "%.2f")")
                                    .foregroundColor(.gray)
                                    .font(.callout)
                            }
                        }
                    }
                }
            }
           .onAppear{createDesserts()}
        }
    }
    
    
    
    func createDesserts() {
        var dessert1 = Dessert(context:viewContext)
        dessert1.name = "Profiterole"
        dessert1.size = "Large"
        dessert1.price = 2.99
        
        dessert1 = Dessert(context: viewContext)
        dessert1.name = "Crème Burlée"
        dessert1.size = "Medium"
        dessert1.price = 3.99
        
        dessert1 = Dessert(context: viewContext)
        dessert1.name = "Ice Cream"
        dessert1.size = "Extra Large"
        dessert1.price = 5.99
        
        dessert1 = Dessert(context: viewContext)
        dessert1.name = "Apple Pie"
        dessert1.size = "Small"
        dessert1.price = 2.99
        
        dessert1 = Dessert(context: viewContext)
        dessert1.name = "Riz à l'impératrice"
        dessert1.size = "Small"
        dessert1.price = 2.99
        
        dessert1 = Dessert(context: viewContext)
        dessert1.name = "Cheese Cake"
        dessert1.size = "Extra Small"
        dessert1.price = 4.99
        
        dessert1 = Dessert(context: viewContext)
        dessert1.name = "Carrot Cake"
        dessert1.size = "Standard"
        dessert1.price = 3.99
        
        dessert1 = Dessert(context: viewContext)
        dessert1.name = "Pièce montée"
        dessert1.size = "Medium"
        dessert1.price = 5.99
        
        dessert1 = Dessert(context: viewContext)
        dessert1.name = "Éclair"
        dessert1.size = "Large"
        dessert1.price = 3.99
        
        dessert1 = Dessert(context: viewContext)
        dessert1.name = "Crêpe Suzette"
        dessert1.size = "Extra Large"
        dessert1.price = 3.99
    }
    
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



