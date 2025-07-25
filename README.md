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
<img width="589" height="576" alt="Login" src="https://github.com/user-attachments/assets/9bd98686-4704-4fb8-8e4b-e17a67a923a2" />

## Home Screen
<img width="636" height="613" alt="List" src="https://github.com/user-attachments/assets/9f4dc564-c8a3-4904-8540-08d6f36838e8" />

## Cart Screen
<img width="479" height="620" alt="Cart" src="https://github.com/user-attachments/assets/334d1b08-829b-4994-8b7b-c3ce3ee1b093" />

## Favourites Screen
<img width="543" height="620" alt="Favourites" src="https://github.com/user-attachments/assets/a34a4bb7-c5ed-4450-8b33-392fcce37c67" />

## Category(Rating) Screen
<img width="639" height="614" alt="Screenshot 2025-07-25 at 1 39 34 AM" src="https://github.com/user-attachments/assets/17f3e485-ceff-4108-b0ea-6c6e3d80c34a" />

## Theme Screen
<img width="541" height="605" alt="Theme" src="https://github.com/user-attachments/assets/ccdfb2e6-bb44-470d-ae5d-5fa275acc5e1" />

## Profile Screen
<img width="527" height="626" alt="Profile" src="https://github.com/user-attachments/assets/58c8f310-e5e5-44c6-80fa-0178e6d1bef3" />



1. **Clone the repository**
  ```bash
  git clone https://github.com/your-username/smart_shop.git
  cd smart_shop
```
2. **Install dependencies**
   ```bash
   flutter pub get
```
```
3. **Run the app**
   ```bash
   flutter run


