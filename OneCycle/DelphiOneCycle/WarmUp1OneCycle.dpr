Program WarmUp1OneCycle;

{
 There are 3 groups of monks: leading, simple and apprentice.
 Introduced how many monks and how many pies.
 Also introduced how much each monk eats.
 The program must calculate the combination of monks.
}

{$APPTYPE CONSOLE}

Var
  MaxM1, M1, M3, M: integer;
  M2, K1, K2, K3, Pies: real;
  Comb: boolean;
  //MaxM1 - maximum number of leading monks
  //M1 - amount of leading monks
  //M2 - amount of simple monks
  //M3 - amount of apprentice monks
  //K1 - the amount, which the leading monks eats
  //K2 - the amount, which the simple monks eats
  //K3 - the amount, which apprentice simple monks eats
  //M - total amount of monks
  //Pies - total amount of pies
  //Comb - if the condition is incorrect, then there will be an error.

Begin
  Writeln('Input condition! Either entered number must be >=0.');
  Writeln('Because there cannot be a negative amount of monks, pies and the amount of pies eaten.');
  Writeln('Also the amount of monks must be an integer.');
  Writeln;
  Writeln('Enter the total amount of monks and pies');
  Read(M);
  Readln(Pies);
  Writeln('Enter how many pies the leading monks eat');
  Readln(K1);
  Writeln('Enter how many pies the simple monks eat');
  Readln(K2);
  Writeln('Enter how many pies the apprentice monks eat');

  //Because the formula for M2 has K2-K3 in the denominator, and it cannot be equal 0.
  Writeln('Input condition! The apprentice monks cant eat as simple');

  Readln(K3);

  if (M<0) or (Pies<0) or (K1<0) or (K2<0) or (K3<0) or (K2=K3) then
    Writeln('Input condition violated! Restart the program.')

  else
  begin

    //Check K1 to find the maximum amount. If K1=0, then the maximum amount is also 0.
    if K1 = 0 then
      MaxM1:=0

    //Else we will find the maximum number using the formula
    else
    begin

      //Find the integer maximum number of leaders.
      MaxM1:= Trunc(Pies/K1);

      //The maximum amount of leading monks must be less than the total amount of monks.
      //Else the maximum number is equated to the total number
      if MaxM1 > M then
        MaxM1:= M;
    end;

    //If the program finds a combination, the Comb will be true.
    Comb:= False;

    //Iterate over leading monks, varying from 0 to the maximum amount of leading monks.
    For M1:=0 to MaxM1 do
    begin

      //Using the system consisting of M1+M2+M3 =M and M1*K1 + M2*K2 + M3*K3 =Pies,
      //we find the value of M2.
      M2:= (K3 * (M - M1) - Pies + M1 * K1)/(K3 - K2);

      //Checking, if M2 are positive and integer,
      //and amount of leading + simple <= total number, then found a combination.
      if (M2 >= 0) and (Frac(M2) = 0) and (M1 + M2 <= M) then
      begin
        Comb:= True;
        M3:= M - M1 - Trunc(M2);
        Writeln('Ñombination is found! Amount of leading monks: ', M1, ', amount of simple monks: ', M2:0:0, ', amount of apprentice monks: ', M3);
      end;
    end;

    //If the combination is not found, write an error
    if Comb = False then
      Writeln('Error. There is no such combination of monks.');
  end;

  Readln;
End.
