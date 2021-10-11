program Project1;

uses
  Forms,
  Findup in 'Findup.pas' {Form1},
  UAttribut in 'UAttribut.pas',
  UClef in 'UClef.pas',
  UCoeur in 'UCoeur.pas',
  Uliste in 'Uliste.pas',
  UTable in 'UTable.pas',
  Unit2 in 'Unit2.pas' {Form2};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'Findup par Jérôme Fafchamps';
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.Run;
end.
