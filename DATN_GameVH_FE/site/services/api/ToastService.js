app.service('ToastService', function () {
    this.showSuccessToast = function (message) {
        toast({
            title: 'Thành công!',
            message: message,
            type: 'success',
            duration: 5000 // Thời gian hiển thị 5000ms (5 giây)
        });
    };

    this.showErrorToast = function (message) {
        toast({
            title: 'Thất bại!',
            message: message,
            type: 'error',
            duration: 5000 // Thời gian hiển thị 5000ms (5 giây)
        });
    };

    this.showInfoToast = function (title, message) {
        toast({
            title: title,
            message: message,
            type: 'info',
            duration: 5000 // Thời gian hiển thị 5000ms (5 giây)
        });
    };

    this.showWarningToast = function (message) {
        toast({
            title: 'Chú ý!',
            message: message,
            type: 'warning',
            duration: 5000 // Thời gian hiển thị 5000ms (5 giây)
        });
    };

    function toast({ title = '', message = '', type = '', duration = 3000 }) {
        const main = document.getElementById('toast');
        if (main) {
            const toast = document.createElement('div');
            toast.className = `toastDesign toast--${type}`;
            const icon = document.createElement('i');
            icon.className = getIconClass(type);
            const toastIcon = document.createElement('div');
            toastIcon.className = 'toast__icon';
            toastIcon.appendChild(icon);
            const toastBody = document.createElement('div');
            toastBody.className = 'toast__body';
            const toastTitle = document.createElement('h3');
            toastTitle.className = 'toast__title';
            toastTitle.textContent = title;
            const toastMessage = document.createElement('p');
            toastMessage.className = 'toast__msg';
            toastMessage.textContent = message;
            const toastClose = document.createElement('div');
            toastClose.className = 'toast__close';
            const closeIcon = document.createElement('i');
            closeIcon.className = 'fas fa-times';
            toastClose.appendChild(closeIcon);
            toastBody.appendChild(toastTitle);
            toastBody.appendChild(toastMessage);
            toast.appendChild(toastIcon);
            toast.appendChild(toastBody);
            toast.appendChild(toastClose);
            main.appendChild(toast);

            const autoRemoveId = setTimeout(() => {
                main.removeChild(toast);
            }, duration + 1000);

            toast.onclick = (e) => {
                if (e.target.closest('.toast__close')) {
                    main.removeChild(toast);
                    clearTimeout(autoRemoveId);
                }
            };

            const delay = (duration / 1000).toFixed(2);
            toast.style.animation = `slideInLeft ease .3s, fadeOut linear 1s ${delay}s forwards`;
        }
    }

    function getIconClass(type) {
        const icons = {
            success: 'fas fa-check-circle',
            info: 'fas fa-info-circle',
            warning: 'fas fa-exclamation-circle',
            error: 'fas fa-exclamation-circle'
        };
        return icons[type];
    }

});
