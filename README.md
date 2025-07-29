Here's a professional and clean `README.md` file for your Flutter MVVM project using `Pakave`, `Provider`, `API`, and shared preferences.

---

````markdown
# 📱 Flutter MVVM Architecture App

This is a sample Flutter project demonstrating **MVVM (Model-View-ViewModel)** architecture using:

- 🔗 REST API Integration (Reqres API)
- ✅ Shared Preferences for token management
- 📦 `Provider` for state management
- 📁 Clean file & folder structure
- ⚙️ Pakave for network handling abstraction

---

## 📁 Project Structure (Special MVVM Layout)

```text
lib/
├── data/
│   └── response/               # ApiResponse<T> class for handling API states
├── models/                     # Data models (e.g., UserModel, MovieListModel)
├── repository/                 # Repository for API calls
├── res/
│   ├── components/             # Reusable UI components
│   ├── colors.dart             # App colors
├── utils/
│   └── routes/                 # Route management & route names
├── view/                       # UI screens (Login, Home, Splash)
├── viewmodel/
│   ├── services/               # Splash service for auth redirection
│   └── user_view_model.dart    # ViewModel for user management
│   └── home_view_model.dart    # ViewModel for movie data
└── main.dart                   # App entry point
````

---

## 🚀 Features

* ✅ Login & Logout using Reqres API
* 🎬 Fetch & Display Movies List
* 🔐 Token saved using SharedPreferences
* 🧠 Clean separation of UI, Logic, and Data
* 🔄 Automatic login redirect via SplashScreen
* 📦 `Pakave` for simplified API consumption

---

## 🛠️ Packages Used

| Package              | Purpose                 |
| -------------------- | ----------------------- |
| `provider`           | State management        |
| `shared_preferences` | Token persistence       |
| `pakave`             | Network API abstraction |
| `flutter`            | Mobile development SDK  |

---

## 🔄 How Authentication Works

* On login, token is saved in SharedPreferences.
* `SplashScreen` checks if a token exists:

  * ✅ If exists → redirect to `HomeScreen`
  * ❌ If not → redirect to `LoginScreen`
* On logout, token is removed and user is redirected.

---

## 🖼️ UI Screens

* `SplashScreen` – Token check + loader
* `LoginScreen` – Enter email & password
* `HomeScreen` – Shows fetched movies list

---

## 📦 API Reference (Reqres)

* Login: `https://reqres.in/api/login`
* Register: `https://reqres.in/api/register`
* Movies (Dummy): Replace with your own or use mock.

---

## 📸 Screenshot Preview

<img width="496" height="603" alt="image" src="https://github.com/user-attachments/assets/2d4194d3-9c7a-4f2e-baee-0986dde88582" />
<img width="497" height="610" alt="image" src="https://github.com/user-attachments/assets/715e84a6-44aa-4d93-887b-3b00a399865d" />



---

## 🤝 Contributing

Feel free to fork this repo, improve code quality, and submit pull requests. This project is great for learning clean architecture in Flutter.

---

## 🙌 Author

**Hamza Ahmad Khan**
Aspire Institute Territory Leader | Flutter Developer
[LinkedIn](https://www.linkedin.com/in/ihamzaahmadkhan)

---

## 🧠 Want to Learn More?

Check out:

* [MVVM in Flutter](https://medium.com/flutter-community/architecting-your-flutter-project-bd04e144a8f1)
* [Provider Documentation](https://pub.dev/packages/provider)

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.


