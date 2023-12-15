program WordleGame;

uses

  Crt; 
const
 Words: array[1..20] of string = ('MINUM', 'BUAYA', 'LASER', 'MUSIK', 'KURSI','POHON','MOBIL','HUTAN','GELAP','ORANG',
                                   'MAKAN', 'JUMBO', 'ZEBRA', 'TUGAS', 'PINTU','CINTA','DAMAI','EMBER','LAMPU','JALAN');
var
  TargetWord: string;
  GuessedWord: string;
  MaxAttempts,RandomIndex: integer;
  ulang:char;

procedure InitializeGame;
begin
  randomize;
  RandomIndex := Random(20) + 1;
  TargetWord := Words[RandomIndex];
  MaxAttempts := 6;
  GuessedWord := StringOfChar('_', Length(TargetWord));
end;

procedure DisplayWord;
var
  i: integer;
begin
  for i := 1 to Length(GuessedWord) do
  begin
    if Pos(GuessedWord[i], TargetWord) > 0 then
    begin
    if GuessedWord[i] = TargetWord[i] then
    begin
      Textcolor(green);
      write(GuessedWord[i]);END
      else
      begin
      Textcolor(yellow);
      write(GuessedWord[i]);END;
    end
    else
    begin
      TextCOLOR(BlacK); 
      write(GuessedWord[i]);
    end;
  end;
  TextBackground(Black); 
  writeln;
end;

procedure DisplayAttemptsRemaining(AttemptsRemaining: integer);
begin
  TEXTCOLOR(WHITE);
  writeln('Sisa percobaan: ', AttemptsRemaining);
end;

procedure TakeGuess;
var
  Guess: string;
begin
  write('Masukkan tebakan: ');
  readln(Guess);
  Guess:= upcase(Guess);
  if Length(Guess) <> Length(TargetWord) then
    writeln('Tebakan harus memiliki panjang yang sama dengan kata target.')
  else
    GuessedWord := Guess;
end;

function CheckGuess: boolean;
begin
  CheckGuess := GuessedWord = TargetWord;
end;

procedure PlayWordleGame;
var
  AttemptsRemaining: integer;
begin
  InitializeGame;
  AttemptsRemaining := MaxAttempts;
  Textcolor(11);
  writeln('Selamat datang di Wordle Game!');
  DisplayWord;

  while (AttemptsRemaining > 0) and (not CheckGuess) do
  begin
    DisplayAttemptsRemaining(AttemptsRemaining);
    TakeGuess;
    if not CheckGuess then
    begin
      writeln('Tebakan salah. Coba lagi.');
      Dec(AttemptsRemaining);
    end;
    DisplayWord;
  end;

  if CheckGuess then
    writeln('Selamat! Anda berhasil menebak kata "', TargetWord, '".')
  else
    Textcolor(red);
    writeln('Maaf, Anda kehabisan percobaan. Kata yang benar adalah "', TargetWord, '".');
end;

begin
  repeat  
  ClrScr; 
  PlayWordleGame;
  write('apakah ingin mengulang?(y/n) ');
  readln(ulang);
  until (ulang = 'n') or (ulang = 'N');
end.