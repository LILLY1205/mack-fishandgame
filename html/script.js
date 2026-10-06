var storeData = { items: [] };
var activeCategory = null;
var selectedItem = null;
var isClosing = false;
var currentVendor = null;

function getItemImagePath(itemName) {
    return 'nui://rsg-inventory/html/images/' + itemName + '.png';
}

function renderSellButtons(sellOptions) {
    var section = document.getElementById('sellSection');
    section.innerHTML = '';
    if (!sellOptions || sellOptions.length === 0) {
        section.style.display = 'none';
        return;
    }
    section.style.display = 'flex';
    sellOptions.forEach(function(opt) {
        var btn = document.createElement('button');
        btn.className = 'sell-btn';
        btn.innerHTML = opt.label + '<span class="price-hint">' + opt.desc + '</span>';
        btn.onclick = function() {
            fetch('https://' + GetParentResourceName() + '/sellAction', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({ type: opt.id, vendorType: currentVendor })
            });
        };
        section.appendChild(btn);
    });
}

function renderCategories() {
    var categoryList = document.getElementById('categoryList');
    categoryList.innerHTML = '';
    var categories = [...new Set(storeData.items.map(function(item) { return item.type || 'General'; }))];
    categories.forEach(function(category) {
        var button = document.createElement('button');
        button.className = 'category-button';
        button.textContent = category;
        button.onclick = function() { setActiveCategory(category); };
        categoryList.appendChild(button);
    });
}

function renderItems() {
    var itemGrid = document.getElementById('itemGrid');
    itemGrid.innerHTML = '';
    var items = storeData.items.filter(function(item) {
        return !activeCategory || item.type === activeCategory;
    });
    items.forEach(function(item) {
        var card = document.createElement('div');
        card.className = 'item-card';
        card.onclick = function() { setSelectedItem(item); };
        var img = document.createElement('img');
        img.src = getItemImagePath(item.name);
        img.onerror = function() { this.src = 'nui://rsg-inventory/html/images/missing.png'; };
        img.alt = item.label || item.name;
        img.className = 'item-image';
        var title = document.createElement('h3');
        title.textContent = item.label || item.name;
        var price = document.createElement('p');
        price.className = 'price-text';
        price.textContent = (lang && lang.menu && lang.menu.price ? lang.menu.price : 'Price') + ': $' + item.price;
        var stock = document.createElement('p');
        stock.className = 'stock-text';
        stock.textContent = (lang && lang.menu && lang.menu.instock ? lang.menu.instock : 'In Stock') + ': ' + item.stock;
        card.appendChild(img);
        card.appendChild(title);
        card.appendChild(price);
        card.appendChild(stock);
        itemGrid.appendChild(card);
    });
}

function renderItemDetails() {
    var details = document.getElementById('itemDetails');
    details.innerHTML = '';
    if (selectedItem) {
        var title = document.createElement('h3');
        title.textContent = selectedItem.label || selectedItem.name;
        details.appendChild(title);
        var img = document.createElement('img');
        img.src = getItemImagePath(selectedItem.name);
        img.onerror = function() { this.src = 'nui://rsg-inventory/html/images/missing.png'; };
        img.alt = selectedItem.label || selectedItem.name;
        img.className = 'item-image';
        details.appendChild(img);
        var price = document.createElement('p');
        price.className = 'price-text';
        price.textContent = (lang && lang.menu && lang.menu.price ? lang.menu.price : 'Price') + ': $' + selectedItem.price;
        details.appendChild(price);
        var stock = document.createElement('p');
        stock.className = 'stock-text';
        stock.textContent = (lang && lang.menu && lang.menu.instock ? lang.menu.instock : 'In Stock') + ': ' + selectedItem.stock;
        details.appendChild(stock);
        var qtyLabel = document.createElement('label');
        qtyLabel.textContent = (lang && lang.menu && lang.menu.quantity ? lang.menu.quantity : 'Quantity') + ': ';
        qtyLabel.setAttribute('for', 'buy-quantity');
        qtyLabel.style.marginRight = '8px';
        details.appendChild(qtyLabel);
        var qtyInput = document.createElement('input');
        qtyInput.type = 'number';
        qtyInput.id = 'buy-quantity';
        qtyInput.min = 1;
        qtyInput.max = selectedItem.stock;
        qtyInput.value = 1;
        qtyInput.style.width = '60px';
        qtyInput.style.marginRight = '8px';
        details.appendChild(qtyInput);
        var buyBtn = document.createElement('button');
        buyBtn.className = 'action-button';
        buyBtn.textContent = lang && lang.menu && lang.menu.buy ? lang.menu.buy : 'Buy';
        buyBtn.onclick = function() {
            var qty = parseInt(qtyInput.value, 10) || 1;
            if (qty < 1 || qty > selectedItem.stock) return;
            fetch('https://' + GetParentResourceName() + '/buyItem', {
                method: 'POST',
                headers: { 'Content-Type': 'application/json' },
                body: JSON.stringify({
                    itemName: selectedItem.name,
                    quantity: qty,
                    vendorType: currentVendor
                })
            }).then(function(r) { return r.json(); })
            .then(function(result) {
                if (result && result.success) {
                    selectedItem.stock -= qty;
                    renderItems();
                    renderItemDetails();
                }
            });
        };
        details.appendChild(buyBtn);
    } else {
        var msg = document.createElement('p');
        msg.textContent = lang && lang.menu && lang.menu.select_item ? lang.menu.select_item : 'Select an item to view details';
        details.appendChild(msg);
    }
}

function setActiveCategory(category) {
    activeCategory = category;
    selectedItem = null;
    var buttons = document.querySelectorAll('.category-button');
    buttons.forEach(function(btn) { btn.classList.remove('active'); });
    var activeBtn = Array.from(buttons).find(function(b) { return b.textContent === category; });
    if (activeBtn) activeBtn.classList.add('active');
    renderItems();
    renderItemDetails();
}

function setSelectedItem(item) {
    selectedItem = item;
    renderItemDetails();
}

var progressInterval = null;

function closeVendor() {
    if (isClosing) return;
    isClosing = true;
    document.getElementById('vendorUI').classList.remove('visible');
    fetch('https://' + GetParentResourceName() + '/closeVendor', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({})
    }).then(function() {
        setTimeout(function() { isClosing = false; }, 2000);
    }).catch(function() {
        isClosing = false;
    });
}

document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('closeButton').addEventListener('click', closeVendor);
    document.addEventListener('keydown', function(e) {
        if (e.key === 'Escape') closeVendor();
    });
});

window.addEventListener('message', function(event) {
    var data = event.data;
    if (data.action === 'openVendor') {
        currentVendor = data.vendorType;
        storeData = { items: data.shopItems || [] };
        lang = data.lang || {};
        selectedItem = null;
        activeCategory = null;
        document.getElementById('vendorName').textContent = data.name;
        document.getElementById('vendorUI').classList.add('visible');
        isClosing = false;
        renderSellButtons(data.sellOptions || []);
        renderCategories();
        renderItems();
        renderItemDetails();
    } else if (data.action === 'closeVendor') {
        closeVendor();
    } else if (data.action === 'showProgress') {
        if (progressInterval) { clearInterval(progressInterval); progressInterval = null; }
        document.getElementById('progressLabel').textContent = data.label;
        document.getElementById('progressOverlay').classList.remove('hidden');
        var fill = document.getElementById('progressFill');
        fill.style.width = '0%';
        var startTime = Date.now();
        var duration = data.duration;
        progressInterval = setInterval(function() {
            var elapsed = Date.now() - startTime;
            var pct = Math.min(elapsed / duration, 1);
            fill.style.width = (pct * 100) + '%';
            if (pct >= 1) { clearInterval(progressInterval); progressInterval = null; }
        }, 16);
    } else if (data.action === 'hideProgress') {
        if (progressInterval) { clearInterval(progressInterval); progressInterval = null; }
        document.getElementById('progressOverlay').classList.add('hidden');
        document.getElementById('progressFill').style.width = '0%';
    }
});
