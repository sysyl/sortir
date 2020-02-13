let trs = [...document.querySelector('tbody').children];
let filteredTrs = [...trs];

//trs -> get all table row of my list view
//tr -> one table row

function displayCity() {

    let input = document.getElementById("inputGroup_site");

    if (input.value === "Toutes les villes") {
        filteredTrs = filteredTrs.map((tr) => {
            tr.style.display = 'table-row';
            return tr;
        });
    } else {
        filteredTrs = filteredTrs.map((tr) => {
            tr.style.display = 'table-row';
            const trLabel = tr.children[2].innerText;
            if (trLabel == input.value) {
                tr.style.display = 'table-row';
            } else {
                tr.style.display = 'none';
            }
            return tr;
        });
    }

}

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