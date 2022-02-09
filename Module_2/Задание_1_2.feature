﻿#language: ru
@tree

Функционал: Проверка заполнения документа "Заказ"

Как Администратор
Я хочу проверить расчета поля Количество (итог) документа "Заказ"

Контекст:
	Дано Я запускаю сценарий открытия TestClient или подключаю уже существующий

Сценарий: Подготовка данных
	
	// Справочник.Валюты

	И я проверяю или создаю для справочника "Валюты" объекты:
		| 'Ссылка'                                                            | 'ПометкаУдаления' | 'Код'       | 'Наименование' | 'НаименованиеОсновнойВалюты' | 'НаименованиеРазменнойВалюты' |
		| 'e1cib/data/Справочник.Валюты?ref=a9b000055d49b45e11db8c4421dda1c5' | 'False'           | '000000001' | 'Рубли'        | 'рубль'                      | 'копейка'                     |

	// Справочник.ВидыЦен

	И я проверяю или создаю для справочника "ВидыЦен" объекты:
		| 'Ссылка'                                                             | 'ПометкаУдаления' | 'Код'       | 'Наименование' |
		| 'e1cib/data/Справочник.ВидыЦен?ref=a9b000055d49b45e11db8c4c9d5c4224' | 'False'           | '000000001' | 'Розничная'    |

	// Справочник.Контрагенты

	И я проверяю или создаю для справочника "Контрагенты" объекты:
		| 'Ссылка'                                                                 | 'ПометкаУдаления' | 'Родитель'                                                               | 'ЭтоГруппа' | 'Код'       | 'Наименование'    | 'Регион'                                                             | 'Индекс' | 'Страна' | 'Город'  | 'Улица'         | 'Дом' | 'Телефон'          | 'ЭлектроннаяПочта' | 'Факс'             | 'ВебСайт' | 'ВидЦен'                                                             | 'ДополнительнаяИнформация' | 'КонтактноеЛицо' | 'Широта'  | 'Долгота' |
		| 'e1cib/data/Справочник.Контрагенты?ref=8ca0000d8843cd1b11dc8d043d71007d' | 'False'           | 'e1cib/data/Справочник.Контрагенты?ref=a9b000055d49b45e11db8c4c9d5c422d' | 'False'     | '000000015' | 'Магазин "Обувь"' | 'e1cib/data/Справочник.Регионы?ref=a9b000055d49b45e11db8c4c9d5c422f' | '356895' | 'Россия' | 'Москва' | 'Маросейка'     | '2'   | '+7(999)256-56-14' | 'kolodkin@obuv.ru' | '+7(999)256-56-10' | ''        | 'e1cib/data/Справочник.ВидыЦен?ref=a9b000055d49b45e11db8c4c9d5c4224' | ''                         | 'Колодкин И. В.' | 55.757689 | 37.63277  |
		| 'e1cib/data/Справочник.Контрагенты?ref=a9c500055d49b45e11dbf348086715b0' | 'False'           | 'e1cib/data/Справочник.Контрагенты?ref=a9b000055d49b45e11db8c4c9d5c422c' | 'False'     | '000000010' | 'Корнет ЗАО'      | 'e1cib/data/Справочник.Регионы?ref=a9b000055d49b45e11db8c4c9d5c422f' | '221134' | 'Россия' | 'Москва' | 'ул. Молодцова' | '4'   | '+7(999)789-67-85' | 'liepa@kornet.ru'  | ''                 | ''        | 'e1cib/data/Справочник.ВидыЦен?refName=Закупочная'                   | ''                         | 'Лиепа А.П.'     | 55.87825  | 37.64153  |
		| 'e1cib/data/Справочник.Контрагенты?ref=a9b000055d49b45e11db8c4c9d5c422d' | 'False'           | ''                                                                       | 'True'      | '000000002' | 'Покупатели'      | ''                                                                   | ''       | ''       | ''       | ''              | ''    | ''                 | ''                 | ''                 | ''        | ''                                                                   | ''                         | ''               | ''        | ''        |
		| 'e1cib/data/Справочник.Контрагенты?ref=a9b000055d49b45e11db8c4c9d5c422c' | 'False'           | ''                                                                       | 'True'      | '000000001' | 'Поставщики'      | ''                                                                   | ''       | ''       | ''       | ''              | ''    | ''                 | ''                 | ''                 | ''        | ''                                                                   | ''                         | ''               | ''        | ''        |

	// Справочник.Организации

	И я проверяю или создаю для справочника "Организации" объекты:
		| 'Ссылка'                                                                 | 'ПометкаУдаления' | 'Код'       | 'Наименование'       | 'ВалютныйУчет' |
		| 'e1cib/data/Справочник.Организации?ref=8d34000d8843cd1b11dd2bea12f94c63' | 'False'           | '000000001' | 'ООО "Все для дома"' | 'True'         |

	// Справочник.Пользователи

	И я проверяю или создаю для справочника "Пользователи" объекты:
		| 'Ссылка'                                                                  | 'ПометкаУдаления' | 'Код'           | 'Наименование'  | 'ИдентификаторПользователяИБ'          |
		| 'e1cib/data/Справочник.Пользователи?ref=a2bc001d600da75a11e1f76a026436bc' | 'False'           | 'Администратор' | 'Администратор' | '0f42f230-0f1f-42db-b5f3-f7b2b01f2aec' |

	// Справочник.Регионы

	И я проверяю или создаю для справочника "Регионы" объекты:
		| 'Ссылка'                                                             | 'ПометкаУдаления' | 'Код'       | 'Наименование' |
		| 'e1cib/data/Справочник.Регионы?ref=a9b000055d49b45e11db8c4c9d5c422f' | 'False'           | '000000001' | 'Москва'       |

	// Справочник.Склады

	И я проверяю или создаю для справочника "Склады" объекты:
		| 'Ссылка'                                                            | 'ПометкаУдаления' | 'Код'       | 'Наименование' | 'НеИспользовать' |
		| 'e1cib/data/Справочник.Склады?ref=a9b000055d49b45e11db8b8bdc1aadc2' | 'False'           | '000000001' | 'Малый'        | 'False'          |

	И я проверяю или создаю для справочника "Товары" объекты:
		| 'Ссылка'                                                            | 'ПометкаУдаления' | 'Родитель'                                                          | 'ЭтоГруппа' | 'Код'       | 'Наименование' | 'Артикул' | 'Поставщик'                                                              | 'ФайлКартинки'                                                             | 'Вид'                    | 'Штрихкод' | 'ВТ_Вес' |
		| 'e1cib/data/Справочник.Товары?ref=a9b000055d49b45e11db90e17cd1a8f0' | 'False'           | 'e1cib/data/Справочник.Товары?ref=a9b000055d49b45e11db8c51bbb079ae' | 'False'     | '000000005' | 'Тапочки'      | 'ОБ-008'  | 'e1cib/data/Справочник.Контрагенты?ref=a9c500055d49b45e11dbf348086715b0' | 'e1cib/data/Справочник.ХранимыеФайлы?ref=a9d700179a069b1011dc3e85df74aa1c' | 'Enum.ВидыТоваров.Товар' | ''         |          |
		| 'e1cib/data/Справочник.Товары?ref=a9b000055d49b45e11db8c51bbb079ae' | 'False'           | ''                                                                  | 'True'      | '000000001' | 'Обувь'        | ''        | ''                                                                       | ''                                                                         | ''                       | ''         | ''       |

	// Справочник.ХранимыеФайлы

	И я проверяю или создаю для справочника "ХранимыеФайлы" объекты:
		| 'Ссылка'                                                                   | 'ПометкаУдаления' | 'Владелец'                                                          | 'Код'       | 'Наименование' | 'ДанныеФайла'                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           | 'ИмяФайла'    | 'Подпись'                               | 'Подписан' | 'Зашифрован' |
		| 'e1cib/data/Справочник.ХранимыеФайлы?ref=a9d700179a069b1011dc3e85df74aa1c' | 'False'           | 'e1cib/data/Справочник.Товары?ref=a9b000055d49b45e11db90e17cd1a8f0' | '000000005' | 'Тапочки'      | 'ValueStorage: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' | 'Тапочки.jpg' | 'ValueStorage:AQEIAAAAAAAAAO+7v3siVSJ9' | 'False'    | 'False'      |

Сценарий: Заполнение документа "Заказ"

	И Заполнение шапки документа
	
	* Заполнение ТЧ документа
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000005' | 'Тапочки'      |
	И в таблице "Список" я выбираю текущую строку
	И в таблице "Товары" я активизирую поле с именем "ТоварыЦена"
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '800,00'
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '2'
	И в таблице "Товары" я завершаю редактирование строки
	И в таблице "Товары" я нажимаю на кнопку с именем 'ТоварыДобавить'
	И в таблице "Товары" я нажимаю кнопку выбора у реквизита с именем "ТоварыТовар"
	Тогда открылось окно 'Товары'
	И в таблице "Список" я перехожу к строке:
		| 'Код'       | 'Наименование' |
		| '000000005' | 'Тапочки'      |
	И в таблице "Список" я выбираю текущую строку
	Тогда открылось окно 'Заказ (создание) *'
	И в таблице "Товары" я активизирую поле с именем "ТоварыЦена"
	И в таблице "Товары" в поле с именем 'ТоварыЦена' я ввожу текст '800,00'
	И в таблице "Товары" я активизирую поле с именем "ТоварыКоличество"
	И в таблице "Товары" в поле с именем 'ТоварыКоличество' я ввожу текст '1'
	И в таблице "Товары" я завершаю редактирование строки

* Проверка СуммыДокумента при открытии документа "Заказ"

	И Я запоминаю значение выражения '0' в переменную "СуммаДокументаРасчетная"

	И для каждой строки таблицы "Товары" я выполняю
		И Я запоминаю значение поля с именем "ТоварыЦена" таблицы "Товары" как "ЦенаТовара"
		И Я запоминаю значение поля с именем "ТоварыКоличество" таблицы "Товары" как "КоличествоТовара"
		И Я запоминаю значение выражения '$СуммаДокументаРасчетная$ + $КоличествоТовара$ * $ЦенаТовара$' в переменную "СуммаДокументаРасчетная"			
	
	И я запоминаю значение поля с именем "ТоварыИтогСумма" как "СуммаДокумента"	
	Если 'Строка($СуммаДокументаРасчетная$) = $СуммаДокумента$' Тогда	
		И Я закрываю все окна клиентского приложения
	Иначе	
		Тогда Я вызываю исключение "Ошибка проверки сценария"
