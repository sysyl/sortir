const trs = [...document.querySelector('tbody').children];
let filteredTrs = [...trs];

//trs -> get all table of my view list
//tr -> one table row
function displayOrganizer() {

    filteredTrs = filteredTrs.map((tr) => {
        tr.style.display = 'table-row';
        const userName = document.querySelector("#orga_pseudo").textContent;
        const trOrga = tr.children[5].textContent;
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

// function displaySearchValue() {
//
//     let inputValue = document.getElementById("inputGroup_nom").value;
//
//     trs.forEach((tr) => {
//         filteredTrs = filteredTrs.map((tr) => {
//             tr.style.display = 'table-row';
//             if (inputValue) {
//                 tr.children[0].textContent.toLocaleLowerCase().includes(inputValue.toLocaleLowerCase()) ?
//                     tr.style.display = 'table-row' : tr.style.display = 'none';
//             }
//             return tr;
//         });
//     });
// };

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