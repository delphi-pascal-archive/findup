// Jérôme Fafchamps (c) http://www.fafchamps.be
// Licence : libre d'utilisation

unit UTable;

interface
uses uliste, uattribut, uclef;

const N=9999999;
type table = array[0..N] of Liste;

function existe_dans(c:tclef; const t:table; out oc:tclef; out oa:tattribut):boolean;
function affiche_status(c:tclef; const t:table):boolean;
procedure creer(out t:table);
procedure ajouter(c:tclef; a:TAttribut; var t:table);
procedure changer_status_attribut(c:tclef; var a : tattribut; var t:table);

implementation

//reste du hachage +1
function hachage(c : tclef):cardinal;
  begin
    result := clef(c) mod N + 1;
  end;

  //existe dans la liste?
function existe_dans(c:tclef; const t:table; out oc:tclef; out oa:tattribut):boolean;
  begin
   existe_dans:=(Uliste.existe(c,t[hachage(c)],oc,oa));
  end;

//affiche le status est-telle-deja affichée?
function affiche_status(c:tclef; const t:table):boolean;
  begin
    affiche_status:=(Uliste.est_il_afficher(c,t[hachage(c)]));
  end;

//crée un tableau de N element (memoire statique).
procedure creer(out t : table);
var k : integer ;
  begin
  //commence à 0 la liste des tableaux!
   for k := 0 to N do Uliste.creer(t[k]);
  end;

//fonction principal qui insere dans la liste (hachage)
procedure ajouter(c:tclef; a:tattribut; var t:table);
  begin
   Uliste.ajouter_simple(c,a,t[hachage(c)]);
  end;

//envoie permettant de changer le parametre de l'attribut
procedure changer_status_attribut(c:tclef; var a:tattribut; var t:table);
  begin
  //on renvoie à la liste!
    Uliste.changer_attribut(c,t[hachage(c)]);
  end;

end.