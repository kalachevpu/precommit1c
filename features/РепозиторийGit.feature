# language: ru

Функционал: Выполнение операций с репозиторием Git
    Как Пользователь
    Я хочу иметь возможность выполнять различные операции с репозиторием Git
    Чтобы я мог проще устанавливать precommit1c в свой репозиторий

Контекст:
    Допустим Я создаю временный каталог и сохраняю его в контекст
    И Я сохраняю каталог проекта в контекст
    И Я устанавливаю временный каталог как рабочий каталог
    И Я установил рабочий каталог как текущий каталог
    И Я выполняю команду "git" с параметрами 'init'

Структура сценария: Проверка настроек репозитория Git (простой отрицательный) - <Настройка>
    Когда Я копирую файл "v8files-extractor.os" из каталога "" проекта в подкаталог ".git/hooks" рабочего каталога
    И Я выполняю команду "git" с параметрами "config --local core.quotepath false"
    И Я выполняю команду "git" с параметрами "config --local core.longpaths true"
    И Я выполняю команду "git" с параметрами <Настройка>
    И Я выполняю команду "oscript" с параметрами '.git/hooks/v8files-extractor.os --git-check-config'
    Тогда вывод команды "oscript" содержит  "У текущего репозитария не заданы необходимые настройки!"

Примеры:
    |Настройка|
    |config --local core.quotepath true|
    |config --local core.longpaths false|

Сценарий: Проверка настроек репозитория Git (простой положительный)
    Когда Я копирую файл "v8files-extractor.os" из каталога "" проекта в подкаталог ".git/hooks" рабочего каталога
    И Я выполняю команду "git" с параметрами "config --local core.quotepath false"
    И Я выполняю команду "git" с параметрами "config --local core.longpaths true"
    И Я выполняю команду "oscript" с параметрами ".git/hooks/v8files-extractor.os --git-check-config"
    Тогда вывод команды "oscript" не содержит "У текущего репозитария не заданы необходимые настройки!"

Сценарий: Установка precommit1c в репозиторий
    Когда Я выполняю команду "oscript" с параметрами "<КаталогПроекта>/v8files-extractor.os --install"
    И Я выполняю команду "oscript" с параметрами ".git/hooks/v8files-extractor.os --git-check-config"
    Тогда В рабочем каталоге существует каталог ".git/hooks"
    И В рабочем каталоге существует каталог ".git/hooks/v8Reader"
    И В рабочем каталоге существует каталог ".git/hooks/tools"
    И В рабочем каталоге существует файл ".git/hooks/v8Reader/V8Reader.epf"
    И В рабочем каталоге существует файл ".git/hooks/pre-commit"
    И В рабочем каталоге существует файл ".git/hooks/v8files-extractor.os"
    И В рабочем каталоге существует файл ".git/hooks/tools/v8unpack.exe"
    И вывод команды "oscript" не содержит "У текущего репозитария не заданы необходимые настройки!" 

Сценарий: Установка precommit1c в репозиторий с указанием сервисной базы
    Когда Я выполняю команду "oscript" с параметрами "<КаталогПроекта>/v8files-extractor.os --install --ib-connection-string /Fc:\test\ib --ib-user UserTest --ib-pwd ********"
    И Я выполняю команду "oscript" с параметрами ".git/hooks/v8files-extractor.os --git-check-config"
    Тогда В рабочем каталоге существует каталог ".git/hooks"
    И В рабочем каталоге существует каталог ".git/hooks/v8Reader"
    И В рабочем каталоге существует каталог ".git/hooks/tools"
    И В рабочем каталоге существует файл ".git/hooks/v8Reader/V8Reader.epf"
    И В рабочем каталоге существует файл ".git/hooks/pre-commit"
    И В рабочем каталоге существует файл ".git/hooks/v8files-extractor.os"
    И В рабочем каталоге существует файл ".git/hooks/tools/v8unpack.exe"
    И файл ".git/hooks/pre-commit" в рабочем каталоге содержит "oscript -encoding=utf-8 .git/hooks/v8files-extractor.os --git-precommit src --ib-connection-string /Fc:\test\ib --ib-user UserTest --ib-pwd ********"
    И вывод команды "oscript" не содержит "У текущего репозитария не заданы необходимые настройки!" 

Сценарий: Установка precommit1c в репозиторий с указанием сервисной базы и использованием конфигуратора
    Когда Я выполняю команду "oscript" с параметрами "<КаталогПроекта>/v8files-extractor.os --install --use-designer --ib-connection-string /Fc:\test\ib --ib-user UserTest --ib-pwd ********"
    И Я выполняю команду "oscript" с параметрами ".git/hooks/v8files-extractor.os --git-check-config"
    Тогда В рабочем каталоге существует каталог ".git/hooks"
    И В рабочем каталоге существует каталог ".git/hooks/v8Reader"
    И В рабочем каталоге существует каталог ".git/hooks/tools"
    И В рабочем каталоге существует файл ".git/hooks/v8Reader/V8Reader.epf"
    И В рабочем каталоге существует файл ".git/hooks/pre-commit"
    И В рабочем каталоге существует файл ".git/hooks/v8files-extractor.os"
    И В рабочем каталоге существует файл ".git/hooks/tools/v8unpack.exe"
    И файл ".git/hooks/pre-commit" в рабочем каталоге содержит "oscript -encoding=utf-8 .git/hooks/v8files-extractor.os --git-precommit src --use-designer --ib-connection-string /Fc:\test\ib --ib-user UserTest --ib-pwd ********"
    И вывод команды "oscript" не содержит "У текущего репозитария не заданы необходимые настройки!" 
