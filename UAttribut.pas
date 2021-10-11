unit UAttribut;
interface

type Tattribut = record
              chemin : string;
              deja_affiche : boolean;
            end;

    // permet de transformer les elements d'un attribut en TAttatribut
     function transforme_attr (chemin:string):tattribut;
     function status_afficher_attr(a:tattribut):boolean;
   // copie les attributs
    procedure copier_attr(var a:tattribut; b:tattribut);

implementation

//on transforme l'attribut en attribut :-)
     function transforme_attr (chemin:string):Tattribut;
     var a : Tattribut;
     begin
         a.chemin:=chemin;
         a.deja_affiche:=false;
         //la conversion totale en record
         result:=a;
      end;

  //retourne la valeur de la variable deja_affiche
  function status_afficher_attr(a:tattribut):boolean;
  begin
         status_afficher_attr:=a.deja_affiche;
  end;

  //copier lattribut :-)
    procedure copier_attr(var a: tattribut; b:tattribut);
    begin
         a.chemin:=b.chemin;
         a.deja_affiche:=b.deja_affiche;
    end;


end.


 
