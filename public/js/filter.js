let trs = [...document.querySelector('tbody').children];
let filteredTrs = [...trs];

//trs -> get all table row of my list view
//tr -> one table row

// ============================================ FILTRE PAR VILLE
function displayCity() {

    let input = document.getElementById("inputGroup_site");

    if (input.value === "Toutes les villes") {
        filteredTrs = filteredTrs.map((tr) => {
            tr.style.display = 'table-row';
            return tr;
        });
    }
    else {
        filteredTrs = filteredTrs.map((tr) => {
            tr.style.display = 'table-row';
            let trLabel = tr.children[2].innerText;
            if (trLabel == input.value) {
                tr.style.display = 'table-row';
            } else {
                tr.style.display = 'none';
            }
            return tr;
        });
    }
};

// ============================================ FILTRE PAR NOM
function displaySearchValue() {

    let inputValue = document.getElementById("inputGroup_nom").value;

    trs.forEach((tr) => {
        filteredTrs = filteredTrs.map((tr) => {
            tr.style.display = 'table-row';
            if (inputValue) {
                if (tr.children[0].textContent.toLocaleLowerCase().includes(inputValue.toLocaleLowerCase())) {
                    tr.style.display = 'table-row';
                } else {
                    tr.style.display = 'none';
                }
            }
            return tr;
        });
    });
};

// ============================================ FILTRE PAR DATES
function displaySearchByDate() {

    let dateDebut = document.getElementById("inputGroup_dateDebut").value;
    let dateFin = document.getElementById("inputGroup_dateFin").value;

    console.log("date formulaire");
    console.log(dateDebut);
    console.log(dateFin);

    console.log("date formulaire passée en JS");
    let dateDebutVal =  new Date(dateDebut);
    let dateFinVal = new Date(dateFin);

    console.log(dateDebutVal);
    console.log(dateFinVal);

        if ((dateDebutVal instanceof Date) && (dateFinVal instanceof Date)) {
            filteredTrs = filteredTrs.map((tr) => {
                tr.style.display = 'table-row';
                let rawDate = tr.children[1].textContent.split(" ")[0]; //get all date from list
                let splitDate = rawDate.split('/'); //array and delete '/'
                let formatDate = `${splitDate[2]}-${splitDate[1]}-${splitDate[0]}`; // add '-' and create the new format // At this time, form date and dates of the list are the same format
                let dateFromTr =  new Date(formatDate);
                console.log(dateFromTr);
                // TODO
                if (dateFromTr.getTime() >= dateDebutVal.getTime() && dateFromTr.getTime() <= dateFinVal.getTime()) {
                    tr.style.display = 'table-row';
                } else {
                    tr.style.display = 'none';
                }
                return tr;
            });
        } else {
            filteredTrs = filteredTrs.map((tr) => {
                tr.style.display = 'table-row';
                return tr;
            });
        }
};

// ============================================ FILTRE PAR ORGANISATEUR
function displayOrganizer() {

    filteredTrs = filteredTrs.map((tr) => {
        tr.style.display = 'table-row';
        let userName = document.querySelector("#orga_pseudo").textContent;
        let trOrga = tr.children[5].textContent;
        if (userName === trOrga) {
            tr.style.display = 'table-row';
        } else if (userName !== trOrga) {
            tr.style.display = 'none';
        };
        return tr;
    });
};

// ============================================ FILTRE PAR INSCRIT
function displayRegistered() {

    filteredTrs = filteredTrs.map((tr) => {
        tr.style.display = 'table-row';
        if (tr.children[4].children[0].value == 1){
            tr.style.display = 'table-row';
        } else {
            tr.style.display = 'none';
        }
        return tr;
        });
};

// ============================================ FILTRE PAR NON INSCRIT
function displayNotRegistered() {

    filteredTrs = filteredTrs.map((tr) => {
        tr.style.display = 'table-row';
        if (tr.children[4].children[0].value == 0){
            tr.style.display = 'table-row';
        } else {
            tr.style.display = 'none';
        }
        return tr;
    });
};