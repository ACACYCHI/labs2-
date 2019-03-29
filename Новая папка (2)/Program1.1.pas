uses
  graphABC; //Подключаем графический модуль

const
  W = 800; H = 500; e=2.7;//Размеры графического окна

Function F(x: real): real;
begin
  F := 7*sin(x) - 14*ln(x)/(sin(x)/cos(x)) ; //Функция
end;

var
  x0, y0, x, y, xLeft, yLeft, xRight, yRight, n: integer;
  a, b, fmin, fmax, x1, y1, mx, my, dx, dy, num: real;
  i: byte;
  s: string;

begin  
  SetWindowSize(W, H); //Устанавливаем размеры графического окна
  //Координаты левой верхней границы системы координат:
  xLeft := 50;
  yLeft := 50;
  //Координаты правой нижней границы системы координат:
  xRight := W - 50;
  yRight := H - 50;
  //интервал по Х; a и b должно нацело делится на dx:
  a := -2; b := 6; dx := 0.5;
  //Интервал по Y; fmin и fmax должно нацело делится на dy:
  fmin := -10; fmax := 20; dy := 2;
  //Устанавливаем масштаб:
  mx := (xRight - xLeft) / (b - a); //масштаб по Х
  my := (yRight - yLeft) / (fmax - fmin); //масштаб по Y
  //начало координат:
  x0 := trunc(abs(a) * mx) + xLeft;
  y0 := yRight - trunc(abs(fmin) * my);
  //Рисуем оси координат:
  line(xLeft, y0, xRight + 10, y0); //ось ОХ
  line(x0, yLeft - 10, x0, yRight); //ось ОY
  SetFontSize(12); //Размер шрифта
  SetFontColor(clBlue); //Цвет шрифта
  TextOut(xRight + 20, y0 - 15, 'X'); //Подписываем ось OX
  TextOut(x0 - 10, yLeft - 30, 'Y'); //Подписываем ось OY
  SetFontSize(8); //Размер шрифта
  SetFontColor(clRed); //Цвет шрифта
  { Засечки по оси OX: }
  n := round((b - a) / dx) + 1; //количество засечек по ОХ
  for i := 1 to n do
  begin
    num := a + (i - 1) * dx; //Координата на оси ОХ
    x := xLeft + trunc(mx * (num - a)); //Координата num в окне
    Line(x, y0 - 3, x, y0 + 3); //рисуем засечки на оси OX
    str(Num:0:1, s);
    if abs(num) > 1E-15 then //Исключаем 0 на оси OX
      TextOut(x - TextWidth(s) div 2, y0 + 10, s)
  end;
  { Засечки на оси OY: }
  n := round((fmax - fmin) / dy) + 1; //количество засечек по ОY
  for i := 1 to n do
  begin
    num := fMin + (i - 1) * dy; //Координата на оси ОY
    y := yRight - trunc(my * (num - fmin));
    Line(x0 - 3, y, x0 + 3, y); //рисуем засечки на оси Oy
    str(num:0:0, s);
    if abs(num) > 1E-15 then //Исключаем 0 на оси OY
      TextOut(x0 + 7, y - TextHeight(s) div 2, s)
  end;
  TextOut(x0 - 10, y0 + 10, '0'); //Нулевая точка
  { График функции строим по точкам: }
  x1 := a; //Начальное значение аргумента
  while x1 <= b do
  begin
    y1 := F(x1); //Вычисляем значение функции
    x := x0 + round(x1 * mx); //Координата Х в графическом окне
    y := y0 - round(y1 * my); //Координата Y в графическом окне
    //Если y попадает в границы [yLeft; yRight], то ставим точку:
    if (y >= yLeft) and (y <= yRight) then SetPixel(x, y, clGreen);
    x1 := x1 + 0.01 //Увеличиваем абсциссу
  end
end.