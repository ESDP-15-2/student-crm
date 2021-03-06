# language: ru

Функционал: Для управления списками получателей
  в качестве администратора системы
  я хочу создавать, редактировать и удалять списки получателей

  Сценарий: Создание списка получателей
    Допустим я вхожу в систему как администратор
    Если я создаю список получателей с названием "New contact list"
    То я вижу на странице "New contact list"
    
  Сценарий: Редактирование списка получателей
    Допустим я вхожу в систему как администратор
    Если я выбираю список и меняю его название на "Edited contact list"
    То я вижу на странице "Edited contact list"

  Сценарий: Удаление списка получателей
    Допустим я вхожу в систему как администратор
    Если я удаляю список
    То я не вижу на странице "Contact list"