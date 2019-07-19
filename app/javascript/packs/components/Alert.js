class Alert {
  constructor(alert) {
    this.$alert = alert;

    if (this.$alert.className.includes('c-alert--closable')) {
      this.$alert.addEventListener('click', function() {
        this.style.display = 'none';
      })
    }
  }
}

export default Alert;
