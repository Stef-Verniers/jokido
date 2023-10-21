// Boot script //

// Check for innerwidth
function renderHeader() {

    const mobileHeader = document.querySelector('.mobile-header')
    const screenHeader = document.querySelector('.screen-header')

    if (window.innerWidth < 762) {
        mobileHeader.style.display = 'block'
        screenHeader.style.display = 'none'
    } else {
        mobileHeader.style.display = 'none'
        screenHeader.style.display = 'block'
    }
}

renderHeader()