# Compiler Design Practice Problems

A collection of **Compiler Design Lab** practice problems implemented using **C**, **Flex (Lex)**, and **Bison (Yacc)**.

This repository is created for practicing fundamental compiler construction concepts through hands-on programming exercises.

---

## 📚 Course Information

| Item | Details |
|------|---------|
| **Course** | CSE314 – Compiler Design Lab |
| **Language** | C |
| **Tools** | Flex (Lex), Bison (Yacc), GCC |

---

## 📁 Repository Structure

```text
COMPILER-DESIGN-PRACTICE-PROBLEM/
│
├── problems/
│   ├── problem-01/
│   │   ├── problem1.l
│   │   ├── input1.txt
│   │   └── output1.txt
│   │
│   ├── problem-02/
│   │   ├── problem2.l
│   │   ├── input2.txt
│   │   └── output2.txt
│   │
│   ├── problem-03/
│   │   ├── problem3.l
│   │   ├── input3.txt
│   │   └── output3.txt
│   │
│   └── ...
│
├── template.l
├── .gitignore
├── LICENSE
├── README.md
└── CSE314 – Compiler Design Lab Problem List.pdf
```

---

## 🛠️ Technologies Used

- C Programming
- Flex (Lex)
- Bison (Yacc)
- GCC Compiler

---

## ▶️ How to Run

### Windows (MinGW)

```bash
flex problem2.l
gcc lex.yy.c
./a.exe
```

### Linux / macOS

```bash
flex problem2.l
gcc lex.yy.c
./a.out
```

---

## 🎯 Learning Objectives

This repository covers the following Compiler Design topics:

- Lexical Analysis
- Regular Expressions
- Token Recognition
- Finite Automata (NFA & DFA)
- Symbol Table
- Parsing
- LL(1) Predictive Parsing
- Shift-Reduce Parsing
- Syntax Analysis
- Error Recovery
- Mini Compiler Front-End

---

## 📌 Repository Goals

- Practice Compiler Design laboratory problems.
- Learn Flex and Bison from beginner to intermediate level.
- Improve C programming skills.
- Build a strong foundation in Compiler Construction.
- Maintain organized and reusable lab solutions.

---

## 📖 References

- Compiler Design Lab Problem Sheet
- Flex Documentation
- GNU Bison Manual
- *Compilers: Principles, Techniques, and Tools* (Dragon Book)

---

## 🤝 Contributing

Contributions, suggestions, and improvements are welcome.

If you find any issues or have better implementations, feel free to open an Issue or submit a Pull Request.

---

## 📄 License

This project is licensed under the **MIT License**.

---

## 👨‍💻 Author

**Arafat Islam**

Computer Science & Engineering (CSE)  
Daffodil International University

**GitHub:** https://github.com/arafatai388

---

⭐ If you find this repository useful, consider giving it a **Star**.