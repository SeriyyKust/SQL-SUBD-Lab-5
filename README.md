Тестовая таблица из двух числовых полей код – значение, первичный ключ поле «код». Таблица заполнена записями со значением 0 (более 1 000 000 записей, в зависимости от характеристик оборудования). Далее перед каждым прогоном инициализируем таблицу заново.

Тест 1
1. Установите наименьший доступный уровень изоляции
транзакций.
2. Создайте процесс – писатель с бесконечным циклом, внутри
которого находится транзакция, меняющая значения двух случайно
выбранных полей на +1 и -1 (чтобы сумма значений всей таблицы
продолжала оставаться 0). После транзакции установите в цикле задержку
в 100 миллисекунд.
3. Создайте процесс – читатель в виде транзакции считающей
сумму значений по всей таблице.
4. Задайте просмотр блокировок для каждого процесса.
5. Запустите процесс читатель несколько (не менее 10) раз
последовательно при запущенном процессе писателе. Соберите
полученные результаты и сделайте выводы.
6. Повторите тест для всех других уровней изоляции.

Тест 2
1. Измените процесс – читатель так, чтобы он проводил подсчет
суммы значений в таблице, затем следовала задержка, затем снова проводился подсчет. Запускайте его на небольшом диапазоне записей
(например, на 1000).
2. Разработайте процесс – писатель, который будет внутри транзакции
добавлять запись в таблицу с кодом больше существующего и значением
111. После вставки перед концом транзакции установите задержку в 100
миллисекунд.
3. Задайте просмотр блокировок для каждого процесса.
4. Запустите процесс – читатель и затем, во время паузы, запустите
второй процесс – писатель.
5. Проведите тест для всех уровней изоляции по 5 раз. Соберите
полученные результаты и сделайте выводы.
6. Проведите тест для всех уровней изоляции по 3 раза. Соберите
полученные результаты и сделайте выводы.

Тест 3
1. Оставьте прежний процесс читатель.
2. Для процесса писателя перед концом транзакции установите
задержку и, после нее, откат транзакции.
3. Запустите процесс – писатель и затем, во время паузы запустите
второй процесс – читатель.
4. Отрегулируйте время задержек таким образом, чтобы первый
подсчет происходил во время задержки писателя, а второй уже после его
отката.
5. Задайте просмотр блокировок для каждого процесса.
6. Проведите тест для всех уровней изоляции по 5 раз. Соберите
полученные результаты и сделайте выводы.

Тест 4
1. Разработайте процесс – писатель, который внутри транзакции:
- подсчитывает сумму значений в таблице и записывает ее в
переменную;
- содержит задержку на 3 (или более) секунды;
- проверяет условие на равенство переменной суммы 0;
- если условие выполняется, вставляет запись с кодом 1 200 000 и
значением 111.
2. Разработайте процесс – писатель, который вставляет запись с кодом
1 200 000 и значением 111. После вставки перед концом транзакции
установите задержку в 100 миллисекунд.
3. Запустите первый процесс – писатель и затем, во время паузы,
запустите второй процесс – писатель.
4. Задайте просмотр блокировок для каждого процесса.
5. Проведите тест для всех уровней изоляции по 2 раза. Соберите
полученные результаты и сделайте выводы.