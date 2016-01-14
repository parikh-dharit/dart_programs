import 'dart:html';

const int unknown = -1;
const int OperationTypeAdd = 1;
const int OperationTypeSubtract = 2;
const int OperationTypeMultiply = 3;
const int OperationTypeDivide = 4;

int operationType = unknown;

DivElement screen;
ElementList<DivElement> numbers;
DivElement decimal;
DivElement clear;
DivElement clearAll;

double number1;

DivElement add;
DivElement sub;
DivElement mul;
DivElement div;

DivElement equals;

void main()
{
    screen = querySelector("#calculator_screen");
    numbers = querySelectorAll(".number");
    decimal = querySelector("#decimal");
    clear = querySelector("#clear");
    clearAll = querySelector("#clear-everything");

    add = querySelector("#add");
    sub = querySelector("#subtract");
    mul = querySelector("#multiply");
    div = querySelector("#divide");

    equals = querySelector("#equals");

    for(DivElement number in numbers)
    {
        number.onClick.listen(numberClicked);
    }
    decimal.onClick.listen(decimalClicked);
    clear.onClick.listen(clearScreen);
    clearAll.onClick.listen(clearEverything);
    clearEverything(null);

    add.onClick.listen(addClicked);
    sub.onClick.listen(subClicked);
    mul.onClick.listen(mulClicked);
    div.onClick.listen(divClicked);

    equals.onClick.listen(equalsClicked);
}

void numberClicked(MouseEvent event)
{
    if(screen.text == "0")
    {
        screen.text = "";
    }
    if(screen.text.length < 10)
    {
        screen.text = screen.text + event.target.text;
    }
}

void decimalClicked(MouseEvent event)
{
    if(!screen.text.contains("."))
    {
        screen.text = screen.text + ".";
    }
}

void clearScreen(MouseEvent event)
{
    screen.text = "0";
}

void clearEverything(MouseEvent event)
{
    clearScreen(event);
    operationType = unknown;
    operationTypeChanged(null);
    number1 = null;
}

void addClicked(MouseEvent event)
{
    operationType = OperationTypeAdd;
    operationTypeChanged(event.target);
}

void subClicked(MouseEvent event)
{
    operationType = OperationTypeSubtract;
    operationTypeChanged(event.target);
}

void mulClicked(MouseEvent event)
{
    operationType = OperationTypeMultiply;
    operationTypeChanged(event.target);
}

void divClicked(MouseEvent event)
{
    operationType = OperationTypeDivide;
    operationTypeChanged(event.target);
}

void operationTypeChanged(Element selected)
{
    ElementList<Element> operationElements = querySelectorAll(".operation");
    for(Element element in operationElements)
    {
        element.classes.remove("selected");
    }

    if(operationType != unknown)
    {
        selected.classes.add("selected");

        if(number1 == null)
        {
            number1 = double.parse(screen.text);
            screen.text = "0";
        }
    }
}

void equalsClicked(MouseEvent event)
{
    if(number1!=null && operationType!=unknown)
    {
        double result;
        double number2 = double.parse(screen.text);

        switch(operationType)
        {
            case OperationTypeAdd:
                result = number1 + number2;
                break;
            case OperationTypeSubtract:
                result = number1 - number2;
                break;
            case OperationTypeMultiply:
                result = number1 * number2;
                break;
            case OperationTypeDivide:
                result = number1 / number2;
                break;
        }
        clearEverything(null);
        String displayString = result.toString();
        if(displayString.length > 10)
        {
            displayString = displayString.substring(0, 10);
        }
        screen.text = displayString;
    }
}
