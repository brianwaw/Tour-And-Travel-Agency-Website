/**
 * 
 */

document.getElementById('submitButton').addEventListener('click', function(event) {
    event.preventDefault(); // Prevent default form submission

    // Gather data from the first form
    var selectedTravelClass = document.querySelector('input[name="travel-class"]:checked').value;

    // Gather data from the second form
    var leavingFrom = document.getElementById('leavingFrom').value;
    var whereTo = document.getElementById('whereTo').value;
    var travelDate = document.getElementById('travelDate').value;
    var numTravelers = document.getElementById('numTravelers').value;

    // Prepare data to send to servlet
    var data = {
        'selectedTravelClass': selectedTravelClass,
        'leavingFrom': leavingFrom,
        'whereTo': whereTo,
        'travelDate': travelDate,
        'numTravelers': numTravelers
    };

    // Send data to servlet via AJAX
    var xhr = new XMLHttpRequest();
    xhr.open('POST', 'availableflights', true);
    xhr.setRequestHeader('Content-Type', 'application/json');
    xhr.onload = function() {
        // Handle response from servlet if needed
        console.log(xhr.responseText);
    };
    xhr.send(JSON.stringify(data));
});
 