# Julius

## Utilização

1. Clone o projeto
2. Gere o build com ``flutter run --release``. Siga as instruções de [debug via usb](#usbdebug) para instruções adicionais.

<!-- 1. Baixe o app pela [Play Store]() ou pela [release]()-->

## Desenvolvimento

### Ambiente

```sh
flutter pub get
```

### Execução

```sh
flutter run
```
> Use <kbd>r</kbd> ou <kbd>R</kbd> para recarregar o app

#### <a name="usbdebug"></a> USB debug

- Caso ``flutter devices`` e ``adb devices`` aponte que o celular não possui autorização tente os comandos abaixo, desabilite o debug no celular e habilite novamente

```sh
adb kill-server
adb start-server
```

### Testes

> Gere os mocks com ``flutter pub run build_runner build``

- CI
```sh
flutter test
```

- Testes específicos

```sh
flutter test test/blabla/blabla_test.dart
```
