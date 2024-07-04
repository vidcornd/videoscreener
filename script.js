window.onload = function() {
    fetch('content/content.txt')
        .then(response => response.text())
        .then(data => {
            const lines = data.split('\n');
            document.getElementById('text-top-left').innerText = lines[0] || '';
            document.getElementById('text-bottom-right').innerText = lines[1] || '';
        })
        .catch(error => console.error('Error loading text file:', error));

        const audio = document.getElementById('background-audio');
    audio.play().catch(error => {
        console.error('Error playing audio:', error);
    });

    const clickToPlay = document.createElement('div');
    clickToPlay.innerText = "Müziği başlatmak için bir yere tıklayıınız";
    clickToPlay.style.position = "absolute";
    clickToPlay.style.top = "90%";
    clickToPlay.style.left = "50%";
    clickToPlay.style.transform = "translate(-50%, -50%)";
    clickToPlay.style.color = "white";
    clickToPlay.style.fontSize = "24px";
    clickToPlay.style.fontWeight = "bold";
    clickToPlay.style.textShadow = "2px 2px 4px #000000";
    clickToPlay.style.zIndex = "1000";
    document.body.appendChild(clickToPlay);

    document.body.addEventListener('click', function() {
        audio.play().catch(error => {
            console.error('Error playing audio:', error);
        });
        document.body.removeChild(clickToPlay);  // Mesajı kaldır
    }, { once: true });

    };
