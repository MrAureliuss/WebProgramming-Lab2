function regularTableX() {
    $('.xButton').each(function () {
        $(this).attr("style", "stroke-width: 2; stroke: #C8CCD4;");
    });
}   // При нажатии на кнопку из x'ов - меняем цвет их заднего фона.

function changeXValue(clickedX) {
    document.getElementById("x").value = clickedX;
}
