// Jérôme Fafchamps (c) http://www.fafchamps.be
// Licence : libre d'utilisation

unit Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Buttons;

type
  TForm2 = class(TForm)
    StaticText1: TStaticText;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Déclarations privées }
  public
    { Déclarations publiques }
  end;

var
  Form2: TForm2;

implementation

uses Findup;

{$R *.dfm}

procedure TForm2.BitBtn1Click(Sender: TObject);
begin
application.terminate;
end;

procedure TForm2.BitBtn2Click(Sender: TObject);
begin
Form1.Show;
end;

end.
