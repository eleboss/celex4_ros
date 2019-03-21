/*
* Copyright (c) 2017-2018 CelePixel Technology Co. Ltd. All Rights Reserved
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*      http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
*/

#ifndef CONSTANTS_H
#define CONSTANTS_H

#define SLIDER_DELAY 100
#define MAX_LOG_LINES 100

#define PIPEOUT_TIMER 10
#define EVENT_SIZE 4
#define PIXELS_PER_COL 768
#define PIXELS_PER_ROW 640
#define PIXELS_NUMBER 491520

#define MIRROR_VERTICAL 1
#define MIRROR_HORIZONTAL 1

#define FILE_COMMANDS "commands.xml"
#define FILE_SEQUENCES "sequences.xml"
#define FILE_SLIDERS "sliders.xml"

#define SEQUENCE_LAYOUT_WIDTH 3 //7
#define SLIDER_LAYOUT_WIDTH   1 //4
#define DIALOG_LAYOUT_WIDTH   2

#define FPN_CALCULATION_TIMES 5

#define TIMER_CYCLE 25000000  //1s
#define HARD_TIMER_CYCLE 262144  //2^17=131072; 2^18=262144

#endif // CONSTANTS_H
