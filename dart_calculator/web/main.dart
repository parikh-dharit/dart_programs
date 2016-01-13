import 'dart:html';

DivElement screen;
ElementList numbers;
DivElement decimal;
DivElement clear;
DivElement clearAll;

void main()
{
    screen = querySelector("#calculator_screen");
    numbers = querySelectorAll(".numbers");
    decimal = querySelector("#decimal");
    clear = querySelector("#clear");
    clearAll = querySelector("#clear-everything");

    for(DivElement number in numbers)
    {
        number.onClick.listen(numberClicked);
    }
    decimal.onClick.listen(decimalClicked);
    clear.onClick.listen(clearScreen);
    clearAll.onClick.listen(clearEverything);

    clearEverything(null);
}

void numberClicked(MouseEvent event)
{

}

void decimalClicked(MouseEvent event)
{

}

void clearScreen(MouseEvent event)
{

}

void clearEverything(MouseEvent event)
{

}
