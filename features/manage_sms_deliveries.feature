# language: ru
  
Функционал: Для управления смс-расссылками
  В качестве администратора системы
  Я хочу создавать, редактировать и удалять рассылки
  
  Сценарий: Создание смс-рассылки
    Допустим я вхожу в систему как администратор
    Если я создаю рассылку с данными:
    |title       |content                        |
    |New delivery|This is content of sms-delivery|
    То я вижу на странице "New delivery"
    
  Сценарий: Редактирование смс-рассылки
    Допустим я вхожу в систему как администратор
    Если я выбираю рассылку и меняю его название на "Edited delivery"
    То я вижу на странице "Edited delivery"

  Сценарий: Удаление смс-рассылки
    Допустим я вхожу в систему как администратор
    Если я удаляю рассылку
    То я не вижу на странице "Delivery"