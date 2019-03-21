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

#ifndef HHWIREINCOMMAND_H
#define HHWIREINCOMMAND_H

#include <stdint.h>
#include "hhcommand.h"

class FrontPanel;

class HHWireinCommand : public HHCommandBase
{
public:
    HHWireinCommand(const std::string& name);

    virtual void execute() override;

    virtual void setValue(uint32_t value) override;
    void setAddress(uint32_t address);
    void setMask(uint32_t mask);

    virtual HHCommandBase* clone() override;

private:
    uint32_t     m_uiAddress;
    uint32_t     m_uiValue;
    uint32_t     m_uiMask;
};

#endif // HHWIREINCOMMAND_H