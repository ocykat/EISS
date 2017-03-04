Program EISSv01; //Electronic Ignition System Simulator

Uses Crt, Graph;

Const
  //Distance between Gridlines
  gld = 100;
  x0 = 600;
  y0 = 100;
  z1 = 200;
  t1 = 500;
  z2 = 200;
  t2 = 600;
  Xres = 0.4;
  Yres = 20;

Type
  Point = Record
    x: Word;
    y: Word;
  End;

Var
  GD, GM, ErC: SmallInt; //Graphic Driver, Graphic Mode, Error Code
  i: Integer;
  pA, pB, pC, pD, pE, pF, pG1, pG2,
  pH, pI, pJ, pK, pL, pM, pN, pO, pP1, pP2,
  pQ, pR, pS, pT, pU, pV,
  pW, pX, pY, pZ, Centre, ct, Mag, A, B: Point;
  r: Word;
  j: Real;
  OKS: String;

Procedure Init;
  Begin
    //Starting Screen
    ClrScr;
    Writeln('Initializing...');

    //Detect GD - Start graph - Check for error
    GD:= Detect;
    InitGraph(GD, GM, '');
    ErC:= GraphResult;
    If Erc = grOK
    Then Writeln('* Graphic Driver Found!')
    Else Writeln('* Error: Graphic Driver Not Found!');

    //Get Driver's Name
    Writeln('* Name of Driver: ', GetDriverName);

    //Resolution
    Writeln('* Resolution: ', GetMaxX, 'x', GetMaxY);
  End;

Procedure Intro;
  Begin
    SetColor(White);
    SetTextStyle(SmallFont, HorizDir, 4);
    OutTextXY(100, 300, 'Electronic Ignition System Simulator');
    SetTextStyle(SmallFont, HorizDir, 2);
    OutTextXY(500, 500, 'Created by: Minh Nhat');
  End;

Procedure Background;
  Begin
    //Set Background Color
    Write('_ Setting Background... ');
    SetFillStyle(SolidFill, White);
    Bar(1, 1, GetMaxX, GetMaxY);
    Writeln('Done!');
  End;

Procedure Gridlines;
  Begin
    Write('_ Creating Gridlines... ');
    //Set Gridlines Color
    SetColor(7);

    //Horizontal
    i:= 0;
    Repeat
      Line(1, i, GetMaxX, i);
      i:= i + gld;
    Until (i>GetMaxY);

    //Vertical
    i:= 0;
    Repeat
      Line(i, 1, i, GetMaxY);
      i:= i + gld;
    Until (i>GetMaxX);
    Writeln('Done!');
  End;

Procedure W4k;
  Begin
    Readln;
  End;

Procedure PCor;
  Begin
    pA.x:= x0;
    pA.y:= y0;
    pB.x:= x0;
    pB.y:= y0 + 400;
    pC.x:= x0 + 75;
    pC.y:= y0 + 50;
    pD.x:= x0 + 75;
    pD.y:= y0 + 400;
    pE.x:= x0 + 150;
    pE.y:= y0 + 50;
    pF.x:= x0 + 150;
    pF.y:= y0 + 250;
    pG1.x:= x0 + 175;
    pG1.y:= y0 + 250;
    pG2.x:= x0 + 175;
    pG2.y:= y0 + 400;
    pH.x:= x0 + 200;
    pH.y:= y0 + 50;
    pI.x:= x0 + 200;
    pI.y:= y0 + 250;
    pJ.x:= x0 + 275;
    pJ.y:= y0 + 50;
    pK.x:= x0 + 275;
    pK.y:= y0 + 200;
    pL.x:= x0 + 325;
    pL.y:= y0;
    pM.x:= x0 + 325;
    pM.y:= y0 + 200;
    pN.x:= x0 + 375;
    pN.y:= y0;
    pO.x:= x0 + 375;
    pO.y:= y0 + 200;
    pP1.x:= x0 + 400;
    pP1.y:= y0 + 300;
    pP2.x:= x0 + 375;
    pP2.y:= y0 + 275;
    pQ.x:= x0 + 375;
    pQ.y:= y0 + 400;
    pR.x:= x0 + 425;
    pR.y:= y0 + 50;
    pS.x:= x0 + 425;
    pS.y:= y0 + 300;
    pT.x:= x0 + 550;
    pT.y:= y0 + 50;
    pU.x:= x0 + 550;
    pU.y:= y0 + 275;
    pV.x:= x0 + 568;
    pV.y:= y0 + 275;
    pW.x:= x0 + 568;
    pW.y:= y0 + 337;
    pX.x:= x0 + 580;
    pX.y:= y0;
    pY.x:= x0 + 580;
    pY.y:= y0 + 268;
    pZ.x:= x0 + 637;
    pZ.y:= y0 + 268;
    Centre.x:= x0 + 600;
    Centre.y:= y0 + 300;
    Mag.x:= x0 + 609;
    Mag.y:= y0 + 306;
  End;

Procedure Seg(pM1, pN1: Point);
  Begin
    SetColor(Black);
    Line(pM1.x, pM1.y, pN1.x, pN1.y);
  End;

Procedure Seg2(pM1, pN1: Point);
  Begin
    SetColor(Red);
    Line(pM1.x, pM1.y, pN1.x, pN1.y);
    W4k;
  End;

Procedure Wires01;
  Begin
    //Vertical
    Seg(pA, pB); //AB
    Seg(pC, pD); //CD
    Seg(pE, pF); //EF
    Seg(pH, pI); //HI
    Seg(pG1, pG2); //G1G2
    Seg(pJ, pK); //JK
    Seg(pL, pM); //LM
    Seg(pN, pQ); //NQ
    Seg(pR, pS); //RS
    Seg(pT, pU); //TU
    Seg(pX, pY); //XY
    Seg(pV, pW); //VW
    //Horizontal
    Seg(pA, pL); //AL
    Seg(pC, pE); //CE
    Seg(pH, pJ); //HJ
    Seg(pF, pI); //FI
    Seg(pK, pO); //KO
    Seg(pN, pX); //NX
    Seg(pR, pT); //RT
    Seg(pS, pP1); //SP1
    Seg(pU, pV); //UV
    Seg(pY, pZ); //YZ
    //Diagonal
    Seg(pP1, pP2); //P1P2
  End;

Procedure iGr(x: Integer);
  Begin
    SetFillStyle(SolidFill, Black);
    Bar(x-12, (y0 + 400), x+12, (y0 + 401));
    Line(x-6, (y0 + 405), x+6, (y0 + 405));
    Line(x-3, (y0 + 410), x+3, (y0 + 410));
  End;

Procedure Ground;
  Begin
    iGr(x0);
    iGr(x0 + 75);
    iGr(x0 + 175);
    iGr(x0 + 375);
    //Magneto
  End;

Procedure Plug;
  Begin
    SetColor(White);
    Line(pC.x, (y0+292), pC.x, (y0+308));
    SetColor(Blue);
    For i:= 1 to 5
    Do
      Begin
        //Above
        Line((pC.x-i), (y0+292-2*i+1), (pC.x+i), (y0+292-2*i+1));
        Line((pC.x-i), (y0+292-2*i), (pC.x+i), (y0+292-2*i));
        //Below
        Line((pC.x-i), (y0+308+2*i-1), (pC.x+i), (y0+308+2*i-1));
        Line((pC.x-i), (y0+308+2*i), (pC.x+i), (y0+308+2*i));
      End;
  End;

Procedure Switch;
  Begin
    SetColor(White);
    Line((x0+145), y0, (x0+180), y0);
    SetColor(Blue);
    Circle((x0+150), y0, 5);
    Circle((x0+175), y0, 5);
    Line((x0+150), (y0-5), (x0+175), (y0-20));
  End;

Procedure Transformer;
  Begin
    //Erase
    SetColor(White);
    Line(pF.x, (y0+130), pF.x, (y0+170));
    //Box Border
    Line(pI.x, (y0+130), pI.x, (y0+170));
    SetColor(Blue);
    Rectangle((pF.x-20), (y0+100), (pI.x+20), (y0+200));
    //Primary
    ct.y:= y0+130;
    r:= 40 div 5;
    Repeat
      ct.y:= ct.y + r;
      Arc(pI.x, ct.y, 90, 270, r);
    Until (ct.y+r) >= (y0+170);
    //Secondary
    ct.y:= y0+130;
    r:= 40 div 8;
    Repeat
      ct.y:= ct.y + r;
      SetColor(Blue);
      Circle(pF.x, ct.y, r);
      SetColor(White);
      Arc(pF.x, ct.y, 270, 90, r);
    Until (ct.y+r) >= (y0+170);
    //Lines
    SetColor(Black);
    Line((pG1.x-10), (y0+130), (pG1.x-10), (y0+170));
    Line((pG1.x+10), (y0+130), (pG1.x+10), (y0+170));
  End;

Procedure Capacitor;
  Begin
    SetColor(White);
    Line((x0+292), (y0+200), (x0+308), (y0+200));
    SetColor(Blue);
    SetFillStyle(SolidFill, Blue);
    Bar((x0+292), (y0+190), (x0+296), (y0+210));
    Bar((x0+304), (y0+190), (x0+308), (y0+210));
  End;

Procedure iRec(x, y, z: Word);
  Begin
    SetColor(White);
    Line(x, y, x, (y-9));
    SetColor(z);
    Line((x-9), y, (x+9), y);
    Line((x-9), (y-9), (x+9), (y-9));
    Line((x-9), (y-9), x, y);
    Line(x, y, (x+9), (y-9));
  End;

Procedure Rectifier;
  Begin
    iRec(pN.x, (y0+150), Blue); //D1
    iRec(pR.x, (y0 + 150), Blue); //D2
    iRec(pP2.x, pP2.y, Blue); //DDK
    SetTextStyle(SmallFont, Horizdir, 1);
    OutTextXY((pN.x-40), pP2.y, 'OFF');
  End;

Procedure Magneto;
  Begin
    SetColor(Black);
    Circle(Centre.x, Centre.y, 50);
    //Powersource Wire - YZ
    ct.x:= (pY.x + pZ.x) div 2 - 20;
    ct.y:= pY.y;
    SetColor(White);
    Line(ct.x, ct.y, (ct.x+40), ct.y);
    r:= 40 div 6;
    SetColor(Blue);
    Repeat
      ct.x:= ct.x + r;
      Arc(ct.x, ct.y, 0, 180, r);
    Until (ct.x+r) >= ((pY.x + pZ.x) div 2 + 20);
    //Controlling Wire - VW
    ct.x:= pV.x;
    ct.y:= (pV.y + pW.y) div 2 - 20;
    SetColor(White);
    Line(ct.x, ct.y, ct.x, (ct.y+40));
    r:= 40 div 8;
    SetColor(Blue);
    Repeat
      ct.y:= ct.y + r;
      Arc(ct.x, ct.y, 90, 270, r);
    Until (ct.y+r) >= ((pV.y + pW.y) div 2 + 20);
    //Magnet
    SetFillStyle(SolidFill, Blue);
    Bar((Mag.x-20), (Mag.y-5), Mag.x, (Mag.y+5));
    SetFillStyle(SolidFill, Red);
    Bar((Mag.x+20), (Mag.y-5), Mag.x, (Mag.y+5));
    SetFillStyle(SolidFill, White);
    PieSlice(Mag.x, Mag.y, 0, 360, 3);
    //Text
    SetColor(Black);
    SetTextStyle(SmallFont, HorizDir, 1);
    OutTextXY((x0+609), (y0+250), 'N');
    OutTextXY((x0+532), (y0+306), 'DK');
  End;

Procedure SetUp;
  Begin
   Background;
   PCor;
   Wires01;
   Ground;
   Plug;
   Switch;
   Transformer;
   Capacitor;
   Rectifier;
   Magneto;
  End;

Procedure MagSP(i: Word);
  Begin
    SetFillStyle(SolidFill, White);
    Bar((Mag.x-20), (Mag.y-20), (Mag.x+20), (Mag.y+20));
    //1
    Case i Of
    1:
      Begin
        SetFillStyle(SolidFill, Blue);
        Bar((Mag.x-5), Mag.y, (Mag.x+5), (Mag.y+20));
        SetFillStyle(SolidFill, Red);
        Bar((Mag.x-5), (Mag.y-20), (Mag.x+5), Mag.y);
        SetFillStyle(SolidFill, White);
        PieSlice(Mag.x, Mag.y, 0, 360, 3);
      End;
    //2
    2:
      Begin
        SetFillStyle(SolidFill, Blue);
        Bar(Mag.x, (Mag.y-5), (Mag.x+20), Mag.y+5);
        SetFillStyle(SolidFill, Red);
        Bar((Mag.x-20), (Mag.y-5), Mag.x, Mag.y+5);
        SetFillStyle(SolidFill, White);
        PieSlice(Mag.x, Mag.y, 0, 360, 3);
      End;
    //3
    3:
      Begin
        SetFillStyle(SolidFill, Blue);
        Bar((Mag.x-5), Mag.y, (Mag.x+5), (Mag.y+20));
        SetFillStyle(SolidFill, Red);
        Bar((Mag.x-5), (Mag.y-20), (Mag.x+5), Mag.y);
        SetFillStyle(SolidFill, White);
        PieSlice(Mag.x, Mag.y, 0, 360, 3);
      End;
    End;
  End;

Procedure iSin(d: word);
  Begin
    A.x:= 0; A.y:= 0;
    For i:= 1 to d
    Do
      Begin
        j:= Sin((i+180)*3.1416/180);
        B.x:= Round(i*Xres);
        B.y:= Round(j*Yres);
        MoveTo(A.x+z1, A.y+t1);
        LineTo(B.x+z1, B.y+t1);
        A:= B;
      End;
    A.x:= 0; A.y:= 0;
    For i:= 1 to d
    Do
      Begin
        j:= Sin((i+90)*3.1416/180);
        B.x:= Round(i*Xres);
        B.y:= Round(j*Yres);
        MoveTo(A.x+z2, A.y+t2);
        LineTo(B.x+z2, B.y+t2);
        A:= B;
      End;
  End;

Procedure SinGraph(i: word);
  Begin
    If i = 1
    Then
      Begin
        SetColor(Red);
        iSin(90);
        SetColor(White);
        Line(z2, t2, z2, t2+30);
        SetColor(Black);
        Line(150, 500, 400, 500);
        Line(150, 600, 400, 600);
        SetTextStyle(SmallFont, Horizdir, 2);
        OutTextXY(125, 485, 'N');
        OutTextXY(175, 485, '+');
        OutTextXY(175, 500, '-');
        OutTextXY(125, 585, 'DK');
        OutTextXY(175, 585, '+');
        OutTextXY(175, 600, '-');
      End
    Else iSin(360);
  End;

Procedure Stage1;
  Begin
    Writeln('*Stage 1');
    MagSP(1); W4k;
    SinGraph(1); W4k;
    Seg2(pX, pY);
    Seg2(pN, pX);
    Seg2(pO, pN);
    Line(pO.x, pO.y, (x0+308), pO.y); W4k;
    SetFillStyle(SolidFill, Red);
    Bar((x0+292), (y0+190), (x0+296), (y0+210));
    Bar((x0+304), (y0+190), (x0+308), (y0+210)); W4k;
    OKS:= '';
    Writeln('End of Stage 1: OK?');
    Repeat
      Readln(OKS);
    until OKS = 'OK';
    Writeln('___________________');
  End;

Procedure Stage2;
  Begin
    Writeln('*Stage 2');
    MagSP(2); W4k;
    SinGraph(2); W4k;
    Seg2(pV, pU);
    Seg2(pU, pT);
    Seg2(pT, pR);
    Seg2(pR, pS);
    Seg2(pS, pP1);
    Seg2(pP1, pP2);
    iRec(pP2.x, pP2.y, Red); W4k;
    SetFillStyle(SolidFill, White);
    Bar(pN.x-40, pP2.y-10, pN.x-15, pP2.y+20);
    SetColor(Red);
    SetTextStyle(SmallFont, Horizdir, 1);
    OutTextXY((pN.x-30), pP2.y, 'ON'); W4k;
    OKS:= '';
    Writeln('End of Stage 2: OK?');
    Repeat
      Readln(OKS);
    until OKS = 'OK';
    Writeln('___________________');
  End;

Procedure Stage3;
  Begin
    Writeln('*Stage 3');

    Seg2(pP2, pQ);
    Seg2(pQ, pG2);
    Seg2(pG2, pG1);
    Seg2(pG1, pI);
    Seg2(pI, pH);
    Seg2(pH, pJ);
    Seg2(pJ, pK);
    Line(pK.x, pK.y, x0+292, pK.y); W4k;
    SetFillStyle(SolidFill, Blue);
    Bar((x0+292), (y0+190), (x0+296), (y0+210));
    Bar((x0+304), (y0+190), (x0+308), (y0+210)); W4k;
    OKS:= '';
    Writeln('End of Stage 3: OK?');
    Repeat
      Readln(OKS);
    until OKS = 'OK';
    Writeln('___________________');
  End;

Procedure Stage4;
  Begin
    Writeln('*Stage 4');
    Seg2(pF, pE);
    Seg2(pE, pC);
    Line(pC.x, pC.y, pC.x, (y0+292)); W4k;
    SetFillStyle(SolidFill, Red);
    PieSlice(pC.x, (y0+300), 0, 360, 4); W4k;
    OKS:= '';
    Writeln('End of Stage 4: OK?');
    Repeat
      Readln(OKS);
    until OKS = 'OK';
    Writeln('___________________');
  End;

Procedure OffMode;
  Begin
    SetUp;
    Writeln('Press Enter to continue!'); Readln;
    Writeln('Off Mode');
    SetColor(White);
    Line((x0+150), (y0-5), (x0+175), (y0-20));
    SetColor(Red);
    Line((x0+150), (y0-5), (x0+175), (y0-5));
    W4k;
    Seg2(pY, pX);
    Seg2(pX, pN);
    Seg2(pN, pO);
    Seg2(pO, pM);
    Seg2(pM, pL);
    Seg2(pL, pA);
    Seg2(pA, pB);
    Writeln('End of OffMode: OK?');
    Repeat
      Readln(OKS);
    until OKS = 'OK';
    Writeln('___________________');
    Writeln('That is the end of the program! Thank you for using!');
    Readln
  End;

Begin
   Init;
   Intro;
   Readln;
   SetUp;
   Readln;
   Stage1;
   Stage2;
   Stage3;
   Stage4;
   OffMode;
End.