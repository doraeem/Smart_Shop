# Smart_Shop

Smart Shop is a mini e-commerce app built using **Flutter**, designed to provide a seamless and visually appealing shopping experience. It integrates real-time product data from the [FakeStore API](https://fakestoreapi.com), with persistent login, theme toggling, cart and favourites functionalities.

## Key Features

### Authentication
- **Login/Register screen** using dummy credentials (or FakeStore API-compatible)
- **Validation** using `TextFormField`
- **Persistent login state** using `SharedPreferences`
- **Splash screen** that navigates based on login status

### Home Screen
- **Product listing** from FakeStore REST API
- **Sorting support**: 
  - Price: Low → High
  - Price: High → Low
  - Rating
- **Add to Cart** with item badge count
- **Mark products as Favourites** using heart icon
- **Pull-to-refresh** via `RefreshIndicator`
- **Star Rating display** using `flutter_rating_bar`

### Cart Page
- View cart items with:
  - Product image, name, price, rating
- **Remove from cart**
- **Total price calculation**
- **Cart icon badge** in AppBar

### Favourites Page
- Lists all favourite products (stored via Provider + SharedPreferences)

### Profile Page
- Shows user email
- Displays user avatar in center

### Theme Toggle
- Light / Dark theme support using `Provider`
- User’s preference stored using `SharedPreferences`

### Drawer Navigation
- Smooth navigation between:
  - Home
  - Cart
  - Favourites
  - Profile
  - Logout
- Includes theme toggle switch in drawer

### Logout
- Clears SharedPreferences login data
- Redirects to login screen


## Bonus Features (Implemented)

 ✅ Category filter support (via FakeStore categories API)
 ✅ Sorting by price & rating
 ✅ Refresh product list on pull
 ✅ Clean, structured project architecture
 ✅ Modular use of `Provider` for all state management

## Login Screen
<img width="589" height="576" alt="Login" src="https://github.com/user-attachments/assets/ae580d5f-2012-45f6-859d-9a465e4faafd" />

## Home Screen
<img width="636" height="613" alt="List" src="https://github.com/user-attachments/assets/fd6021c5-2a32-4e74-9345-7bcb21befa40" />

## Cart Screen
<img width="479" height="620" alt="Cart" src="https://github.com/user-attachments/assets/4dba9b35-4068-4133-a7f3-2d2f86d32968" />

## Favourites Screen
<img width="543" height="620" alt="Favourites" src="https://github.com/user-attachments/assets/05adc0a4-8609-4517-90c6-718467e4c793" />

## Category(Rating) Screen
<img width="639" height="614" alt="Screenshot 2025-07-25 at 1 39 34 AM" src="https://github.com/user-attachments/assets/d48fef5c-d7be-47df-8819-6ed3a7fc56c9" />

## Theme Screen
<img width="541" height="605" alt="Theme" src="https://github.com/user-attachments/assets/14d28561-4f46-4afc-b33a-8421ba27fc0c" />

## Profile Screen
<img width="527" height="626" alt="Profile" src="https://github.com/user-attachments/assets/2b8cc0cf-7e08-4604-a7ae-ac7ef05396b9" />


1. **Clone the repository**
  ```bash
  git clone https://github.com/your-username/smart_shop.git
  cd smart_shop
```

2. **Install dependencies**
   ```bash
   flutter pub get
```

3. **Run the app**
   ```bash
   flutter run
```

