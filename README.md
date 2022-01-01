# beyazalan

## TODO

### Genel

- [x] Logo
- [x] İsim

### Yönetim

- [ ] Create
  - [x] Hiç yönetici yoksa yeni oluştur.
  - [x] Kart id
  - [x] Adı.
  - [x] Yaratılma zamanı.
  - [x] Yaratan kişi.
- [x] Read
  - [x] Yöneticileri listele.
- [ ] Update
  - [ ] Kartını güncelle.
  - [ ] Adını güncelle.
- [x] Delete

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
