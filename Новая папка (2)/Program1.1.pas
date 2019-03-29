uses
  graphABC; //���������� ����������� ������

const
  W = 800; H = 500; e=2.7;//������� ������������ ����

Function F(x: real): real;
begin
  F := 7*sin(x) - 14*ln(x)/(sin(x)/cos(x)) ; //�������
end;

var
  x0, y0, x, y, xLeft, yLeft, xRight, yRight, n: integer;
  a, b, fmin, fmax, x1, y1, mx, my, dx, dy, num: real;
  i: byte;
  s: string;

begin  
  SetWindowSize(W, H); //������������� ������� ������������ ����
  //���������� ����� ������� ������� ������� ���������:
  xLeft := 50;
  yLeft := 50;
  //���������� ������ ������ ������� ������� ���������:
  xRight := W - 50;
  yRight := H - 50;
  //�������� �� �; a � b ������ ������ ������� �� dx:
  a := -2; b := 6; dx := 0.5;
  //�������� �� Y; fmin � fmax ������ ������ ������� �� dy:
  fmin := -10; fmax := 20; dy := 2;
  //������������� �������:
  mx := (xRight - xLeft) / (b - a); //������� �� �
  my := (yRight - yLeft) / (fmax - fmin); //������� �� Y
  //������ ���������:
  x0 := trunc(abs(a) * mx) + xLeft;
  y0 := yRight - trunc(abs(fmin) * my);
  //������ ��� ���������:
  line(xLeft, y0, xRight + 10, y0); //��� ��
  line(x0, yLeft - 10, x0, yRight); //��� �Y
  SetFontSize(12); //������ ������
  SetFontColor(clBlue); //���� ������
  TextOut(xRight + 20, y0 - 15, 'X'); //����������� ��� OX
  TextOut(x0 - 10, yLeft - 30, 'Y'); //����������� ��� OY
  SetFontSize(8); //������ ������
  SetFontColor(clRed); //���� ������
  { ������� �� ��� OX: }
  n := round((b - a) / dx) + 1; //���������� ������� �� ��
  for i := 1 to n do
  begin
    num := a + (i - 1) * dx; //���������� �� ��� ��
    x := xLeft + trunc(mx * (num - a)); //���������� num � ����
    Line(x, y0 - 3, x, y0 + 3); //������ ������� �� ��� OX
    str(Num:0:1, s);
    if abs(num) > 1E-15 then //��������� 0 �� ��� OX
      TextOut(x - TextWidth(s) div 2, y0 + 10, s)
  end;
  { ������� �� ��� OY: }
  n := round((fmax - fmin) / dy) + 1; //���������� ������� �� �Y
  for i := 1 to n do
  begin
    num := fMin + (i - 1) * dy; //���������� �� ��� �Y
    y := yRight - trunc(my * (num - fmin));
    Line(x0 - 3, y, x0 + 3, y); //������ ������� �� ��� Oy
    str(num:0:0, s);
    if abs(num) > 1E-15 then //��������� 0 �� ��� OY
      TextOut(x0 + 7, y - TextHeight(s) div 2, s)
  end;
  TextOut(x0 - 10, y0 + 10, '0'); //������� �����
  { ������ ������� ������ �� ������: }
  x1 := a; //��������� �������� ���������
  while x1 <= b do
  begin
    y1 := F(x1); //��������� �������� �������
    x := x0 + round(x1 * mx); //���������� � � ����������� ����
    y := y0 - round(y1 * my); //���������� Y � ����������� ����
    //���� y �������� � ������� [yLeft; yRight], �� ������ �����:
    if (y >= yLeft) and (y <= yRight) then SetPixel(x, y, clGreen);
    x1 := x1 + 0.01 //����������� ��������
  end
end.