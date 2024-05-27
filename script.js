document.addEventListener('DOMContentLoaded', () => {
    const sections = ['dashboard', 'retrait', 'versement', 'transfert', 'charte'];

    // Fonction pour afficher la section demandée et cacher les autres
    function showSection(sectionId) {
        sections.forEach(section => {
            document.getElementById(section).classList.add('d-none');
        });
        document.getElementById(sectionId).classList.remove('d-none');
    }

    window.showSection = showSection;

    // Gestion du retrait
    const withdrawForm = document.getElementById('withdrawForm');
    if (withdrawForm) {
        withdrawForm.addEventListener('submit', (e) => {
            e.preventDefault();
            const amount = document.getElementById('withdrawAmount').value;
            addTransaction('Retrait', amount, 'retraitList');
            alert('Retrait effectué avec succès');
            withdrawForm.reset();
        });
    }

    // Gestion du versement
    const depositForm = document.getElementById('depositForm');
    if (depositForm) {
        depositForm.addEventListener('submit', (e) => {
            e.preventDefault();
            const amount = document.getElementById('depositAmount').value;
            addTransaction('Versement', amount, 'transactionList');
            alert('Versement effectué avec succès');
            depositForm.reset();
        });
    }

    // Gestion du transfert
    const transferForm = document.getElementById('transferForm');
    if (transferForm) {
        transferForm.addEventListener('submit', (e) => {
            e.preventDefault();
            const amount = document.getElementById('transferAmount').value;
            const toAccount = document.getElementById('transferToAccount').value;
            addTransaction(`Transfert vers ${toAccount}`, amount, 'transactionList');
            alert('Transfert effectué avec succès');
            transferForm.reset();
        });
    }

    // Fonction pour ajouter une transaction à la liste
    function addTransaction(type, amount, listId) {
        const transactionList = document.getElementById(listId);
        const transactionItem = document.createElement('li');
        transactionItem.className = 'list-group-item';
        transactionItem.textContent = `${type}: ${amount}€`;
        transactionList.appendChild(transactionItem);
    }

    // Afficher le formulaire de nouveau retrait
    window.showNewRetraitForm = function() {
        document.getElementById('withdrawForm').classList.remove('d-none');
    };

    // Gestion de la déconnexion
    const logoutButton = document.getElementById('logout');
    if (logoutButton) {
        logoutButton.addEventListener('click', (e) => {
            e.preventDefault();
            window.location.href = 'index.php';
        });
    }
});
