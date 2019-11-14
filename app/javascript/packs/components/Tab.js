class Tab {
  constructor(tab) {
    this.$tab = tab;
    this.$tabLinks = this.$tab.querySelectorAll('.c-tab__link');
    this.$tabItems = this.$tab.querySelectorAll('.c-tab__item');
    this.$tabLinks.forEach($tabLink => {
      if ($tabLink.dataset.target === undefined) { return; }

      $tabLink.addEventListener('click', () => {
        this.inactivateAllTabs();
        this.activateTab($tabLink)
      })
    })
  }

  inactivateAllTabs() {
    this.$tabLinks.forEach($tabLink => { $tabLink.classList.remove('c-tab__link--is-active') });
    this.$tabItems.forEach($tabItem => { $tabItem.classList.remove('c-tab__item--is-active') });
  }

  activateTab($tabLink) {
    const $targetTabItem = this.$tab.querySelector($tabLink.dataset.target);
    $tabLink.classList.add('c-tab__link--is-active');
    $targetTabItem.classList.add('c-tab__item--is-active');
  }
}

export default Tab;
