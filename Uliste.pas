// J�r�me Fafchamps (c) http://www.fafchamps.be
// Licence : libre d'utilisation

unit Uliste;

interface
uses UAttribut, UClef;

type Liste = ^cellule;
   Cellule = record
       clef     : tclef;
       attribut : tattribut;
       svt      : liste;
   end;

   function existe(c:tclef; l:liste; out oc:tclef; out oa:tattribut):boolean;
   function est_il_afficher(c:tclef; l:liste):boolean;
   procedure creer(out l:liste);
   procedure ajouter_simple(const c:tclef; a:tattribut; var l:liste);
   procedure changer_attribut(c:tclef; var l:liste);

   implementation

     //true si liste vide sinon false.
     function liste_vide(l:liste):boolean;
     begin
         //verif si la liste est vide
          liste_vide := (l = nil);
     end;

     //true si l'element existe et �gaux a l'element
     //renvoie oc = la clef qui est d�j� stock�
     //renvoie oa = l'attribut qui est d�j� stock�
     function existe(c:tclef; l:liste; out oc:tclef; out oa:tattribut):boolean;
     var tmp : liste;
     begin
     tmp:=l;
      if liste_vide(tmp) then existe:=false
      //si la clef est �gale
      //on ressort oc et oa
      //et on le r�envoie (pas via cette fonction) � UCoeur/Memoire.
       else if egale_clef(tmp^.clef,c) then
           begin
             Uclef.copier_clef(oc,tmp^.clef);
             Uattribut.copier_attr(oa,tmp^.attribut);
             existe:=true;
           end
           //m�thode r�cursive
        	 else existe:=existe(c,tmp^.svt,oc,oa);
       end;

     //creation de liste
     procedure creer(out l:liste);
     begin
          l := (nil);
     end ;

//ajoute un element 'simple' dans une liste sans v�rification
//ajout en tete de liste
         procedure ajouter_simple(const c:tclef; a:tattribut; var l:liste);
         var tmp : liste;
         begin
           //creation d'un nouveau pointeur
              new(tmp);
              //on utilise les fonctions des autres unit�s
              Uclef.copier_clef(tmp^.clef,c);
              Uattribut.copier_attr(tmp^.attribut,a);
              tmp^.svt := l;
              l:=tmp;
           end;

           //chercher lelement dans la liste chainee en v�rifiant
           //bien si la clef est �gale ! Si c'est le cas, on retourne le tampom
           function element_dans_liste(c:tclef; l:liste):liste;
    var tmp : liste;
    begin
    tmp:=l;
      if liste_vide(tmp) then element_dans_liste:=nil
       else if (UClef.egale_clef(c,tmp^.clef)) then element_dans_liste:=tmp
    	 else element_dans_liste:=element_dans_liste(c,tmp^.svt);
     end;

//est ce que lattribut est deja affich� ?
//cette fonction doit �tre appel� � l'aide
  function est_il_afficher(c:tclef; l:liste):boolean;
  begin
    est_il_afficher:=Uattribut.status_afficher_attr(element_dans_liste(c,l).attribut);
  end;

  //change lattribut en deja affiche pour quil ne soit plus
  //affich�
  procedure changer_attribut(c:tclef; var l:liste);
  begin
  element_dans_liste(c,l).attribut.deja_affiche:=true;
  end;

end.
