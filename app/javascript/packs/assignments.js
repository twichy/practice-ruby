document.addEventListener("DOMContentLoaded", function(){
    document.addEventListener('ajax:error', function(event) {
        let detail = event.detail;
        let data = detail[0], status = detail[1], xhr = detail[2];
        alert(data);
    });
});

