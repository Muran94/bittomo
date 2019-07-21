class Sidebar {
  constructor(sidebarToggleButton) {
    this.$sidebarToggleButton = sidebarToggleButton;
    this.$sidebar = document.querySelector(this.$sidebarToggleButton.dataset.target);

    // メニューボタンをクリックした時にサイドバーを開く
    this.$sidebarToggleButton.addEventListener('click', () => {
      this.open();
    });

    // マスクをクリックした時にサイドバーを閉じる
    this.$sidebar.querySelector('.l-sidebar__mask').addEventListener('click', () => {
      this.close();
    })
  }

  open() {
    this.$sidebar.style.display = 'block';
    setTimeout(() => { this.$sidebar.classList.add('l-sidebar--is-opened'); }, 0);
  }

  close() {
    this.$sidebar.classList.remove('l-sidebar--is-opened');
    setTimeout(() => { this.$sidebar.style.display = 'none'; }, 250);
  }
}

export default Sidebar;
