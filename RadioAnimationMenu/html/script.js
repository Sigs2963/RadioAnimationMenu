document.addEventListener('DOMContentLoaded', () => {
    const container = document.getElementById('container');

    function post(event, data = {}) {
        fetch(`https://${GetParentResourceName()}/${event}`, {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json; charset=UTF-8',
            },
            body: JSON.stringify(data),
        }).catch(err => console.error(err));
    }

    window.addEventListener('message', (event) => {
        const item = event.data;
        if (item.type === 'ui') {
            if (item.status === true) {
                container.classList.add('visible');
            } else {
                container.classList.remove('visible');
            }
        }
    });

    document.querySelectorAll('.option').forEach(option => {
        option.addEventListener('click', () => {
            const animName = option.dataset.anim;
            post('playAnim', { anim: animName });
        });
    });

    document.addEventListener('keydown', (e) => {
        if (e.key === 'Escape') {
            post('close');
        }
    });
});