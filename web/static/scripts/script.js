// Toggle navigation

const icon = document.querySelector('#mobile-icon')
const navigation = document.querySelector('.mobile-nav')

icon.addEventListener('click', () => {
    navigation.classList.toggle('open');
})  



// Enlarge text from messages

const textFromMessage = document.querySelectorAll('.text');
console.log(textFromMessage.length)
let fullString = '';
let shortenString = ''

textFromMessage.forEach(message => {
    let fullString = message.innerText;
    if (fullString.length > 140) {
        shortenString = fullString.substring(0, 140).concat('...');
    }
    console.log(shortenString)
    message.innerText = shortenString    
});

