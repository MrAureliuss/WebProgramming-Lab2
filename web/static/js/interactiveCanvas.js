const zero = 110;
const rConstLength = 80;
let x;
let y;
let r;
let reserveCtx;

function loadCtxURL(ctx) {
    let canvasPic = new Image();
    canvasPic.src = reserveCtx;
    canvasPic.onload = function() { ctx.drawImage(canvasPic, 0, 0) };
}

function clearCanvas() {
    const canvas = document.getElementById('canvas');
    const ctx = canvas.getContext('2d');
    ctx.clearRect(0, 0, canvas.width, canvas.height);
}


function draw() {
    const canvas = document.getElementById('canvas');
    if (canvas.getContext) {
        canvas.addEventListener('click', canvasClicked, false);

        function canvasClicked(e) {
            let element = document.getElementById('canvas');
            let topPos = element.getBoundingClientRect().top + window.scrollY;
            let leftPos = element.getBoundingClientRect().left + window.scrollX;

            x = e.pageX - leftPos - zero;
            y = zero - (e.pageY - topPos);


            r = document.getElementById('select').value;
            if (r !== null){
                x = Math.round(x / rConstLength * r);
                y = (y / rConstLength * r).toFixed(5);

                if (contains([-5, -4, -3, -2, -1, 0, 1, 2, 3], x) && (-5 < y) && (y < 5)) {
                    const YField = document.getElementById('y');
                    YField.value = y;
                    setCurrentX(x);

                    pointDraw()
                }
            } else alert("Выберете радиус");
        }
    }
}


function pointDraw() {
    const canvas = document.getElementById('canvas');
    let xCanvas = zero + x/r*rConstLength;
    let yCanvas = zero - y/r*rConstLength;

    if (canvas.getContext) {
        const ctx = canvas.getContext('2d');
        ctx.clearRect(0, 0, canvas.width, canvas.height);
        loadCtxURL(ctx);
        ctx.beginPath();

        ctx.fillStyle = "#EDB22E";
        ctx.moveTo(125, 35);
        ctx.arc(xCanvas, yCanvas, 3, 0, 2 * Math.PI);
        ctx.fill();
    }
}


function pointOldArc(x, y, r) {
    const canvas = document.getElementById('canvas');
    let xCanvas = zero + x/r*rConstLength;
    let yCanvas = zero - y/r*rConstLength;

    if (canvas.getContext) {
        const ctx = canvas.getContext('2d');
        ctx.beginPath();

        ctx.fillStyle = "#EDB22E";
        ctx.moveTo(125, 35);
        ctx.arc(xCanvas, yCanvas, 3, 0, 2 * Math.PI);
        ctx.fill();
        ctx.save();
        reserveCtx = canvas.toDataURL();
    }
}

function update() {
    r = document.getElementById('select').value;
    y = document.getElementById('y').value.trim().replace(",", ".");
    x = getCurrentX().toString();

    if (contains(["-5", "-4", "-3", "-2", "-1", "0", "1", "2", "3"], x)
        && (y !== "") && (-5 < y) && (y < 5) &&
        contains(['1', '1.5', '2', '2.5', '3'], r)) pointDraw();
    else {
        const canvas = document.getElementById('canvas');
        if (canvas.getContext) {
            const ctx = canvas.getContext('2d');
            ctx.clearRect(0, 0, canvas.width, canvas.height);
            loadCtxURL(ctx);
        }
    }
}


function contains(a, obj) {
    for (let i = 0; i < a.length; i++) {
        if (a[i] === obj)
            return true;
    }
    return false;
}