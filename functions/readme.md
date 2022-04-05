# Smart Contract Developer Bootcamp - İTÜ Blockchain Devs

Bu dersimizde "Functions, Function Modifiers and Function Visibility" konularını işledik.

Fonksiyon Niteleyicileri

`view`: Fonksiyonun blokchain'den veri okuyacağını fakat üzerinde değişiklik yapmayacağını bildirir.
```solidity
contract View {
    uint x = 7;

    function show()
        public
        view
        returns(uint)
    {
        return x;
    }
}
```
`pure`: Fonksiyonun blokchain'den hem veri okumayacağını hem de değişiklik yapmayacağını bildirir.
```solidity
contract Pure {
    function add(uint x, uint y)
        public
        pure
        returns(uint)
    {
        return x + y;
    }
}
```

Fonksiyon Görünürlükleri

- `public`: Herhangi bir akıllı kontrat ve hesap çağırabilir. 
- `private`: Yalnızca fonksiyonun tanımlı olduğu kontratın içerisinde çağırılabilir. 
- `internal`: Tanımlı olduğu kontrat ile birlikte miras olarak alındığı kontrat tarafından da çağırılabili., 
- `external`: Yalnızca diğer akıllı kontratlar ve hesaplar tarafından çağıralabilir. 
