// Jérôme Fafchamps (c) http://www.fafchamps.be
// Licence : libre d'utilisation

unit UCoeur;

interface
uses UTable, UClef, UAttribut;

var t : Table;
clef : Tclef;
attri : Tattribut;

function memoire(const chemin: string):int64;

implementation

uses SysUtils, Findup;

// affiche le nom complet
function nomcomplet(chemin, nom : string):string;
  begin
    result := chemin;
    if Result[Length(result)] <> '\' Then
      result := result + '\';
    result := result + nom;
  end;
  
 //affiche la taille
function taille(const chemin : String):int64;
  const attr : Integer =
          faAnyFile - faVolumeID; 
  var   SearchRec : TSearchRec;
        encore : boolean;
  begin
    result := 0;
    encore := FindFirst(NomComplet(Chemin, '*.*'), attr, SearchRec) = 0;
    while encore do begin
      if (SearchRec.attr and faDirectory) > 0 then begin
        if (SearchRec.Name <> '.') and (SearchRec.Name <> '..') then
          // Appel récursif pour le sous-répertoire trouvé
          inc(Result, Taille(NomComplet(chemin, SearchRec.Name)));
        end
      else
        inc(Result, SearchRec.Size); // Ajoute la taille du fichier
      encore := FindNext(SearchRec) = 0;
    end;
    findclose(SearchRec);
  end;

  // creation de la table
  function memoire(const chemin: string):int64;
    const attr : Integer =
            faAnyFile - faVolumeID;
    var   SearchRec : TSearchRec;
          encore : boolean;
          oc : tclef;
          oa : tattribut;
    begin
    result := 0;
    encore := findfirst(NomComplet(Chemin, '*.*'), attr, SearchRec) = 0;
      while (encore) do begin
        if (SearchRec.attr and faDirectory) > 0 then begin
          if (SearchRec.Name <> '.') and (SearchRec.Name <> '..') then
            inc(Result, memoire(nomComplet(chemin, SearchRec.Name)));
          end
        else
   begin
   //si la liste n'existe pas, alors on ajoute les elements sans vérification dans une liste chainée.
 if (not Utable.existe_dans(UClef.transforme_clef(SearchRec.Name,SearchRec.Size,SearchRec.Time),t,oc,oa)) then begin
 Utable.ajouter(UClef.transforme_clef(SearchRec.Name,SearchRec.Size,SearchRec.Time),UAttribut.transforme_attr(nomcomplet(chemin, SearchRec.Name)),t);
         end
           else
	    begin
            //a partir dici, on sait qu'il y'aura un affichage dans la fenetre (l'element existait), tout depend
            // si element est deja affiche ou non.
            // on annonce qu'il y'aura des resultats trouvés.
            resultat:=true;
            //et pas deja affiche ALORS (avec verification d'elements égaux)
             //on regarde simplement si l'attribut à été affiché
             // affiche_status-->est_il_afficher
	      if (not Utable.affiche_status(UClef.transforme_clef(SearchRec.Name,SearchRec.Size,SearchRec.Time),t)) then
                 begin
 //sinon on affiche le resultat et on change la valeur de laffiche en boolean true
// Affichage de l'element qui est déjà stocké mais pas encore affiché
//et changement du status de lattribut
   UTable.changer_status_attribut(oc,oa,t);
Findup.affiche_dans_memo(oc,oa);
//On envoie l'element courant à l'affichage.
Findup.affiche_dans_memo(UClef.transforme_clef(SearchRec.Name,SearchRec.Size,SearchRec.Time),UAttribut.transforme_attr(nomcomplet(chemin, SearchRec.Name)));

   end
               else
               //sinon on affiche juste lelement en cours (le reste à déjà été affiché).
               //pas besoin de modification parce qu'il n'a pas été stocké en memoire
               //vu que lelement était déjà dans la liste
           begin
	        Findup.affiche_dans_memo(UClef.transforme_clef(SearchRec.Name,SearchRec.Size,SearchRec.Time),UAttribut.transforme_attr(nomcomplet(chemin, SearchRec.Name)));
 end;
 end;
 end;
       encore := findnext(SearchRec) = 0;
      end;
      findclose(SearchRec);
  end;


initialization


end.
