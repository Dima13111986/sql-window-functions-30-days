# SQL Window Functions — Learning Progress

## Поточний стан
- Поточний день курсу: **1**
- Останнє оновлення: 2026-05-08
- Статус курсу: in-progress
- SQL environment: **Microsoft Fabric Warehouse (T-SQL)**
- Workspace: `sql-window-functions-30-days`
- Warehouse: `sales`
- Git integration: **підключено через Fabric → GitHub (Synced 🟢)**
- GitHub repo: https://github.com/Dima13111986/sql-window-functions-30-days
- IDE: Fabric Web SQL editor + (опціонально) VS Code

---

## Структура проєкту

### GitHub
- `sql/sales.Warehouse/` — автогенерація з Fabric (DDL обʼєктів)
- `sql/sales.Warehouse/dbo/Tables/sales.sql` — DDL таблиці sales
- `sql/queries/day-XX-*.sql` — мої курсові аналітичні SQL queries (вручну)
- `learning-progress.md` — цей файл

### Fabric Warehouse `sales`
- Schemas → dbo → Tables → **sales** (9 рядків)
- Queries → My queries → **sample dataset** (Day 1 SELECT з OVER)

---

## День 1 — OVER(), PARTITION BY: перший аналітичний запит
- Дата: 2026-05-08
- Статус: ✅ завершено
- Що зроблено:
  - Підключено Fabric workspace до GitHub (Git Integration)
  - Створено таблицю `dbo.sales` (9 рядків: sale_id, sale_date, region, salesperson, amount)
  - Перший Fabric → Git commit: DDL таблиці пішов у repo
  - Написано query з `SUM() OVER (PARTITION BY region)` (збережено як `sample dataset`)
  - Написано query з `AVG() OVER (PARTITION BY region)` + `CASE` для performance
  - Порівняно результат з еквівалентом через `GROUP BY`
- Window functions, які використано:
  - `OVER()`
  - `PARTITION BY`
  - `SUM() OVER (PARTITION BY ...)`
  - `AVG() OVER (PARTITION BY ...)`
  - `MAX() OVER (PARTITION BY ...)` (у міні-завданні)
  - `COUNT(*) OVER (PARTITION BY ...)` (у міні-завданні)
- SQL артефакти:
  - **Fabric Warehouse:** таблиця `dbo.sales`, query `sample dataset`
  - **GitHub:** `sql/sales.Warehouse/dbo/Tables/sales.sql` (автогенерація)
  - **GitHub (TODO):** `sql/queries/day-01-over-partition.sql` — додати вручну
- Помилки / складні моменти: <запиши свої або залиш порожнім>
- Що повторити наступного разу:
  - Чому `OVER()` зберігає всі рядки, а `GROUP BY` схлопує
  - Як SQL рахує window function для кожного рядка окремо
  - Що таке "вікно" (window) у конкретному запиті
- Fabric → Git commit: "Committing 1 item from workspace fd639292-9992-4fad-b74d-48741ff047ef"

---

## Що зроблено окремо (інфраструктура)
- ✅ Fabric trial активований (59 days left)
- ✅ Fabric workspace `sql-window-functions-30-days` створений
- ✅ Warehouse `sales` створений
- ✅ GitHub repo `Dima13111986/sql-window-functions-30-days` створений
- ✅ Fabric Git Integration: workspace ↔ GitHub (Synced)
- ✅ Перша таблиця створена і засинхронена в Git
- ⬜ Папка `sql/queries/` для курсових queries — створити локально і запушити
- ⬜ VS Code + mssql extension — опціонально для майбутніх днів

---

## TODO перед Днем 2
1. Створити локально папку `sql/queries/`.
2. Створити файл `sql/queries/day-01-over-partition.sql` з повним кодом Дня 1 (DROP/CREATE/INSERT + SELECT з OVER + AVG + MAX варіант з міні-завдання).
3. Закомітити: `git add . && git commit -m "Day 01: course queries — OVER and PARTITION BY" && git push`
4. (Опціонально) Виконати міні-завдання Дня 1 і теж зберегти.
