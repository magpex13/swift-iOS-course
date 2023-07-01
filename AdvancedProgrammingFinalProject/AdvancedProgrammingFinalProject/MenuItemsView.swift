import SwiftUI

struct MenuItemsView: View {
    @State var modalOpen: Bool = false
    
    var body: some View {
        /*let foods = (1...12).map { MenuItem(price: Double($0), menuCategory: MenuCategory.food, ordersCount: 0, price2: $0, ingredients: [Ingredient.allCases.randomElement()!, Ingredient.allCases.randomElement()!], title: "Food \($0)") }
        
        let drinks = (1...8).map { MenuItem(price: Double($0), menuCategory: MenuCategory.drinks, ordersCount: 0, price2: $0, ingredients: [Ingredient.allCases.randomElement()!, Ingredient.allCases.randomElement()!], title: "Drink \($0)") }
        
        let desserts = (1...4).map { MenuItem(price: Double($0), menuCategory: MenuCategory.dessert, ordersCount: 0, price2: $0, ingredients: [Ingredient.allCases.randomElement()!, Ingredient.allCases.randomElement()!], title: "Dessert \($0)") }*/
        /*Text("Menu")
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.title)*/
        let vm = MenuViewViewModel(MockData())

        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    Text(MenuCategory.food.rawValue)
                        .padding([.leading], 15)
                        .font(.title2)
                        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                            ForEach(vm.foods) { item in
                                NavigationLink(destination: MenuItemDetailsView(menuItem: item), label: {
                                    VStack {
                                        Rectangle()
                                            .frame(width: 80.0, height: 80.0)
                                            .background(.gray)
                                        Text(item.title)
                                    }
                                })
                             }
                        }
                }
                .padding()
                
                VStack(alignment: .leading) {
                    Text(MenuCategory.drinks.rawValue)
                        .padding([.leading], 15)
                        .font(.title2)
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                        ForEach(vm.drinks) { item in
                            NavigationLink(destination: MenuItemDetailsView(menuItem: item), label: {
                                VStack {
                                    Rectangle()
                                        .frame(width: 80.0, height: 80.0)
                                        .background(.gray)
                                    Text(item.title)
                                }
                            })
                         }
                    }
                }
                .padding()
                
                VStack(alignment: .leading) {
                    Text(MenuCategory.dessert.rawValue)
                        .padding([.leading], 15)
                        .font(.title2)
                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))]) {
                        ForEach(vm.desserts) { item in
                            NavigationLink(destination: MenuItemDetailsView(menuItem: item), label: {
                                VStack {
                                    Rectangle()
                                        .frame(width: 80.0, height: 80.0)
                                        .background(.gray)
                                    Text(item.title)
                                }
                            })
                         }
                    }
                }
                .padding()
            }
            .navigationTitle("Menu")
            .navigationBarItems(trailing: Button(action: {
                self.modalOpen.toggle()
            }) {
                Image(systemName: "text.justify")
                    .imageScale(.large)
                    .frame(alignment: .trailing)
            }.sheet(isPresented: $modalOpen ,content: {
                MenuItemsOptionView()
            }))
        }
        
    }
}

struct MenuItemsView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemsView()
    }
}
