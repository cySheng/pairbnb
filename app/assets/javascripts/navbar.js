$(document).on('turbolinks:load',function(){
  //The box for the menu to click on
  const menuDiv = document.querySelector(".menu_bar");
  
  //empty background for the dropdown menu which includes the arrow too
  const background  = document.querySelector('.dropdownBackground');

  //navbar might this even be used?
  const nav  = document.querySelector('.main_navbar');

  function handleEnter() {
    this.classList.add('trigger-enter');
    setTimeout(() => this.classList.contains('trigger-enter') && this.classList.add('trigger-enter-active'), 150);
    background.classList.add('open');

    //the list of tiems that are included in the dropdown
    const dropdown = this.querySelector(".dropdown");

    //coordinates of the box for the dropdown list of items 
    const dropdownCoords = dropdown.getBoundingClientRect();

    //coordinates of the navbar?
    const navCoords = nav.getBoundingClientRect();

    const menuIcon = this.querySelector("#menu_icon");

    const menuIconCoords = menuIcon.getBoundingClientRect();

    // debugger

    const coords = {
      height: dropdownCoords.height,
      width: dropdownCoords.width,
      top: navCoords.height - (navCoords.top + menuIconCoords.top + 5), // navCoords.top + menuIconCoords.top + navCoords.height
      left: dropdownCoords.left //- navCoords.left
    };

    // debugger

    background.style.setProperty('width', `${coords.width}px`);
    background.style.setProperty('height', `${coords.height}px`);
    background.style.setProperty('transform', `translate(${coords.left}px, ${coords.top}px)`);
  }

  function handleLeave() {
    this.classList.remove('trigger-enter', 'trigger-enter-active');
    background.classList.remove('open');
  }
  menuDiv.addEventListener("mouseenter", handleEnter);
  menuDiv.addEventListener("mouseleave", handleLeave);
})

