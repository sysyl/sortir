// query selector to get element
document.addEventListener('DOMContentLoaded', () =>{
    const userSearchBar = document.querySelector("#searchUser");
    const villeSearchBar = document.querySelector("#searchVille");
    const siteSearchBar = document.querySelector("#searchSite");

    userSearchBar.addEventListener("keyup", evt => {
        const { children } = document.querySelector("#v-pills-tab");
        const tabsArr = [...children];
        const activeTab = tabsArr.filter((tab) => {
            return tab.classList.contains("active");
        })[0]; // get active element
        const { value } = evt.currentTarget;
        const { children: rowHTMLElements } = document.querySelector("#v-pills-utilisateurs  tbody");
        const rowArr = [...rowHTMLElements];
        if (activeTab.textContent === "Utilisateurs") {
            rowArr.forEach( row => {
                row.style.display = 'table-row';
                const rowUserPseudo = row.children[0].innerText;
                const rowUserPrenomNom = row.children[1].innerText;
                const rowUserMail = row.children[2].innerText;
                if (rowUserPseudo.toLowerCase().includes(value.toLowerCase()) || rowUserPrenomNom.toLowerCase().includes(value.toLowerCase()) || rowUserMail.toLowerCase().includes(value.toLowerCase())) {
                    row.style.display = 'table-row';
                } else {
                    row.style.display = 'none';
                }
            });
        }
    });

    villeSearchBar.addEventListener("keyup", evt => {
        const { children } = document.querySelector("#v-pills-tab");
        const tabsArr = [...children];
        const activeTab = tabsArr.filter((tab) => {
            return tab.classList.contains("active");
        })[1];
        const { value } = evt.currentTarget;
        const { children: rowHTMLElements } = document.querySelector("#v-pills-villes  tbody");
        const rowArr = [...rowHTMLElements];
        if (activeTab.textContent === "Villes") {
            rowArr.forEach( row => {
                row.style.display = 'table-row';
                const rowCityVal = row.children[1].innerText;
                console.log(rowCityVal);
                if (rowCityVal.toLowerCase().includes(value.toLowerCase())) {
                    row.style.display = 'table-row'
                }
                else {
                    row.style.display = 'none';
                }
            });
        }
    });

    siteSearchBar.addEventListener("keyup", evt => {
        const { children } = document.querySelector("#v-pills-tab");
        const tabsArr = [...children];
        const activeTab = tabsArr.filter((tab) => {
            return tab.classList.contains("active");
        })[2];
        const { value } = evt.currentTarget;
        const { children: rowHTMLElements } = document.querySelector("#v-pills-sites  tbody");
        const rowArr = [...rowHTMLElements];
        if (activeTab.textContent === "Sites") {
            rowArr.forEach( row => {
                row.style.display = 'table-row';
                const rowSiteVal = row.children[2].innerText;
                if (rowSiteVal.toLowerCase().includes(value.toLowerCase())) {
                    row.style.display = 'table-row'
                }
                else {
                    row.style.display = 'none';
                }
            });
        }
    });

    const csvInput = document.querySelector("#import_users_file_csv");
    const csvLabel = document.querySelector("#Error");
    const import_users_Importer = document.querySelector("#importButton");
    import_users_Importer.style.display = 'none';
    csvLabel.style.display = 'none';

    csvInput.addEventListener('change', evt => {
        const { value } = evt.currentTarget;
        if (value) {
            const fileName = value.split("\\").pop() || value.split("/").pop();
            console.log(fileName);
            if (fileName.substr(fileName.indexOf('.')) !='.csv') {
                csvLabel.style.display = 'block';
                import_users_Importer.style.display = 'none';
            }
            else {
                csvLabel.style.display = 'none';
                import_users_Importer.style.display = 'block';
            }
        } else {
            import_users_Importer.style.display = 'none';
            csvLabel.style.display = 'none';
        }
    });

}, false);