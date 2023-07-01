import SwiftUI

enum SelectedCategory: String, CaseIterable {
    case food = "Food"
    case drink = "Drink"
    case desert = "Dessert"
}

enum SortBy: String, CaseIterable {
    case mostPopular = "Most Popular"
    case price = "Price $-$$$"
    case az = "A-Z"
}

struct MenuItemsOptionView: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Filter").font(.title)) {}
                    .headerProminence(.increased)
                Section("Selected Categories") {
                    ForEach(SelectedCategory.allCases, id: \.self) { selectedCategory in
                        Text(selectedCategory.rawValue)
                    }
                }
                Section("Sort By") {
                    ForEach(SortBy.allCases, id: \.self) { sortBy in
                        Text(sortBy.rawValue)
                    }
                }
            }
            .ignoresSafeArea()
            .navigationBarItems(trailing: Button("Done") {
                dismiss()
            })
        }
        
    }
}

struct MenuItemsOptionView_Previews: PreviewProvider {
    static var previews: some View {
        MenuItemsOptionView()
    }
}
