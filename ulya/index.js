const express = require("express");
const path = require("path");
const database = require("./database");
const bodyParser = require("body-parser");
const session = require("express-session");

// Инициализация базы данных
database.initializeDatabase();

const app = express();
const PORT = process.env.PORT || 3001;

// Подключаем middleware для работы с формами и сессиями
app.use(bodyParser.urlencoded({ extended: true }));
app.use(
  session({
    secret: "secret",
    resave: false,
    saveUninitialized: true,
    cookie: { secure: false },
  }),
);

app.use(express.static(path.join(__dirname, "views")));
app.use((req, res, next) => {
  res.locals.isAuthenticated = req.session.user ? true : false;
  next();
});

// Инициализация корзины
app.use((req, res, next) => {
  if (!req.session.cart) {
    req.session.cart = [];
  }
  next();
});

app.set("view engine", "pug");
app.set("views", path.join(__dirname, "views"));

app.get("/", (req, res) => {
  database.getSaleProducts((err, products) => {
    if (err) {
      return res
        .status(500)
        .json({ error: "Ошибка при получении товаров из базы данных" });
    }
    res.render("index", { products });
  });
});

app.get("/shop", (req, res) => {
  database.getAllProducts((err, products) => {
    if (err) {
      return res
        .status(500)
        .json({ error: "Ошибка при получении товаров из базы данных" });
    }
    res.render("shop", { products });
  });
});

app.get("/office-shop", (req, res) => {
  database.getProductByCategory("office", (err, products) => {
    if (err) {
      return res
        .status(500)
        .json({ error: "Ошибка при получении товаров из базы данных" });
    }
    res.render("shop", { products });
  });
});

app.get("/shool-shop", (req, res) => {
  database.getProductByCategory("shool", (err, products) => {
    if (err) {
      return res
        .status(500)
        .json({ error: "Ошибка при получении товаров из базы данных" });
    }
    res.render("shop", { products });
  });
});

app.get("/art-shop", (req, res) => {
  database.getProductByCategory("atr", (err, products) => {
    if (err) {
      return res
        .status(500)
        .json({ error: "Ошибка при получении товаров из базы данных" });
    }
    res.render("shop", { products });
  });
});

app.get("/sale-shop", (req, res) => {
  database.getSaleProducts((err, products) => {
    if (err) {
      return res
        .status(500)
        .json({ error: "Ошибка при получении товаров из базы данных" });
    }
    res.render("shop", { products });
  });
});

app.get("/contacts", (req, res) => {
  database.getAllProducts((err, products) => {
    if (err) {
      return res
        .status(500)
        .json({ error: "Ошибка при получении товаров из базы данных" });
    }
    res.render("contacts", { products });
  });
});

app.get("/about-us", (req, res) => {
  database.getAllProducts((err, products) => {
    if (err) {
      return res
        .status(500)
        .json({ error: "Ошибка при получении товаров из базы данных" });
    }
    res.render("about-us", { products });
  });
});

// Маршрут для отображения товара
app.get("/product/:id", (req, res) => {
  const productId = req.params.id;
  database.getProduct(productId, (err, product) => {
    if (err) {
      return res.status(500).send("Ошибка сервера");
    }
    res.render("product", { product });
  });
});

let users = [
  {
    name: "sula",
    pass: "123",
    id: 1,
  },
];

let userCart = [];

// Функция для поиска пользователя по ID
const findUserById = (id) => users.find((user) => user.id === id);

// Функция для поиска корзины пользователя по ID пользователя
const findCartByUserId = (userId) =>
  userCart.filter((item) => item.userId === userId);

// Маршрут для страницы входа
app.get("/login", (req, res) => {
  res.render("login");
});

// Маршрут для обработки запроса на вход
app.post("/login", (req, res) => {
  const { name, pass } = req.body;
  const user = users.find((user) => user.name === name && user.pass === pass);

  if (user) {
    req.session.user = user;
    res.redirect("/user-dashboard");
  } else {
    res.send("Неверный логин или пароль");
  }
});

// Маршрут для страницы регистрации
app.get("/register", (req, res) => {
  res.render("register");
});

// Маршрут для обработки запроса на регистрацию
app.post("/register", (req, res) => {
  const { name, pass } = req.body;

  const existingUser = users.find((user) => user.name === name);
  if (existingUser) {
    return res.send("Пользователь с таким именем уже существует");
  }

  const newUser = { name, pass, id: users.length + 1 };
  users.push(newUser);
  req.session.user = { id: userId };
  res.redirect("/login");
});

// Защищаем маршруты, доступ к которым должен быть только для авторизованных пользователей
app.get("/user-dashboard", (req, res) => {
  if (req.session.user) {
    res.render("user-dashboard", { user: req.session.user });
  } else {
    res.redirect("/login");
  }
});

// Маршрут для добавления товара в корзину
app.post("/add-to-cart", (req, res) => {
  if (!req.session.user) {
    console.log("Пользователь не авторизован");
    return res.status(401).json({ error: "Пользователь не авторизован" });
  }

  const { productId, quantity } = req.body;
  const userId = req.session.user.id;

  console.log("Полученные данные:", { productId, quantity, userId });

  if (!productId || !quantity) {
    console.log("Необходимо указать productId и quantity");
    return res
      .status(400)
      .json({ error: "Необходимо указать productId и quantity" });
  }

  const userCart = req.session.cart || [];
  userCart.push({
    userId,
    productId: parseInt(productId, 10),
    quantity: parseInt(quantity, 10),
  });
  req.session.cart = userCart;

  console.log("Обновленная корзина:", req.session.cart);

  res.status(200).json({ message: "Товар добавлен в корзину" });
});

app.get("/cart", (req, res) => {
  if (!req.session.user) {
    return res.redirect("/login");
  }

  const userCart = req.session.cart || [];

  if (userCart.length === 0) {
    return res.render("cart", { userCart: [] });
  }

  // Создаем массив промисов для получения данных о товарах
  const productPromises = userCart.map((cartItem) => {
    return new Promise((resolve, reject) => {
      const productId = cartItem.productId;
      database.getProduct(productId, (err, product) => {
        if (err) {
          reject(err);
        } else {
          // Добавляем количество товара из корзины к данным о товаре
          product.quantity = cartItem.quantity;
          resolve(product);
        }
      });
    });
  });

  // Дожидаемся завершения всех запросов
  Promise.all(productPromises)
    .then((products) => {
      // Рендерим шаблон корзины с полными данными о товарах
      res.render("cart", { userCart: products });
    })
    .catch((err) => {
      console.error("Ошибка при получении данных о товарах:", err);
      res.status(500).send("Ошибка при получении данных о товарах.");
    });
});

app.post("/cart/remove/:id", (req, res) => {
  const itemId = req.params.id;
  if (req.session.cart) {
    req.session.cart = req.session.cart.filter(
      (item) => item.productId != itemId,
    );
  }
  res.json({ success: true });
});

app.post("/cart/clear", (req, res) => {
  req.session.cart = [];
  res.json({ success: true });
});

// Маршрут для обновления количества товара в корзине
app.post("/cart/update", (req, res) => {
  if (!req.session.user) {
    return res.redirect("/login");
  }

  const { productId, quantity } = req.body;
  const userId = req.session.user.id;

  const cartItem = userCart.find(
    (item) =>
      item.userId === userId && item.productId === parseInt(productId, 10),
  );
  if (cartItem) {
    cartItem.quantity = parseInt(quantity, 10);
  }

  res.redirect("/cart");
});

// Маршрут для выхода из аккаунта
app.post("/logout", (req, res) => {
  req.session.destroy((err) => {
    if (err) {
      console.error("Ошибка при удалении сессии пользователя:", err);
      return res.status(500).send("Ошибка сервера");
    }
    res.redirect("/");
  });
});

app.listen(PORT, () => {
  console.log(`Server is running on port ${PORT}`);
});

