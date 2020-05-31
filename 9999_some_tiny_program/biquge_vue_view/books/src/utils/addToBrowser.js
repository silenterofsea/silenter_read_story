function addFavo(sURL, sTitle)
{
    try
    {
        window.external.addFavorite(sURL, sTitle);
    }
    catch (e)
    {
        try
        {
            window.sidebar.addPanel(sTitle, sURL, "");
        }
        catch (e)
        {
            alert("加入收藏失败，有劳您手动添加。");
        }
    }
}

export default addFavo;

/******
<script type="text/javascript">
function AddFavorite(sURL, sTitle)
{
    try
    {
        window.external.addFavorite(sURL, sTitle);
    }
    catch (e)
    {
        try
        {
            window.sidebar.addPanel(sTitle, sURL, "");
        }
        catch (e)
        {
            alert("加入收藏失败，有劳您手动添加。");
        }
    }
}
</script>
<a href="JavaScript:window.external.AddFavorite('https://blog.csdn.net/gqzydh','Page')"> <font color="white"> 

******/
