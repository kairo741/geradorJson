// function yearCount() {
//     var idaas = document.getElementById("year-count");
//     var endDate = (new Date().getFullYear()) - 2020;
//     idaas.appendChild(endDate);
//     console.log(endDate)
// }

// yearCount();


function whatsAppMessage(message) {
    var a = document.createElement('a');

    const messageLink = "https://api.whatsapp.com/send?phone=5544997040429&text="

    var buildedMessage = messageLink + message.toString().split(" ").join("%20");

    var link = document.createTextNode("This is link");

    a.appendChild(link);
    a.title = "This is Link";


    a.href = buildedMessage;

    // Append the anchor element to the body.
    document.body.appendChild(a);

    console.log(buildedMessage)

}
whatsAppMessage("oiii kairo seu lindooo aa");