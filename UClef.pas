// Jérôme Fafchamps (c) http://www.fafchamps.be
// Licence : libre d'utilisation

unit UClef;
interface

type Tclef = record
         nom : string;
         taille : integer;
         time : integer;
       end;

   // transforme les attributs d'un clef en Tclef
   function transforme_clef (nom:string; taille:integer; ttime:integer) : Tclef;

   //0 .. 4294967295 en cardinal
   // fonction de hachage
   function clef(c:tclef):cardinal;

   //permet de voir l'égalité de deux clef.
   //utile pour l'ajout dans une table de hachage/liste
   function egale_clef(c,d : tclef):boolean;

   //permet de transformer la taille du chemin de la clef en byte/octed/ko/mo/go
   function sizetostr(const Size : int64) : string;

      //copie la clef
   procedure copier_clef(var c:tclef; d:tclef);
    
implementation

//a garder pour la fonction convertir la taille!
uses SysUtils;

    //permet de transformer les attributs en clef
   function transforme_clef (nom:string; taille:integer; ttime:integer):Tclef;
   var a : tclef;
   begin
     a.nom:=nom;
     a.taille:=taille;
     a.time:=ttime;
     //conversion en record
     result:=a;
    end;

   //fonction de hachage
   function clef(c:tclef):cardinal;
   var k : integer ;
   begin
     Result := 0 ;
     for k := 1 to length(c.nom) do
      inc(Result,Ord(c.Nom[k]));
      inc(Result,c.Taille);
      inc(Result,c.Time);
   end ;

   //permet de vérifier l'égalité d'une clef.
      function egale_clef(c,d : tclef):boolean;
      begin
         egale_clef:=(c.nom = d.nom) and (c.taille = d.taille) and (c.time = d.time);
      end;

   //transformer en bytes/kb/mb/gb/t
   //fonction pas de moi, trouvé sur internet.
   function sizetostr(const Size : int64) : string;
   begin
      if Size < $000000000400 then
         result := format('%d bytes',[Size])
      else
      if Size < $000000100000 then
         result := format('%.1f Kb',[Size/$000000000400])
      else
      if Size < $000040000000 then
         result := format('%.1f Mb',[Size/$000000100000])
      else
      if Size < $010000000000 then
         result := format('%.2f Gb',[Size/$000040000000])
      else
         result := format('%.2f Tb',[Size/$010000000000])
   end;

      //copier la clef dans une autre:)
   procedure copier_clef(var c:tclef; d:tclef);
   begin
     c.nom :=d.nom;
     c.taille :=d.taille;
     c.time :=d.time;
   end ;

end.