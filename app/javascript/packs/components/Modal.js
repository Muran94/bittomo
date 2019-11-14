class Modal {
  constructor(modalToggleButton) {
    this.$modalToggleButton = modalToggleButton;
    this.$modal = document.querySelector(this.$modalToggleButton.dataset.target);

    // ボタンをクリックした時にモーダルを開く
    this.$modalToggleButton.addEventListener('click', () => {
      this.open();
    });

    // マスクをクリックした時に押した時にモーダルを閉じる
    this.$modal.querySelector('.c-modal__mask').addEventListener('click', () => {
      this.close();
    })

    // クローズボタンを押した時にモーダルを閉じる
    this.$modal.querySelector('.c-modal__close-button').addEventListener('click', () => {
      this.close();
    })
  }

  open() {
    this.$modal.style.display = 'block';
    document.querySelector('body').classList.add('overflow-hidden');
    setTimeout(() => { this.$modal.classList.add('c-modal--is-opened'); }, 0);
  }

  close() {
    this.$modal.classList.remove('c-modal--is-opened');
    document.querySelector('body').classList.remove('overflow-hidden');
    setTimeout(() => { this.$modal.style.display = 'none'; }, 250);
  }
}

export default Modal;
