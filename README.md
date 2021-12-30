# beyazalan

## TODO

### Genel

- [ ] Logo
- [ ] İsim

### Yönetim

- [ ] Create
  - [x] Hiç yönetici yoksa yeni oluştur.
  - [x] Kart id
  - [x] Adı.
  - [x] Yaratılma zamanı.
  - [x] Yaratan kişi.
- [ ] Read
  - [ ] Yöneticileri listele.
- [ ] Update
  - [ ] Kartını güncelle.
  - [ ] Adını güncelle.
- [ ] Delete

### Kullanıcı

- [ ] Create
  - [ ] QR Code id yarat.
  - [ ] Bilgileri ?
  - [ ] Yaratılma zamanı.
  - [ ] Yaratan kişi.
- [ ] Read
  - [ ] QR Code oku
  - [ ] Bilgileri listele.
- [ ] Update
- [ ] Delete

## Views

```mermaid
flowchart TD
home-->inventoryList
home-->admin-->addAdmin
admin-->addInventory
```
