<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN">
<html>
    <head>
        <title>Libres</title>
        <?= $javascript->link(array("prototype", "effects", "dragdrop", "controls")); ?>
        <?= $html->css(array("default", "autocomplete")); ?>
    </head>
    <body>
        <div id="container">
            <?=$content_for_layout;?>
        </div>
    </body>
</html>