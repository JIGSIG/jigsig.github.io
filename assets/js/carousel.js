const track = document.querySelector('.work__list')
const slides = Array.from(track.children);
const nextButton = document.querySelector('.carousel-control.right');
const prevButton = document.querySelector('.carousel-control.left');
const dotNav = document.querySelector('.work__navigation');
const dots = Array.from(dotNav.children);

// const slideSize = slides[0].getBoundingClientRect();
// const slideWidth = slideSize.width;


const nextEvent = e => {
    const current_slide = track.querySelector('.work__list-el--is-active');
    const next_slide = current_slide.nextElementSibling == null ? slides[0] : current_slide.nextElementSibling;
    index = slides.indexOf(next_slide)
    current_slide.classList.remove('work__list-el--is-active')
    next_slide.classList.add('work__list-el--is-active')
    moveDot(index);
};
nextButton.addEventListener('click', nextEvent);

const prevEvent = e => {
    const current_slide = track.querySelector('.work__list-el--is-active');
    const prev_slide = current_slide.previousElementSibling == null ? slides[slides.length - 1] : current_slide.previousElementSibling;
    index = slides.indexOf(prev_slide)
    current_slide.classList.remove('work__list-el--is-active')
    prev_slide.classList.add('work__list-el--is-active')
    moveDot(index);
};
prevButton.addEventListener('click', prevEvent);

const moveDot = (index) => {
    const current_dot = dotNav.querySelector('.work__navigation-el--is-active');
    const dot_to_jump = dots[index];
    current_dot.classList.remove('work__navigation-el--is-active')
    dot_to_jump.classList.add('work__navigation-el--is-active')
}

const setDotEvent = (dot, index) => {

    const dotEvent = e => {
        const current_slide = track.querySelector('.work__list-el--is-active');
        const current_dot = dotNav.querySelector('.work__navigation-el--is-active');
        const slide_to_jump = slides[index];
        const dot_to_jump = dots[index];
        current_slide.classList.remove('work__list-el--is-active')
        slide_to_jump.classList.add('work__list-el--is-active')
        current_dot.classList.remove('work__navigation-el--is-active')
        dot_to_jump.classList.add('work__navigation-el--is-active')
    };
    dot.addEventListener('click', dotEvent);
};

dots.forEach(setDotEvent);

const cslide = track.querySelector('.work__list-el--is-active');
i = slides.indexOf(cslide)
moveDot(i);