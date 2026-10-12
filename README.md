# Tornado Hunt Game

Полнофункциональная 3D игра на Godot 4.x для охоты на торнадо и экстремальных погодных явлений.

## Возможности

✅ **Главное меню** - Красивый интерфейс с выбором режимов  
✅ **Режимы игры** - Охотник, Торнадо, Облака (разблокируются прогрессией)  
✅ **3D мир** - Дороги, поля пшеницы, холмы, дома (как в Оклахоме)  
✅ **Система погоды** - Грозы, торнадо разных категорий, ветер, облака  
✅ **Управление** - Джойстик (WASD), вращение камеры мышью  
✅ **Боевая система** - Прицел, система атаки, уровень торнадо  
✅ **UI элементы:**
  - 📡 Радар (показывает торнадо и погодные явления)
  - 🗺️ Карта (полный обзор территории)
  - 🗺️ Мини-карта (в углу экрана)
  - 📸 Фото-режим (фотографируй погоду - больше действия = больше денег)
  - 📰 Новости и уведомления
  - ⏸️ Меню паузы

✅ **Звуковые эффекты** - Гроза, ветер, торнадо, музыка  
✅ **Экономика** - Заработок за фотографии, покупка улучшений  
✅ **Прогрессия** - Разблокировка режимов и машин  
✅ **Машина игрока** - Различные автомобили для охоты  

## Установка

1. Клонируйте репозиторий
2. Откройте проект в Godot 4.1+
3. Запустите сцену `res://scenes/ui/main_menu.tscn`

## Структура проекта

```
.
├── scenes/
│   ├── ui/
│   │   ├── main_menu.tscn
│   │   ├── game_hud.tscn
│   │   ├── radar.tscn
│   │   ├── minimap.tscn
│   │   └── pause_menu.tscn
│   ├── game/
│   │   ├── game_world.tscn
│   │   ├── player_car.tscn
│   │   ├── tornado.tscn
│   │   ├── storm.tscn
│   │   └── environment.tscn
│   └── weather/
│       ├── clouds.tscn
│       ├── rain.tscn
│       └── lightning.tscn
├── scripts/
│   ├── game_manager.gd
│   ├── player_controller.gd
│   ├── weather_system.gd
│   ├── ui/
│   │   ├── main_menu.gd
│   │   ├── game_hud.gd
│   │   ├── radar.gd
│   │   └── minimap.gd
│   └── entities/
│       ├── tornado.gd
│       ├── storm.gd
│       └── car.gd
├── assets/
│   ├── audio/
│   │   ├── tornado.ogg
│   │   ├── storm.ogg
│   │   ├── wind.ogg
│   │   └── music/
│   ├── textures/
│   └── models/
└── project.godot
```

## Управление

- **WASD** - Движение машины
- **Мышь** - Вращение камеры
- **ЛКМ** - Атака/Стрельба
- **M** - Открыть карту
- **R** - Радар
- **P** - Пауза
- **F** - Фото-режим

## Версия

Годот 4.1+  
Лицензия: MIT


## Project links

This game is an independent prototype in the creator's wider project collection. It is not part of the stable QKC product line.

- [OuRi Corp — project directory](https://spaj7468-cell.github.io/ouri-corp/)
- [All GitHub repositories](https://github.com/spaj7468-cell?tab=repositories)

Projects in the collection were created at different times and have different scopes and maturity levels; this prototype may change independently of the other sites.