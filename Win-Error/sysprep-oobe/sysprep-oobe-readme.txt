
Win + r: sysprep

Переход в окно приветствия системы (OOBE) означает что после завершения сброса
	при следующем запуске появится настройка первого запуска,
	где мы будем указывать имя пользователя, давать имя своему компьютеру и т.д,
	а галочка напротив параметра Подготовка к использованию в Sysprep
	поможет нам сбросить активацию ОС Windows.

Параметры завершения работы дают нам выбор:
	Завершение установки — выбираем в том случае,
		когда мы собираемся заменить материнскую плату или процессор.
		А сам сброс мы выподняем ДО (!) замены оборудования
	Перезагрузка — данный пункт нам нужен в случае сброса лицензии или устранения
		каких-то ошибок на текущей конфигурации компьютера (без замены комплектующих)
		для чистой установки всех необходимых драйверов.
	Выход — соответственно завершает сеанс пользователя по завершению.



Ошибки запуска утилиты.

1) :Произошла неустранимая ошибка при выполнении sysprep

WIN + r: regedit

HKLM/SOFTWARE/Microsoft/Windows NT/CurrentVersion/SoftwareProtectionPlatform

SkipRearm = 1 или 0

И / или:

HKLM/SYSTEM/Setup/Status/SysprepStatus

GeneralizationState=7
CleanupState=2

Если не помогло. cmd - admin.

msdtc -uninstall
msdtc -install

Тем самым мы перезапустим службу координатора распределенных транзакций MSDTC.
И после этого для верности перезапустите машину.

2) :Sysprep не удалось проверить установку Windows

C:\Windows\System32\Sysprep\Panther

setupact.log - журнал программы sysprep.
Смотрим что за ошибку мы поймали.

3) :Отключение BitLocker

cmd - admin.

manage-bde -off X:

Или командой через PowerShell:

Disable-Bitlocker –MountPoint "X:"

Где X - это буква вашего системного диска.

4) :Не удается удалить современные приложения у текущего пользователя

Error SYSPRP Package Application_2.2.5.666_x64__xxxx was installed for a user, but not provisioned for all users. This package will not function properly in the sysprep image.
Error SYSPRP Failed to remove apps for the current user: 0x80073cf2.

Такая ошибка появляется, когда вы устанавливали приложение из Windows Store или криво его удалили :-)

Удалим через PowerShell командой:

Get-AppxPackage –Name Application | Remove-AppxPackage
Remove-AppxProvisionedPackage -Online -PackageName Application_2.2.5.666_x64__xxxx



























