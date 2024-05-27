<div id="retrait" class="pt-4">
    <h4>Retrait</h4>
    <button class="btn btn-primary mb-3" onclick="showNewRetraitForm()">Nouveau Retrait</button>
    <ul id="retraitList" class="list-group"></ul>
    <form id="withdrawForm" class="d-none">
        <div class="form-group">
            <label for="withdrawAmount">Montant</label>
            <input type="number" class="form-control" id="withdrawAmount" required>
        </div>
        <button type="submit" class="btn btn-primary btn-block">Retirer</button>
    </form>
</div>
