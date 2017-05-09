<template>
	<div id="time">
        <div id="timeText">Time</div>
        <canvas id="canvas" width="150" height="150"></canvas>
    </div>
</template>

<script>
	window.onload = function() {
    var canvas = document.getElementById('canvas');
    var height = canvas.height;
    var width = canvas.width;
    var stander = width / 300;
    var ctx = canvas.getContext('2d');
    var r = width / 2;
    var timeText = document.getElementById('timeText');

    function drawBackground() {
        ctx.save();
        ctx.translate(r, r);
        ctx.lineWidth = 10 * stander;
        ctx.beginPath();
        ctx.arc(0, 0, r - ctx.lineWidth / 2, 0, 2 * Math.PI, false);
        ctx.stroke();

        var hours = [3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 1, 2];
        ctx.font = 18 * stander + 'px Arial';
        ctx.textAlign = 'center';
        ctx.textBaseline = 'middle';
        hours.forEach(function(number, i) {
            var rad = 2 * Math.PI / 12 * i;
            var x = Math.cos(rad) * (r - 36 * stander);
            var y = Math.sin(rad) * (r - 36 * stander);
            ctx.fillText(number, x, y);
        });

        for (var i = 0; i < 60; i++) {
            var rad = 2 * Math.PI / 60 * i;
            var x = Math.cos(rad) * (r - 18 * stander);
            var y = Math.sin(rad) * (r - 18 * stander);
            ctx.beginPath();
            if (i % 5 == 0) {
                ctx.fillStyle = '#000';
                ctx.arc(x, y, 2, 0, 2 * Math.PI, false);
            } else {
                ctx.fillStyle = '#ccc';
                ctx.arc(x, y, 2, 0, 2 * Math.PI, false);
            }
            ctx.fill();
        }
    }

    function drawHour(hour, minute) {
        ctx.save();
        var rad = 2 * Math.PI / 12 * hour + 2 * Math.PI / 12 / 60 * minute;
        ctx.beginPath();
        ctx.rotate(rad);
        ctx.lineWidth = 6 * stander;
        ctx.lineCap = 'round';
        ctx.moveTo(0, 10 * stander);
        ctx.lineTo(0, -r / 2);
        ctx.stroke();
        //reset canvas environment
        ctx.restore();
    }

    function drawMinute(minute) {
        ctx.save();
        var rad = 2 * Math.PI / 60 * minute;
        ctx.beginPath();
        ctx.rotate(rad);
        ctx.lineWidth = 3 * stander;
        ctx.lineCap = 'round';
        ctx.moveTo(0, 10 * stander);
        ctx.lineTo(0, -r + 30 * stander);
        ctx.stroke();
        ctx.restore();
    }

    function drawSecond(second) {
        ctx.save();
        var rad = 2 * Math.PI / 60 * second;
        ctx.beginPath();
        ctx.rotate(rad);
        ctx.lineWidth = 1 * stander;
        ctx.lineCap = 'round';
        ctx.moveTo(0, 10 * stander);
        ctx.lineTo(0, -r + 15 * stander);
        ctx.strokeStyle = '#f00';
        ctx.stroke();
        ctx.restore();
    }

    function drawDoit() {
        ctx.beginPath();
        ctx.arc(0, 0, 3, 0, 2 * Math.PI, false);
        ctx.fillStyle = '#fff';
        ctx.fill();
    }


    function draw() {
        ctx.clearRect(0, 0, width, height);
        var date = new Date();
        var hour = date.getHours();
        var minute = date.getMinutes();
        var second = date.getSeconds();
        drawBackground();
        drawHour(hour, minute);
        drawMinute(minute);
        drawSecond(second);
        drawDoit();
        ctx.restore();
        //dom
        // var time = document.createTextNode('Time: ' + date.toLocaleTimeString());
        // var time = document.createTextNode('Time: ' + hour + ' : ' + minute + ' : ' + second);
        // timeText.replaceChild(time, timeText.firstChild);

        //jscore
        var time = 'Time: ' + date.toLocaleTimeString();
        timeText.innerHTML = time;
    }

    draw();
    setInterval(draw, 1000);
}
</script>

<style scoped>
    #time {
	    /*width: 450px;*/
	    /*height: 450px;*/
	    /*margin: 60px auto 0px;*/
	    text-align: center;
	}
    
    #timeText {
        margin-bottom: 20px;
        font-family: "Arial";
        font-size: 20px;
        color: #f00;
    }
</style>