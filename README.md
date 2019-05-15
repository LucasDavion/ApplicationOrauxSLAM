# Règles pour le nom de vos scripts

Pour les noms des scripts vous devez mettre le rôle puis le type.
Ex: 
- **admin**_consult_demi_journee_prof.php
- **utilisateur**_choix.php

# Règles pour le nom de vos champs de formulaire

Vous devez utiliser l'abréviation de votre champ en préfixe suivi de ```_nomduchamp```.
Ex :  *(pour une liste)*

````

		<select name="lst_section" class="form-control">
          <option value="test2">test2</option>
          <option value="test1">tesst1</option>
       </select>
       
`````

Abréviations :
![BLABLA](https://zupimages.net/up/19/13/xdk5.png)


# - Règles CSS -
## Bouton 
Si vous souhaitez utiliser des boutons, utilisez la classe  **```btn```** puis la couleur du bouton et sa taille,
Ex :
```html

<input  type="submit"  class="btn btn-success btn-lg"  name="btn_tout-generer"  value="Tout générer">

```

Utilisez ses classe pour vos boutons

Pour des bouton de **Suppression** :

- ```btn btn-danger``` Bouton Rouge

Pour des bouton de **Modification**  :

- ```btn btn-info``` Bouton Bleu Cyan

Pour des bouton de **Validation**  :

- ```btn btn-success``` Bouton Vert


Pour plus d'info sur les boutons cliquer [ICI](https://getbootstrap.com/docs/4.3/components/buttons/)

## Formulaire
Si vous souhaitez utiliser des formulaire, utilisez la classe  **```form-control```** dans vos input,
Ex :
```html

<input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">

```

Chaque option de votre formulaire doit être dans une **div**  et celle ci doit avoir la classe **```form-group```**,

Exemple :

```html
<form>
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
  <div class="form-group form-check">
    <input type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Check me out</label>
  </div>
  <button type="submit" class="btn btn-primary">Submit</button>
</form>
```
N'hésiter pas a copier colle se code afin de voir le rendu !*

Pour plus d'info sur les formulaire cliquer [ICI]([https://getbootstrap.com/docs/4.3/components/forms/](https://getbootstrap.com/docs/4.3/components/forms/))

