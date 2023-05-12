# iExpenses
iExpenses is a simple iOS app for tracking expenses. It allows users to add, edit, and delete expenses. The app is built with SwiftUI and uses UserDefaults to store expense data.

https://github.com/Ktamim98/iExpenses/assets/124142522/ef1ab8e3-b92e-48f5-9741-bae1006da9bd


## Features:

- Create, edit, and delete expense items

- Filter expenses by type (Business or Personal)


- The app uses the @ObservedObject property wrapper to observe changes to the Expenses object, which is responsible for managing the list of expense items.

- The sheet view modifier is used to show the AddView sheet view when the user taps the plus button in the toolbar. The sheet view is dismissed when the user taps the "save" button in the sheet view.

- The TextField and Picker views are used to get user input for the name, type, and amount of the expense item. The TextField view for the amount uses the .currency(code: "USD") format specifier to show the amount as a currency value in US dollars.

- The app also uses a custom font and color for the expense amount based on its value. The expenseAmountFont function returns a font based on the amount of the expense item, while the expenseAmountColor function returns a color based on the amount of the expense item.

- The app uses Codable to encode and decode the list of expense items as JSON data, which is stored in the UserDefaults database. When the app launches, it loads the list of expense items from the UserDefaults database using the init() method of the Expenses class. If the app crashes or is terminated, the list of expense items is persisted and can be restored when the app is launched again.


## Usage
The app has two main screens: a list of expenses and a form for adding a new expense.

### List of Expenses
The list of expenses shows all expenses that have been added. Expenses are sorted by date, with the most recent expenses at the top of the list. To delete an expense, swipe left on the expense and tap the "Delete" button. To edit an expense, tap on the expense and make changes in the detail view.

### Add New Expense
To add a new expense, tap the plus button in the top-right corner of the expenses list. This will present a form for adding a new expense. Enter the name, type, and amount for the new expense, then tap "Save" to add the expense to the list.

## Implementation Details
The app is built using SwiftUI and the MVVM architecture. The Expenses class is the view model for the app and is responsible for managing the list of expenses. The ExpenseItem struct is the model for individual expenses.

The list of expenses is displayed using a List view. Each expense is displayed using a HStack view, which shows the name, type, and amount of the expense. The amount is displayed in the local currency format using the .currency formatter.

The form for adding a new expense is displayed using a Form view. The name and type fields are displayed using TextField views, and the amount field is displayed using a TextField view with a .decimalPad keyboard. The save button is displayed using the ToolbarItem modifier.

The app uses UserDefaults to store the list of expenses. The didSet property observer is used to update the user defaults whenever the list of expenses changes.

 

## Credits
This project was built as part of the "100 Days of SwiftUI" course by Paul Hudson.
