addToWishlist = function(productId,userId,urlPath){
    $.ajax({
        type: "get",
        data: "product_variant_id="+productId+"&user_id="+userId,
        url: urlPath
    })
    $("#addWishlistButton").removeClass("inline");
    $("#addWishlistButton").addClass("hidden");
    $("#removeFromWishlist").removeClass("hidden");
    $("#removeFromWishlist").addClass("inline");
}
removeFromWishlist = function(productId,userId,urlPath){
    $.ajax({
        type: "get",
        data: "product_variant_id="+productId+"&user_id="+userId,
        url: urlPath
    })
    $("#removeFromWishlist").removeClass("inline");
    $("#removeFromWishlist").addClass("hidden");
    $("#addWishlistButton").removeClass("hidden");
    $("#addWishlistButton").addClass("inline");
}