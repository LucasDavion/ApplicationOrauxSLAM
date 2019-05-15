# 📜 Règles pour le nom de vos scripts

Pour les noms des scripts vous devez mettre le rôle puis le type.
Ex: 

- **admin**_consult_demi_journee_prof.php
- **utilisateur**_choix.php

# 📜 Règles pour le nom de vos champs de formulaire

Vous devez utiliser l'abréviation de votre champ en préfixe suivi de **```_nomduchamp```**.
Ex :  *(pour une liste)*

````html
<select name="lst_section" class="form-control">
    <option value="test2">test2</option>
    <option value="test1">tesst1</option>
</select>
````

Abréviations :

![BLABLA](https://zupimages.net/up/19/13/xdk5.png)


# 📜 Règles CSS -

## ➡️ Bootstrap

Pour utiliser bootstrap ajouter l'une de ses ligne de code dans votre ```head``` puis ajouter le fichier bootstrap dans un dossier ```css```

- Pour **```bootstrap.css```** :
```html
<link  rel="stylesheet"  href="css/bootstrap.css">
```

- Pour **```bootstrap.min.css```** :
```html
<link  rel="stylesheet"  href="css/bootstrap.min.css">
```

## ➡️ Les Boutons 

Si vous souhaitez utiliser des boutons, utilisez la classe  **```btn```** puis la couleur du bouton et sa taille,
Ex :

```html
<input  type="submit"  class="btn btn-success btn-lg"  name="btn_tout-generer"  value="Tout générer">
```

Utilisez ses classe pour vos boutons

Pour des bouton de **Suppression** :

- **```btn btn-danger```** Bouton Rouge

Pour des bouton de **Modification**  :

- **```btn btn-info```** Bouton Bleu Cyan

Pour des bouton de **Validation**  :

- **```btn btn-success```** Bouton Vert


Pour plus d'info sur les boutons cliquer [ICI](https://getbootstrap.com/docs/4.3/components/buttons/)

## ➡️ Les Formulaires

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

## ➡️ Les Tableaux

Si vous avez besoin d'utiliser un tableau :

- Utiliser la classe **```table table-striped```**  pour la balise ```table```
- Utiliser la classe **```thead-dark```** dans votre balise ```thead```
- Utiliser **```scope="col"```** dans vos baliser th

Aider vous de cet exemple pour mieux comprendre :

```html
<table class="table table-striped">
  <thead classe="thead-dark">
    <tr>
      <th scope="col">#</th>
      <th scope="col">First</th>
      <th scope="col">Last</th>
      <th scope="col">Handle</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <th scope="row">1</th>
      <td>Mark</td>
      <td>Otto</td>
      <td>@mdo</td>
    </tr>
    <tr>
      <th scope="row">2</th>
      <td>Jacob</td>
      <td>Thornton</td>
      <td>@fat</td>
    </tr>
  </tbody>
</table>
```

Pour plus d'info sur les tableaux cliquer [ICI](https://getbootstrap.com/docs/4.3/content/tables/)

# 📜 Utiliser des images 

Si vous avez besoin d'utiliser des images utiliser un dossier **```/images```** pour y placer vos images

# 📜 Utiliser des fonts

Si vous avez besoin d'utiliser des fonts utiliser un dossier **```/fonts```** pour y placer vos fonts
