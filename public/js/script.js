$(function() {
  $('ul.images').cycle({ fx: 'scrollDown' });

  var articles = $("section.content section#one > article"),
  pathname = window.location.pathname,
  hash = window.location.hash;
  if (pathname === "/services") {
    if (hash) { 
      articles.filter(":not(" + hash + ")").hide(); 
      window.scrollTo(0,0);
    } else {
      articles.filter(":not(:first-child)").hide();
    }
    $("li.section > a").click(function() {
      var linkHash = "#" + $(this).attr("href").split("#")[1];
      articles.filter(":not(" + linkHash + ")").hide();
      articles.filter(linkHash).show();
      window.scrollTo(0,0);
      return false;
    });
  }

});
