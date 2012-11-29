<div class="home__search search_form">
    <form action="<?php echo $search_action ?>" method="get" id="search-form">
        <input name="filter_name" type="text" placeholder="Поиск товара" value="<?php if(isset($_REQUEST['filter_name'])){echo $_REQUEST['filter_name'];} ?>"/><button type="submit" class="button">найти</button>
    </form>
</div>