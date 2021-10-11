// Jérôme Fafchamps (c) http://www.fafchamps.be
// Licence : libre d'utilisation

unit Findup;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, FileCtrl, UCoeur, Utable, Menus, ComCtrls, Grids, UClef, UAttribut;

type
  TForm1 = class(TForm)
    DriveComboBox1: TDriveComboBox;
    DirectoryListBox1: TDirectoryListBox;
    Button1: TButton;
    Memo1: TMemo;
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    Quitterlapplication1: TMenuItem;
    Button2: TButton;
    ProgressBar1: TProgressBar;
    Findup: TGroupBox;
    Outls1: TMenuItem;
    Clear1: TMenuItem;
    procedure DirectoryListBox1Click(Sender: TObject);
    procedure DriveComboBox1Change(Sender: TObject);
    procedure DirectoryListBox1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Quit1Click(Sender: TObject);
    procedure Quitterlapplication1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);

  private
    { Déclarations privées }
  public
    { Déclarations publiques }

  end;
 procedure affiche_dans_memo (const c : Tclef; a : Tattribut);
var
  Form1: TForm1;
  resultat : boolean;
  compteur : integer;

implementation

uses Unit2;

{$R *.dfm}

procedure affiche_dans_memo (const c : Tclef; a : Tattribut);
begin
   inc(compteur);
   Form1.Memo1.Lines.Add(c.nom + ' (' + SizeToStr(c.taille) + ' ' + DateToStr(FileDateToDateTime(c.time)) + ') - ' + a.chemin);
end;

procedure TForm1.DirectoryListBox1Click(Sender: TObject);
begin
//permet de ne faire qu'un clic au lieu de deux dans la liste
DirectoryListBox1.opencurrent;
end;

procedure TForm1.DriveComboBox1Change(Sender: TObject);
begin
//on envoie le changement de disque vers la liste des fichiers
DirectoryListBox1.Drive:=DriveComboBox1.Drive;
end;

procedure TForm1.DirectoryListBox1Change(Sender: TObject);
begin
//on envoie au mémo pour tester
//Memo1.Lines.Add(DirectoryListBox1.Directory);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin
resultat:=false;
compteur:=0;
//on envoie au coeur pour effectuer la recherche
ProgressBar1.Visible:=true;
Button1.Enabled:=false;
//on prend la place mémoire
UTable.creer(t);
//on clique, on mets la position à 1 pour que l'user sache que le prog à pris en
//compte ça demande
ProgressBar1.Position:=25;
Ucoeur.memoire(DirectoryListBox1.Directory);
//le prog à mis en mémoire en table de hachage donc on affiche qu'on est à la moitié
ProgressBar1.Position:=50;
Button1.Enabled:=true;
ProgressBar1.Position:=75;
ProgressBar1.Position:=100;
if (resultat) then
showmessage('Search finished: ' +inttostr(compteur)+ ' results found!') else
showmessage('Search finished - no results found!');
end;

procedure TForm1.Quit1Click(Sender: TObject);
begin
//on ferme l'application
application.terminate;
end;

procedure TForm1.Quitterlapplication1Click(Sender: TObject);
begin
//on ferme l'application
Form2.Show;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
//on nettoie l'écran
Memo1.Clear;
ProgressBar1.Visible:=false;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
//on cache la barre de chargement
ProgressBar1.Visible:=false;
//on nettoie l'écran
Memo1.Clear;
end;



end.
