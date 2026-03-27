Мигание диодом реализовано через прерывание. Если кнопка нажата (HAL_GPIO_ReadPin(USER_BTN_GPIO_Port, USER_BTN_Pin) == GPIO_PIN_SET), то период таймера обновляется __HAL_TIM_SET_AUTORELOAD(&htim6, periods[freq_index]) и счетчик таймера обнуляется __HAL_TIM_SET_COUNTER(&htim6, 0). 
Прерывание по таймеру HAL_GPIO_TogglePin(LED_GREEN_GPIO_Port, LED_GREEN_Pin) инвертирует состояние светодиода с нужной частотой.

Для запуска кода нужно собрать проект, например, сочетанием ctrl+b, а затем прошить файл Embedded-systems\LED_Blink_Button\Debug\LED_Blink_Button.elf на плату, я прошивала через CubeProgrammer. 
