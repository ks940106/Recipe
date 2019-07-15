function orderReg(e,recipeNo) {
    var price = $(e).siblings("input").eq(0).val();
    if(!/^[1-9]+[0-9]*$/.test(price)){
        alert("올바른 값을 입력해주세요.");
    }
    else if(confirm(price+"원 으로 등록하시겠습니까?")) {
        $.ajax({
            url: "/orderReg.do",
            type: "GET",
            data: {recipeNo: recipeNo, price: price},
            success: function (message) {
                alert(message);
                location.reload();
            },
            error: function () {
                alert("가격등록 중에 에러가 발생했습니다.");
                location.reload();
            }
        })
    }
}