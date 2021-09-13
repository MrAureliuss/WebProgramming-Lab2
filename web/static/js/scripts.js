function checkYData() {
    let y = document.getElementById("y").value.replace(",", ".");

    if (y === "-") { return; }

    if (y === "" || !isFinite(y) || y < -5 || y > 5) {
        document.getElementById("y").setAttribute("style", "border: 2px solid red;")
        document.getElementById("y").value = "";
    } else {
        document.getElementById("y").setAttribute("style", "border: 2px solid green;")
    }
}

function showTable() {
    document.getElementById('infoContent').style.visibility = "hidden";
    document.getElementById('table').style.visibility = "visible";

    document.getElementById("tableButton").onclick = hideTable;
}

function hideTable() {
    document.getElementById('infoContent').style.visibility = "visible";
    document.getElementById('table').style.visibility = "hidden";

    document.getElementById("tableButton").onclick = showTable;
}

function extraValidate() {
    let y = document.getElementById("y").value.replace(",", ".")
    if (y === "-") {
        alert('Значение поля "Y" не соотетствует требованиям!')
        return false
    }

}

let currentX = 0;

function setCurrentX(newX) {
    changeXValue(newX);
    clear_all_selected();
    document.getElementById("x-"+newX).classList.add("selected");
    currentX = newX;
}

function getCurrentX() {
    return currentX;
}


function clear_all_selected() {
    for (let i = -5; i <= 3; i++) {
        document.getElementById("x-"+i).classList.remove("selected");
    }
}