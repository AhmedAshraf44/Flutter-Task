# kartngo_task

A new Flutter project.

## Getting Started

## 1- 🤖 AI‑Led Coding
I used AI assistance (ProxyAI) to generate and refine key parts of the code. Below are two of the prompts I used:

#### 1. Prompt:  
"Design this screen with the same design, colors, fonts, and everything using flutter?".
(Attached the design image in the prompt)

**AI Response:**  
I will design the screen based on the provided image and OCR text.
Here's my plan:
• Set up the basic HomeScreen structure with a Scaffold and AppBar.
• Implement the AppBar with the title "التصنيفات" (Categories) and a search icon.
• Create the category filter chips using SingleChildScrollView + ChoiceChip.
• Design the product grid using GridView.builder.
• Develop a custom widget for each product item (image, name, price, quantity selector).
• Add a bottom cart summary bar with total price and "عرض السلة" (View Cart) button.
• Extract colors and text styles to match the design.
• Start by updating main.dart to launch this HomeScreen.

Then it generated the full HomeScreen code based on that plan.

✅ Integration:
This AI-generated plan and code were used to build the HomeScreen, split it into widgets, define colors in a constants file, and apply consistent text styles with Google Fonts.


#### 2. Prompt:  
"Divide this widget into smaller widgets to keep the code organized?"
(Attached the full widget code in the prompt)

**AI Response:**  
I will refactor the BuildProductItem widget by dividing it into smaller widgets to improve readability and maintainability.
Here's the plan:

Extract _ProductImage widget for the circular product image and logo.

Extract _ProductDetails widget for the product name and price.

Extract _QuantitySelector widget for the quantity increment/decrement controls.

Fix the quantity update logic to correctly update widget.product['quantity'] instead of widget.product[widget.index]['quantity'].

Then it provided the complete, refactored code with the widget split into these logical components.

✅ Integration:
The refactored widgets were applied inside the product grid item, enhancing clarity, readability, and enforcing Single Responsibility Principle.
This made it easier to test and reuse UI parts, and reduced the complexity of the main widget tree.


#### 3. Prompt:  
"Add description to every model?"
(ProductModel list was provided)

**AI Response:**  
To add a description to every ProductModel in the provided list, you need to:

Update the ProductModel class to include a new description field.

Refactor the constructor to accept a description.

Update the fromJson() and toJson() methods accordingly.

Add meaningful description strings to each product in the static list.

Also enhanced the quantity field by wrapping it in a ValueNotifier<int> for reactive state updates in the UI.

Then provided a full refactored code including:

Class definition with description

JSON serialization methods

Default product list with description values

✅ Integration:
This updated model was integrated into the data layer, and descriptions are now used in product detail views and tooltips.
The use of ValueNotifier also improved the reactive state management for quantity updates within the UI.



## 2- ✅ UI Accuracy
The user interface is a pixel-perfect match to the provided design.
All layout elements, spacing, fonts, and colors have been carefully implemented to visually align 1:1 with the original UI mockup.



## 3- 📊 Demo Functionality
The app loads and displays real data from a **`local SQLite database`** using the **`sqflite package`**.

All product-related data—including cart items and favorites—is stored and retrieved through a structured and modular data layer.

This data is initialized when the app launches, allowing the screens to immediately display meaningful, persistent content. Since this data is stored locally, it remains available across sessions, and reflects actual user actions rather than mock or hardcoded values—making it real data within the context of the app.

💾 Local Persistence
All data is stored locally using SQLite. This ensures that:
User selections (cart, favorites, etc.) remain saved even after the app is closed.
**No internet connection is required to load the saved data.**



## 4- 🧱 Architecture
Follows **`MVVM architecture`** combined with **`Bloc (flutter_bloc)`** for clean and scalable state management.

Logic is separated clearly into:
Models for data structures.
ViewModels (Controllers) for logic and state.
Views (UI) for presentation.



### 5- 💎 Code Quality
- The codebase is **`clean, modular, and well-organized,`**  following best practices to ensure maintainability and scalability.

- The project uses the **MVVM architecture**  to clearly separate business logic from UI components.

- Each screen is broken down into **small, reusable widgets,** making the codebase easier to read, maintain, and test.

- The **`Single Responsibility Principle`** is applied throughout the project—each class has **one clear responsibility,** whether it's managing state, handling user interaction, or displaying UI.

- This structure promotes **better testability, improved readability, and easier future enhancements.**

## 6- 🔁 Interaction & UX
- Back navigation is fully functional across all screens.

User feedback is provided through:
- **`SnackBars`** order products .
- **`Toast messages`** for actions like adding/removing items in favorites.




#### The application contains three important screens(HomeView,ProductView,CartView):

📱 App Screens Overview

### 🏠 Home Screen
Displays all available products.

Allows:
- Adjusting quantities.
- Viewing total prices.
All actions reflect instantly in local storage.

### 🛒 Cart Screen
Shows detailed view of selected products.

Includes:
- Product image, name, price, and quantity.
- Option to place an order.


### 📦 Product Details Screen
Displays:
- Product name, description, price.
- Customer ratings and reviews.

Includes:
- Add to favorites / Remove from favorites.

**`All favorite data is stored persistently using SQLite.`**

