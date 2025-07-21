# 🔐 Zig Password Generator

Un simple **générateur de mots de passe sécurisé** écrit en **Zig 0.14.x**.  
Ce programme génère des mots de passe aléatoires avec des options pour inclure des chiffres et des symboles.

---

## 🚀 **Fonctionnalités**

✅ Génération de mots de passe de longueur personnalisée  
✅ Inclusion optionnelle de **chiffres (`--numbers`)**  
✅ Inclusion optionnelle de **symboles (`--symbols`)**  
✅ Utilisation d’un générateur cryptographiquement sécurisé (`std.crypto.random`)  
✅ Compatible **Zig 0.14.x**

---

## 📦 **Installation**

Assurez-vous d’avoir **Zig 0.14.x** installé :  

[Télécharger Zig Ici](https://github.com/ziglang/zig/wiki/Install-Zig-from-a-Package-Manager)

## ▶️ Utilisation

Lancez simplement :

```bash
    zig run main.zig -- <longueur> [--symbols]  [--numbers]
```

## ✅ Exemples

Mot de passe de 12 caractères (lettres uniquement) :

```bash
    zig run main.zig -- 12
```

Generating password of length 12...
Your password is: gTrbXcdRqaLY

Mot de passe de 16 caractères avec chiffres :

```bash
    zig run main.zig -- 16 --numbers
```

=> Generating password of length 16...
Your password is: Lk3hPz7aTr4Qb2Vx

Mot de passe de 20 caractères avec chiffres et symboles :

```bash
    zig run main.zig -- 20 --symbols --numbers
```

Generating password of length 20...
Your password is: @Q4z!8tH3Lp&v0Kc2sRf
