В задании нужно было переписать функцию calculate на ассемблере и запустить ее через QEMU: 
```csharp
uint32_t calculate(uint32_t repeat, uint32_t x, uint32_t y)
{
    uint32_t max = 10;
    uint32_t res = 0;
    for (int i = 0; i < repeat; i++)
    {
        uint32_t sum = x + y;    
        uint32_t mul = x * y;
        res += sum + mul;
        x = (sum < max) ? sum : max;  
    }
    return res;
}
```

Я написала функцию и вызов этой функции в одном файле func1.s. 
Для ввода данных использовала caller-save регистры r0, r1, r2. В функции в регистры r4, r6, r7 были записаны вспомогательные константы и счетчик. А в регистрах r3, r8, r0 были промежуточные значения суммы и умножения. В регистре r5 считался вывод функции. Для примера было взято r0=1, r1=4, r2=5 и вывод показал 29, как и ожидалось.

Запускается через:
```shell
arm-linux-gnueabihf-as -o func1.o func1.s
arm-linux-gnueabihf-ld -o func1 func1.o
qemu-arm ./func1
``` 
Проверка правильности вывода может быть через:
```shell
echo$?
```
