<h1>New Book</h1>
<?= $form->input("title") ?>
<?= $form->input("authors") ?>
<div class="autocomplete" id="authors_lookup_auto_complete"></div>
<?= $javascript->codeBlock("new Autocompleter.Local('authors', 'authors_lookup_auto_complete', ".$authorsForLookup.", { tokens: ',' });"); ?>