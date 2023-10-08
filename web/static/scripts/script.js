// Toggle navigation

const icon = document.querySelector('#mobile-icon')
const navigation = document.querySelector('.mobile-nav')

icon.addEventListener('click', () => {
    navigation.classList.toggle('open');
})  



// Enlarge text from messages

const textFromMessage = document.querySelectorAll('.text');
let fullString = '';
let shortenString = ''

textFromMessage.forEach(message => {
    let fullString = message.innerText;
    if (fullString.length > 140) {
        shortenString = fullString.substring(0, 140).concat('...');
        message.innerText = shortenString    
    }
    return
});



// History back
const backButton = document.querySelector('#goBack');
backButton?.addEventListener('click', () => {
    history.back()
})



// Fixed sidebar homepage
const messagesColumn = document.querySelector('.messages');
const sidebarColumn = document.querySelector('.sidebar');

console.log(sidebarColumn)

// Voeg een scrollgebeurtenisluisteraar toe aan de linker kolom
messagesColumn.addEventListener('scroll', function () {
    const scrollTop = messagesColumn.scrollTop;

    // Pas de positie van de rechterkolom aan op basis van de scrollpositie
    if (scrollTop >= 0) {
        sidebarColumn.style.position = 'sticky';
        sidebarColumn.style.top = scrollTop + 'px';
    } else {
        sidebarColumn.style.position = 'static';
    }
});