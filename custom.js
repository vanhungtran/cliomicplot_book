// Custom interactive enhancements for cliomicplot_book
// Enhanced Lightbox click-to-zoom on scientific figures

document.addEventListener('DOMContentLoaded', function () {
  // Toggle 2x zoom when clicking inside the GLightbox image modal
  document.addEventListener('click', function (e) {
    if (e.target && e.target.matches('.gslide-image img')) {
      e.stopPropagation();
      var img = e.target;
      if (img.classList.contains('is-zoomed')) {
        img.classList.remove('is-zoomed');
        img.style.transform = 'scale(1)';
        img.style.cursor = 'zoom-in';
      } else {
        img.classList.add('is-zoomed');
        var rect = img.getBoundingClientRect();
        var x = ((e.clientX - rect.left) / rect.width) * 100;
        var y = ((e.clientY - rect.top) / rect.height) * 100;
        img.style.transformOrigin = x + '% ' + y + '%';
        img.style.transform = 'scale(2.2)';
        img.style.cursor = 'zoom-out';
        img.style.transition = 'transform 0.25s cubic-bezier(0.25, 0.1, 0.25, 1)';
      }
    }
  });

  // Reset zoom on slide change or close
  document.addEventListener('keydown', function (e) {
    if (e.key === 'Escape') {
      document.querySelectorAll('.gslide-image img.is-zoomed').forEach(function (img) {
        img.classList.remove('is-zoomed');
        img.style.transform = 'scale(1)';
      });
    }
  });
});
