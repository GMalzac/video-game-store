// console.log('Hello World from Webpacker');
import "bootstrap";
import flatpickr from "flatpickr";

flatpickr("#timepicker", {
    altInput: true,
    altFormat: "F j, Y",
    dateFormat: "Y-m-d",
});
