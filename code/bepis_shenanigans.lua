--Welcome to where I store ALL of my (maybe) useful functions!
--Feel free to grab anything here :3

function table.contains(table, element) --Checks if the table has the given element.
	for _, value in pairs(table) do
		if value == element then
			return true
		end
	end
	return false
end

function table.equal(table1, table2, on_order, last) --Checks if table1 has all the elements in table2. on_order checks if the order is identical too. I wouldn't recommend setting last to anything.
    if on_order then            
        for i,v in ipairs(table1) do
            if type(v) == "table" then
                if not type(table2[i]) == "table" or not table.equal(v, table2[i], on_order) then return false end
            else
                if not table2 or not table2[i] or table2[i] ~= v then
                    return false
                end
            end
        end
        if not last then
            return table.equal(table2, table1, on_order, true)
        else
            return true
        end
    else
        for _,v in pairs(table1) do
            local equal = false
            if type(v) == "table" then
                for _,v2 in ipairs(table2) do
                    if type(v2) == "table" and table.equal(v,v2) then
                        equal = true; break
                    end
                end
            else
                for _,v2 in pairs(table2) do
                    if v2 == v then equal = true; break end
                end 
            end
            if not equal then return false end
        end
        if not last then
            return table.equal(table2, table1, on_order, true)
        else
            return true
        end
    end
end

function table.clone(table) --Clones a table.
    local ret = {}
    for i,v in pairs(table) do
        ret[i] = v
    end
    return ret
end

Yggdrasil.enhanceCard = function(_,other_card,enhancement,after,immediate,no_effects,haltunhighlight,effect_type) --Enhance cards.
    if not effect_type or effect_type == 1 then
        for _,othercard in ipairs(other_card) do
            if othercard.config.center.key ~= enhancement then
                if not no_effects then
                    G.E_MANAGER:add_event(Event({
                        trigger = (after and 'after') or (immediate and "immediate") or 'before',
                        delay = 0.2,
                        func = function()
                           othercard:flip()
                           othercard:juice_up()
                           if not haltunhighlight then
                              G.hand:add_to_highlighted(othercard)
                           end
                           return true
                         end
                     }))
                end
            end
        end
    
        for _,othercard in ipairs(other_card) do
            if othercard.config.center.key ~= enhancement then
                local e = enhancement
                if type(enhancement) == "table" then
                    e = pseudorandom_element(enhancement, pseudoseed("hsr_enhancecard_function"))
                end
                othercard:set_ability(G.P_CENTERS[e],nil,true)
                othercard.ability.hsr_enhancecard_function = true
            end
        end
    
        if not no_effects then
            for _,othercard in ipairs(other_card) do
                if othercard.ability.hsr_enhancecard_function then
                    othercard.ability.hsr_enhancecard_function = nil
                    G.E_MANAGER:add_event(Event({
                        trigger = (after and 'after') or (immediate and "immediate") or 'before',
                        delay = 0.2,
                        func = function()
                            othercard:flip()
                            if not haltunhighlight then
                                G.hand:remove_from_highlighted(othercard)
                            end
                            return true
                        end
                     }))
                end
            end
        end     
    elseif effect_type == 2 then
        for _,othercard in ipairs(other_card) do
            if othercard.config.center.key ~= enhancement then
                if not no_effects then
                    G.E_MANAGER:add_event(Event({
                        trigger = (after and 'after') or (immediate and "immediate") or 'before',
                        delay = 0.2,
                        func = function()
                           othercard:flip()
                           othercard:juice_up()
                           if not haltunhighlight then
                              G.hand:add_to_highlighted(othercard)
                           end
                           return true
                         end
                     }))
                end

                local e = enhancement
                if type(enhancement) == "table" then
                    e = pseudorandom_element(enhancement, pseudoseed("hsr_enhancecard_function"))
                end
                othercard:set_ability(G.P_CENTERS[e],nil,true)
                othercard.ability.hsr_enhancecard_function = true

                if not no_effects then
                    if othercard.ability.hsr_enhancecard_function then
                        othercard.ability.hsr_enhancecard_function = nil
                        G.E_MANAGER:add_event(Event({
                            trigger = (after and 'after') or (immediate and "immediate") or 'before',
                            delay = 0.2,
                            func = function()
                                othercard:flip()
                                if not haltunhighlight then
                                    G.hand:remove_from_highlighted(othercard)
                                end
                                return true
                            end
                         }))
                    end
                end
            end
        end
    end
end
 
Yggdrasil.unenhanceCard = function(card,other_card,after,immediate,no_effects,haltunhighlight) --Unenhance cards.
    Yggdrasil.enhanceCard(card,other_card,"c_base",after,immediate,no_effects,haltunhighlight)
end

Yggdrasil.animatedChangeBase = function(card, suit, rank, after, immediate, no_effects, haltunhighlight, immediateSuitChange)
    if immediateSuitChange then
        for _,othercard in ipairs(card) do
            local chosenRank = rank
            local chosenSuit = suit
        
            if type(chosenRank) == "table" then
                chosenRank = pseudorandom_element(chosenRank)
            end
        
            if type(chosenSuit) == "table" then
                chosenSuit = pseudorandom_element(chosenSuit)
            end
    
            SMODS.change_base(othercard,chosenSuit,chosenRank)
        end
    end

    if not no_effects then
        for _,othercard in ipairs(card) do
           G.E_MANAGER:add_event(Event({
              trigger = (after and 'after') or (immediate and "immediate") or 'before',
              delay = 0.2,
              func = function()
                 othercard:flip()
                 othercard:juice_up()
                 if not haltunhighlight then
                    G.hand:add_to_highlighted(othercard)
                 end
                 return true
               end
           }))
        end
    end

    --[[for _,othercard in ipairs(card) do

    end]]

    if not no_effects then
        for _,othercard in ipairs(card) do
           G.E_MANAGER:add_event(Event({
              trigger = (after and 'after') or (immediate and "immediate") or 'before',
              delay = 0.2,
              func = function()
                if not immediateSuitChange then
                    local chosenRank = rank
                    local chosenSuit = suit
                
                    if type(chosenRank) == "table" then
                        chosenRank = pseudorandom_element(chosenRank)
                    end
                
                    if type(chosenSuit) == "table" then
                        chosenSuit = pseudorandom_element(chosenSuit)
                    end
            
                    SMODS.change_base(othercard,chosenSuit,chosenRank) 
                end

                 othercard:flip()
                 if not haltunhighlight then
                    G.hand:remove_from_highlighted(othercard)
                 end
                 return true
               end
           }))
        end
    end    
end
 
Yggdrasil.addToTable = function(a,b) --Add all content from table b to table a which are not already in table a.
    if type(a) ~= "table" or type(b) ~= "table" then
       return {}
    end
 
    local ret = a
 
    for i,v in ipairs(b) do
       local alreadyExisting = false
       for g,h in ipairs(ret) do if h == v then alreadyExisting = true break end end --Ignore content from table b if it already exists in table a.
       
       if not alreadyExisting then
          ret[#ret+1] = v
       end
    end
 
    return ret
end
 
Yggdrasil.selectRandomCards = function(b,c) --In its name.
    local min = 1
    local max = b or 1
 
    local area = {}
    for _,v in ipairs(c) do
       area[#area+1] = v
    end
 
    local ret = {}
 
    for i = min,max do
       ret[#ret+1] = pseudorandom_element(area, pseudoseed("hsr_selectrandomcards_function"))
       for index,v in ipairs(area) do
          if v == ret[#ret] then
             area[index] = nil
          end
       end
    end
 
    return ret
end

Yggdrasil.tableIsUnique = function(a,b,c) --If table a has no elements similar to table b, return true. Else, return false. If c is declared, only return false if both table a and table b have c.
    if c then
       if type(c) == "table" then
          for _,v in ipairs(c) do
             for _,v2 in pairs(a) do
                if v2 == v then
                   for _,v3 in pairs(b) do
                      if v3 == v then
                         return false
                      end
                   end
                end
             end
          end
 
       else
          for _,v2 in pairs(a) do
             if v2 == c then
                for _,v3 in pairs(b) do
                   if v3 == v then
                      return false
                   end
                end
             end
          end
 
       end
    else
 
       for _,v1 in pairs(a) do
          for _,v2 in pairs(b) do
             if v2 == v1 then
                return false
             end
          end
       end
       
    end
 
    return true 
end

Yggdrasil.convertFromPercentage = function(i) --...yeah.
    return i/100
end

Yggdrasil.incrementAll = function(table) --Increase the individual number by all numbers in a table.
    if table and type(table) == "table" then
        local a = 0
        for _,v in pairs(table) do
            if type(v) == "number" then
                a = a + v
            end
        end
        return a
    elseif table and type(table) == "number" then
        return table
    else
        print("Unreadable numbers [function: incrementAll]")
        return false
    end
end

Yggdrasil.multiplyAll = function(num,table) --Multiply the individual number with all numbers in a table.
    local a = 0
    if num and table and type(num) == "number" and type(table) == "table" then
        a = num
        for _,v in pairs(table) do
            if type(v) == "number" then
                a = a * v
            end
        end
    elseif num and table and type(num) == "number" and type(table) == "number" then
        a = num * table
    else
        print("Unreadable numbers [function: multiplyAll]")
        return 0
    end
    return a
end

Yggdrasil.findPart = function(str,startPos,endCharacter) --Find certain parts of a string.
    local endPos = 0

    for i = startPos, #str do
        local character = str:sub(i,i)
        if character == endCharacter then
            endPos = i
            break
        end
    end

    local foundPart = string.sub(str,startPos,endPos)
    return foundPart
end

function removeParts(b,replace) --Remove certain parts of a string.
    local partToRemove = {
        "{C:",
        "{X:",
        "{s:",
        "{V:",
        "{E:",
        "{B:"
    } 

    if type(b) == "string" then    
        local finalStr = b            
        for _,part in pairs(partToRemove) do
            local additionalSpace = 0
            for i = 1,#finalStr do
                local threeChars = string.sub(finalStr, i + additionalSpace, i + additionalSpace + 2)
                if threeChars == part then
                    local startPos = i + additionalSpace
                    local foundPart = Yggdrasil.findPart(finalStr,startPos,"}")
                    additionalSpace = additionalSpace + (#finalStr + (#foundPart - #finalStr))
                    finalStr = finalStr:gsub(foundPart,"")
                end
            end
        end
        finalStr = finalStr:gsub("{}","")

        local startPos = 0
        if replace then
            for g = 1, #finalStr do
                local character = finalStr:sub(g,g)
                if character == "#" then
                    startPos = g
                    break
                end
            end

            finalStr = finalStr:gsub("#"..Yggdrasil.findPart(finalStr,startPos + 1,"#"),replace)
        end

        return finalStr
    end
end

Yggdrasil.firstToUpper = function(str) --Uppercase the first letter.
    return (str:gsub("^%l", string.upper))
end

Yggdrasil.toNormalString = function(a,replace) --Convert colored strings to normal strings.
    local returnStr = nil

    if a and type(a) == "table" then
        returnStr = {}
        for i,str in pairs(a) do
            if type(str) == "string" then                
               local result = removeParts(str,replace)
               returnStr[i] = result
            end
        end
    elseif a and type(a) == "string" then
        if type(a) == "string" then                
            local result = removeParts(a,replace)
            returnStr = result
        end
    else
        print("Unreadable string [function: toNormalString]")
        return ""
    end

    return returnStr
end

function string.insert(str1, str2, pos) --...need I explain?
    return str1:sub(1,pos)..str2..str1:sub(pos+1)
end

Yggdrasil.trueIfNumber = function(a) --Return true if the input value is a number.
    if a and (tonumber(a) or type(a) == "number") then return true end
end

Yggdrasil.automaticColoring = function(a, fullModify) --spaghetti code :sob: But basically, it automatically colors certain parts of a string.
    if a and type(a) == "string" then
        local returnStr = a
        local additionalSpace = 0 --Since we will be adding {}, {C:mult},... a lot into the string, we will need this to let the code know the string has been expanded, or vice versa.

        local modifications = {
            ["s"] = nil, --The entire string will change its size accordingly to this.
            ["C"] = nil, --The entire string will change its color accordingly to this except gains, though it can be changed.
            ["X"] = nil, --The entire string will change its background accordingly to this. Not sure why you would want that, but it's an option.
            ["V"] = nil,
            ["E"] = nil,
            ["change_gains"] = true, --Allows X1.5, +30.4, etc. to change colour to their presets respective to its buff (Chips, Mult, Xchips,...)
            ["override_gains_modifications"] = false, --Allows gains to be changed with modifications["s"] and modifications["C"]. ignoring its preset if true. For consistency, Size is still changed accordingly regardless of whether this is enabled or not.
            ["force_keep_gains_size"] = false, --If enabled, gains will be the same size regardless of modifications["s"].
            ["override_keywords"] = false,

            --All of those are presets for what gains should look like in a Joker's description which I don't really suggest changing. Though, you do you.
            --Also, you can add ["s"] in here and it will also work individually for only a specific gain type.
            ["mult"] = {
                ["C"] = "mult",
            },
            ["chips"] = {
                ["C"] = "chips",
            }, 
            ["Xmult"] = {
                ["X"] = "mult",
                ["C"] = "white",
            },
            ["Xchips"] = {
                ["X"] = "chips",
                ["C"] = "white",
            },   

            ["additional_keywords"] = (fullModify["additional_keywords"] or {})

            --[[How to add keywords, as an example:
            ["additional_keywords"] = {
                ["Hello World!"] = {
                    ["C"] = "white",
                },
            }
            ]]
        }

        --Change modifications if input (fullModify) is made.
        if fullModify and type(fullModify) == "table" then
            for i,v in pairs(fullModify) do
                modifications[i] = v
            end
        end

        if not modifications["change_gains"] then goto continue end --Basically, skip the entire thing.
        for i = 1,#returnStr do --Check for gains.
            local character = returnStr:sub(i+additionalSpace,i+additionalSpace) --Check for each character in the string.
            if character == "X" or character == "+" then --This will help me choose parts which start with X and +.
                local startPosForColoring = i+additionalSpace-1 --Tell the code where to start with finding the gain. (Ex: X3.5)
                local endPosForColoring = i+additionalSpace --Placeholder, tell the code where to end. In the middle of startPosForColoring and endPosForColoring is where the gain is.
                local color = nil --Either "chips" or "mult".
                local canBeColored = false --...yeah
                local ogCharacter = character --Basically telling whether it's "X" or "+", made a big oopsie down there so I made this variable.

                for g = i+additionalSpace+1,#returnStr do
                    character = returnStr:sub(g,g)
                    if tonumber(character) or character == "." then
                        endPosForColoring = g
                        canBeColored = true
                    else
                        break
                    end
                end --This loop is to help knowing the exact location of the gain.

                if not canBeColored then goto inside_continue end --So that if it's just a normal +, X without numbers behind then the code will not consider it as a gain.

                for g = endPosForColoring,#returnStr do
                    local keyword = returnStr:sub(g,g+3)
                    if string.lower(keyword) == "chip" then
                        color = "chips"
                        break
                    elseif string.lower(keyword) == "mult" then
                        color = "mult"
                        break
                    end
                end

                local coloredPart = string.sub(returnStr,startPosForColoring+1,endPosForColoring) --The gain itself.

                local a = string.sub(returnStr,1,startPosForColoring)
                local b = string.sub(returnStr,endPosForColoring+1,#returnStr) 
                --Cutting the string into two halves with the gain being the middle part. So, the whole string is technically "a..coloredPart..b".
                local addon = "{"

                function modify(x,y)
                    local returnStr = addon

                    if not modifications["force_keep_gains_size"] and x == "s" and modifications[x] and Yggdrasil.trueIfNumber(modifications[x]) then
                        returnStr = returnStr..x..":"..modifications[x]..","
                    end

                    if modifications["override_gains_modifications"] then
                        if modifications[x] then
                            if x == "s" and not modifications["force_keep_gains_size"] then
                                returnStr = returnStr..x..":"..modifications[x]..","
                            else
                                returnStr = returnStr..x..":"..modifications[x]..","
                            end
                        end
                    end
        
                    if not string.find(returnStr,x..":") then 
                        if x == "s" or x == "V" or x == "E" then
                            if modifications[y][x] and Yggdrasil.trueIfNumber(modifications[y][x]) and ((not modifications["override_gains_modifications"]) or (modifications["override_gains_modifications"] and not modifications[x])) then
                                returnStr = returnStr..x..":"..modifications[y][x]..","
                            end
                        else
                            if modifications[y][x] and ((not modifications["override_gains_modifications"]) or (modifications["override_gains_modifications"] and not modifications[x])) then
                                returnStr = returnStr..x..":"..modifications[y][x]..","
                            end
                        end 
                    end
        
                    addon = returnStr
                end

                if ogCharacter == "X" then
                    modify("s","X"..color) --Size handler
                    modify("C","X"..color) --Text color handler
                    modify("X","X"..color) --Background color handler
                    modify("V","X"..color) 
                    modify("E","X"..color) 
                elseif ogCharacter == "+" then
                    modify("s",color) --Size handler
                    modify("C",color) --Text color handler
                    modify("X",color) --Background color handler
                    modify("V",color) 
                    modify("E",color) 
                end

                addon = string.sub(addon,1,#addon-1)
                addon = addon.."}"

                --addon is basically "{s:0.5,C:mult}".
                
                local ending = "{}"
                local newString = a..addon..coloredPart..ending..b --Fusing everything together into one string.
                additionalSpace = additionalSpace + (#newString - #returnStr)
                returnStr = newString
            end
            ::inside_continue::
        end
        ::continue::

        if modifications["additional_keywords"] ~= {} then
            for i,v in pairs(modifications["additional_keywords"]) do
                local placeholderStr = returnStr
                local start,ending = nil, nil
                local addSpace = 0
                local awaitingKeywords = {}

                repeat
                    if string.find(placeholderStr,i) then
                        start,ending = string.find(placeholderStr,i)

                        local cut1 = string.sub(placeholderStr,1,start)
                        local cut2 = string.sub(placeholderStr,ending+1,#placeholderStr)

                        placeholderStr = cut1..cut2

                        if not awaitingKeywords[i] then
                            awaitingKeywords[i] = {{
                                ["startPos"] = (start + addSpace),
                                ["endPos"] = (ending + addSpace),
                            },}
                        else
                            awaitingKeywords[i][#awaitingKeywords[i]+1] = {
                                ["startPos"] = (start + addSpace),
                                ["endPos"] = (ending + addSpace),
                            }
                        end

                        addSpace = addSpace + #i - 1
                    end 
                until not string.find(placeholderStr,i)

                placeholderStr = returnStr

                if awaitingKeywords ~= {} then
                    for key,occurrences in pairs(awaitingKeywords) do
                        local newSpace = 0
                        for _,v in pairs(occurrences) do
                            local toAdd = "{"
                            local keywordConfig = modifications["additional_keywords"][key]
            
                            for cName, cVal in pairs(keywordConfig) do
                                toAdd = toAdd..cName..":"..cVal..","
                            end
        
                            local checkVars = {"s","X","C","V","E"}
                            for a,b in pairs(checkVars) do
                                if modifications[b] and not keywordConfig[b] then
                                    toAdd = toAdd..b..":"..modifications[b]..","
                                end 
                            end
            
                            if toAdd ~= "}" then
                                toAdd = string.sub(toAdd,1,#toAdd - 1)
                            end
                            toAdd = toAdd.."}"
            
                            local cut1 = string.sub(placeholderStr,1,v["startPos"]-1+newSpace)
                            local cut2 = string.sub(placeholderStr,v["endPos"]+1+newSpace,#placeholderStr)
            
                            placeholderStr = cut1..toAdd..key.."{}"..cut2
        
                            newSpace = newSpace + #toAdd + 2 --2 means the "{}" part.
                        end
                    end        
                    returnStr = placeholderStr
                end
        
            end            
        end

        if modifications["s"] or modifications["C"] or modifications["X"] or modifications["V"] or modifications["E"] then --If those variables are set, it will start going through the entire string to modify parts which aren't gains as well.
            additionalSpace = 0
            local placed = false --Whether addon (EX: {s:0.5}) has been placed, and if it was, it will place {} next.
            local halt = false --Stop the code from adding addon.
            local ending = "{}"
            local start = "{"

            function modify(x)
                local returnStr = start

                if modifications[x] then
                    if ((x == "s" or x == "V" or x == "E") and Yggdrasil.trueIfNumber(modifications[x])) or (x ~= "s") then
                        returnStr = returnStr..x..":"..modifications[x]..","
                    end
                end
    
                start = returnStr
            end

            modify("s")
            modify("C")
            modify("X")
            modify("V")
            modify("E")

            start = string.sub(start,1,#start-1)
            start = start.."}"

            local f = 0 
            --[[I'm bad at naming variables, but here's the logic behind this:

            Basically, gains should be: 
                ...{s:0.5,C:mult}+5{}...
            
            ...and what I did is that if it finds the "{" part, then f will be set to 2, and it will only start placing addon if f is 0.
            Why did I do that? You can see that there's 2 "}" within the gain.
            ]]
            local i = 1
            repeat --this is so scuffed ngl
                local character = returnStr:sub(i+additionalSpace,i+additionalSpace)
                local characterBefore = returnStr:sub(i+additionalSpace-1,i+additionalSpace-1)
                local characterAfter = returnStr:sub(i+additionalSpace+1,i+additionalSpace+1)
                if not placed then
                    if (character == "s" or character == "C" or character == "X" or character == "V" or character == "E") and characterAfter == ":" and not halt then --{s:0.7}...{} <-- It will have to go through 2 "}" first before continuing.
                        f = 2 --Hence, this variable.
                        halt = true
                    elseif character ~= "{" and character ~= "}" and characterBefore ~= "{" and characterAfter ~= "}" and not halt then
                        local allowed = true

                        if allowed then
                            placed = true
                            returnStr = string.insert(returnStr,start,i + additionalSpace - 1)
                            additionalSpace = additionalSpace + #start 
                        end
                    elseif character == "}" and halt then
                        if f > 0 then
                            f = f - 1
                        end
                        if f <= 0 then
                            halt = false 
                        end
                    end
                elseif placed then
                    if character == "{" or (i + additionalSpace) == #returnStr then --It will place {} either at the correct position, or at the last character of the string where "{" isn't seen.
                        placed = false
                        if (i + additionalSpace) == #returnStr then
                            returnStr = string.insert(returnStr,ending,i + additionalSpace)                    
                        else
                            returnStr = string.insert(returnStr,ending,i + additionalSpace - 1)
                        end
                        additionalSpace = additionalSpace + #ending
                    end
                end
                i = i + 1
            until (i + additionalSpace) > #returnStr
        end

        return returnStr
    else
        print("Unreadable string [function: automaticColoring]")
        return ""
    end
end

function HelloWorld() --:3 Outdated, obsolete, power crept.
    print("Hello World!")
end

Yggdrasil.debugTool = function(a) --Superior debugging function.
    if a then
        print(":3 i am sigma: "..a)
    else
        print(":3")
    end
end

Yggdrasil.adjacentCards = function(card, area, ignoreMainCard, radius, random) --Useful for grabbing adjacent cards to a card.
    local pos = nil
    local unOrdered = {}
    local existingPos = {}
    local ret = {}
    for i,v in ipairs(area.cards) do
        if v == card then
            pos = i
            break
        end
    end

    if not pos then
        print("The card doesn't exist in the area. [function: adjacentCards]")
        return 
    end

    local increasedRadius = 0
    for i = 1,(radius or 1) do
        increasedRadius = increasedRadius + 1
        if (pos - increasedRadius) >= 1 and area.cards[pos - increasedRadius] ~= card then
            unOrdered[#unOrdered+1] = {
                ["pos"] = (pos - increasedRadius),
                ["card"] = area.cards[(pos - increasedRadius)]
            }
            existingPos[#existingPos+1] = (pos - increasedRadius)
        end

        if (pos + increasedRadius) <= #area.cards and area.cards[pos + increasedRadius] ~= card then
            unOrdered[#unOrdered+1] = {
                ["pos"] = (pos + increasedRadius),
                ["card"] = area.cards[(pos + increasedRadius)]
            }
            existingPos[#existingPos+1] = (pos + increasedRadius)
        end
    end
    
    if not ignoreMainCard then
        unOrdered[#unOrdered + 1] = {
            ["pos"] = pos,
            ["card"] = card
        }
        existingPos[#existingPos+1] = pos
    end

    table.sort(existingPos) 

    if not random then
        for _,v in ipairs(existingPos) do
            for _,b in pairs(unOrdered) do
                if b["pos"] == v then
                    ret[#ret+1] = b["card"]
                end
            end
        end

    else
        ret = unOrdered
    end

    return ret
end

Yggdrasil.turnIDToText = function(a) --Convert ID to Rank for visualization purposes.
    if a <= 10 then
        return a
    else
        if a == 11 then
            return "Jack"
        elseif a == 12 then
            return "Queen"
        elseif a == 13 then
            return "King"
        elseif a == 14 then
            return "Ace"
        end
    end
end

Yggdrasil.findLocation = function(card,area) --Find the location of a card within its area.
    local pos = nil
    for i,v in ipairs(area.cards) do
        if card == v then
            pos = i
        end
    end

    if not pos then print("Card wasn't found in the given area. [function: findLocation]") return end
    return pos
end

Yggdrasil.getCardChips = function(card) --Get the amount of chips given by a playing card, including Enhancements and Editions. (I don't think modded enhancements and stuff will work with this.)
    local ret = card:get_chip_bonus()

    if card:get_edition() and card.edition.key == "e_foil" then
        ret = ret + G.P_CENTERS.e_foil.config.extra
    end

    return ret or 0
end

Yggdrasil.vanillaSuitCheck = function(area) --Return (x,y,z,w) if area has respectively (Hearts, Clubs, Spades, Diamonds)
    local heart,club,spade,diamond = false,false,false,false
    for _,c in ipairs(area) do
        if c.base and c.base.suit then
            if c.base.suit == "Hearts" then
               heart = true
            elseif c.base.suit == "Clubs" then
               club = true
            elseif c.base.suit == "Spades" then
               spade = true
            elseif c.base.suit == "Diamonds" then
               diamond = true
            end
         end
    end

    return heart,club,spade,diamond
end

Yggdrasil.numUniqueSuits = function(area,base) --Check how many unique suits there are in an area.
    local registeredSuits = {}

    if base then
        for _,c in ipairs(area) do
            if c.base and c.base.suit then
                local registered = false
                for _,rS in pairs(registeredSuits) do
                    if rS == c.base.suit then registered = true break end
                end
                if not registered then
                    table.insert(registeredSuits,c.base.suit)
                end
            end
        end
    else
        for _,c in ipairs(area) do
            if c.base and c.base.suit then
                local registered = false
                for _,rS in pairs(registeredSuits) do
                    if c:is_suit(rS) then registered = true break end
                end
                if not registered then
                    table.insert(registeredSuits,c.base.suit)
                end
            end
        end 
    end

    return #registeredSuits
end

Yggdrasil.numUniqueRanks = function(area) --Check how many unique ranks are there in an area.
    local registeredRanks = {}

    for _,c in ipairs(area) do
        if c.base and c.base.id then
            local registered = false
            for _,rR in pairs(registeredRanks) do
                if c.base.id == rR then registered = true break end
            end
            if not registered then
                table.insert(registeredRanks,c.base.id)
            end
        end
    end 

    return #registeredRanks
end

Yggdrasil.set_rank = function(card,new_rank) --Adapted from Tecci's function. Changes the rank of a playing card.
    local suit_prefix = string.sub(card.base.suit, 1, 1)..'_'
    local rank_suffix = new_rank

    if rank_suffix == 10 then rank_suffix = 'T'
    elseif rank_suffix == 11 then rank_suffix = 'J'
    elseif rank_suffix == 12 then rank_suffix = 'Q'
    elseif rank_suffix == 13 then rank_suffix = 'K'
    elseif rank_suffix == 14 then rank_suffix = 'A'
    end

    card:set_base(G.P_CARDS[suit_prefix..rank_suffix])
end

Yggdrasil.increase_rank = function(card,rank_increase,disable_loop_back) --Increases the rank of a playing card. Loops back if it overincreases as a failsafe, if disable_loop_back is not specified.
    local new_rank = card.base.id + rank_increase
    if not disable_loop_back then
        if new_rank > 14 then
            repeat
                new_rank = new_rank - 13 --You want the rank to be at 2, not 1.
            until new_rank <= 14
        end
    else
        if new_rank > 14 then new_rank = 14 end
    end

    Yggdrasil.set_rank(card,new_rank)
end

Yggdrasil.decrease_rank = function(card,rank_increase,disable_loop_back) --Decreases the rank of a playing card. Loops back if it overincreases as a failsafe, if disable_loop_back is not specified.
    local new_rank = card.base.id - rank_increase
    if not disable_loop_back then
        if new_rank < 2 then
            repeat
                new_rank = new_rank + 13 --You want the rank to be at 2, not 1.
            until new_rank >= 2
        end
    else
        if new_rank < 2 then new_rank = 2 end
    end

    Yggdrasil.set_rank(card,new_rank)
end

Yggdrasil.convert_to_hex = function(color) -- Converts RGB colors to HEX.
	local hex = {}

	for rgb in color:gmatch('%d+') do
		table.insert(hex, ('%02X'):format(tonumber(rgb)))
	end

	return table.concat(hex)
end

Yggdrasil.most_played_hand = function(random_pick)
    local tempplayed = 0
    local hand_list = {}
    for k, v in pairs(G.GAME.hands) do
        if v.played >= tempplayed and v.visible then
            if v.played > tempplayed then
                tempplayed = v.played
                hand_list = {}
            end
            hand_list[#hand_list+1] = {["name"] = k, ["config"] = v}
        end
    end

    if random_pick then
        return pseudorandom_element(hand_list,pseudoseed("hsr_most_played_hand_pick"))
    else
        return hand_list
    end
end

Yggdrasil.most_played_hand_planet_key = function(random_pick)
    local keys = Yggdrasil.most_played_hand(random_pick)
    if random_pick then
        for i,v in pairs(G.P_CENTER_POOLS.Planet) do
            if v.config and v.config.hand_type and v.config.hand_type == keys["name"] then
                return v.key
            end
        end
        print("No planet cards were found for this hand.")
        return false
    end

    local ret = {}
    for _,v in pairs(keys) do
        for i2,v2 in pairs(G.P_CENTER_POOLS.Planet) do
            if v2.config and v2.config.hand_type and v2.config.hand_type == v["name"] then
                ret[#ret+1] = v2.key
            end
        end
    end
    return ret
end

Yggdrasil.remove_space = function(str)
    return string.gsub(str, "%s+", "")
end

Yggdrasil.remove_underline = function(str)
    return string.gsub(str, "_", "")
end

Yggdrasil.get_table_length = function(tab)
    local num = 0
    for _,_ in pairs(tab) do
        num = num + 1
    end

    return num
end

--THIS IS BIG, THANK YOU SLEEPYG11 WTF
function Yggdrasil.cleanup_dead_elements(ref_table, ref_key)
    local new_values = {}
    local target = ref_table[ref_key]
    if not target then
        return
    end
    for k, v in pairs(target) do
        if not v.REMOVED and not v.removed then
            new_values[#new_values + 1] = v
        end
    end
    ref_table[ref_key] = new_values
    return new_values
end

Yggdrasil.isEven = function(number) --(this is clearly a joke, please dont even use this thanks)
    if number == 1 then return false end
    if number == 2 then return true end
    if number == 3 then return false end
    if number == 4 then return true end
    if number == 5 then return false end
    if number == 6 then return true end
    if number == 7 then return false end
    if number == 8 then return true end
    if number == 9 then return false end
    if number == 10 then return true end
    if number == 11 then return false end
    if number == 12 then return true end
    if number == 13 then return false end
    if number == 14 then return true end
    if number == 15 then return false end
    if number == 16 then return true end
    if number == 17 then return false end
    if number == 18 then return true end
    if number == 19 then return false end
    if number == 20 then return true end
    if number == 21 then return false end
    if number == 22 then return true end
    if number == 23 then return false end
    if number == 24 then return true end
    if number == 25 then return false end
    if number == 26 then return true end
    if number == 27 then return false end
    if number == 28 then return true end
    if number == 29 then return false end
    if number == 30 then return true end
    if number == 31 then return false end
    if number == 32 then return true end
    if number == 33 then return false end
    if number == 34 then return true end
    if number == 35 then return false end
    if number == 36 then return true end
    if number == 37 then return false end
    if number == 38 then return true end
    if number == 39 then return false end
    if number == 40 then return true end
    if number == 41 then return false end
    if number == 42 then return true end
    if number == 43 then return false end
    if number == 44 then return true end
    if number == 45 then return false end
    if number == 46 then return true end
    if number == 47 then return false end
    if number == 48 then return true end
    if number == 49 then return false end
    if number == 50 then return true end
    if number == 51 then return false end
    if number == 52 then return true end
    if number == 53 then return false end
    if number == 54 then return true end
    if number == 55 then return false end
    if number == 56 then return true end
    if number == 57 then return false end
    if number == 58 then return true end
    if number == 59 then return false end
    if number == 60 then return true end
    if number == 61 then return false end
    if number == 62 then return true end
    if number == 63 then return false end
    if number == 64 then return true end
    if number == 65 then return false end
    if number == 66 then return true end
    if number == 67 then return false end
    if number == 68 then return true end
    if number == 69 then return false end
    if number == 70 then return true end
    if number == 71 then return false end
    if number == 72 then return true end
    if number == 73 then return false end
    if number == 74 then return true end
    if number == 75 then return false end
    if number == 76 then return true end
    if number == 77 then return false end
    if number == 78 then return true end
    if number == 79 then return false end
    if number == 80 then return true end
    if number == 81 then return false end
    if number == 82 then return true end
    if number == 83 then return false end
    if number == 84 then return true end
    if number == 85 then return false end
    if number == 86 then return true end
    if number == 87 then return false end
    if number == 88 then return true end
    if number == 89 then return false end
    if number == 90 then return true end
    if number == 91 then return false end
    if number == 92 then return true end
    if number == 93 then return false end
    if number == 94 then return true end
    if number == 95 then return false end
    if number == 96 then return true end
    if number == 97 then return false end
    if number == 98 then return true end
    if number == 99 then return false end
    if number == 100 then return true end
    if number == 101 then return false end
    if number == 102 then return true end
    if number == 103 then return false end
    if number == 104 then return true end
    if number == 105 then return false end
    if number == 106 then return true end
    if number == 107 then return false end
    if number == 108 then return true end
    if number == 109 then return false end
    if number == 110 then return true end
    if number == 111 then return false end
    if number == 112 then return true end
    if number == 113 then return false end
    if number == 114 then return true end
    if number == 115 then return false end
    if number == 116 then return true end
    if number == 117 then return false end
    if number == 118 then return true end
    if number == 119 then return false end
    if number == 120 then return true end
    if number == 121 then return false end
    if number == 122 then return true end
    if number == 123 then return false end
    if number == 124 then return true end
    if number == 125 then return false end
    if number == 126 then return true end
    if number == 127 then return false end
    if number == 128 then return true end
    if number == 129 then return false end
    if number == 130 then return true end
    if number == 131 then return false end
    if number == 132 then return true end
    if number == 133 then return false end
    if number == 134 then return true end
    if number == 135 then return false end
    if number == 136 then return true end
    if number == 137 then return false end
    if number == 138 then return true end
    if number == 139 then return false end
    if number == 140 then return true end
    if number == 141 then return false end
    if number == 142 then return true end
    if number == 143 then return false end
    if number == 144 then return true end
    if number == 145 then return false end
    if number == 146 then return true end
    if number == 147 then return false end
    if number == 148 then return true end
    if number == 149 then return false end
    if number == 150 then return true end
    if number == 151 then return false end
    if number == 152 then return true end
    if number == 153 then return false end
    if number == 154 then return true end
    if number == 155 then return false end
    if number == 156 then return true end
    if number == 157 then return false end
    if number == 158 then return true end
    if number == 159 then return false end
    if number == 160 then return true end
    if number == 161 then return false end
    if number == 162 then return true end
    if number == 163 then return false end
    if number == 164 then return true end
    if number == 165 then return false end
    if number == 166 then return true end
    if number == 167 then return false end
    if number == 168 then return true end
    if number == 169 then return false end
    if number == 170 then return true end
    if number == 171 then return false end
    if number == 172 then return true end
    if number == 173 then return false end
    if number == 174 then return true end
    if number == 175 then return false end
    if number == 176 then return true end
    if number == 177 then return false end
    if number == 178 then return true end
    if number == 179 then return false end
    if number == 180 then return true end
    if number == 181 then return false end
    if number == 182 then return true end
    if number == 183 then return false end
    if number == 184 then return true end
    if number == 185 then return false end
    if number == 186 then return true end
    if number == 187 then return false end
    if number == 188 then return true end
    if number == 189 then return false end
    if number == 190 then return true end
    if number == 191 then return false end
    if number == 192 then return true end
    if number == 193 then return false end
    if number == 194 then return true end
    if number == 195 then return false end
    if number == 196 then return true end
    if number == 197 then return false end
    if number == 198 then return true end
    if number == 199 then return false end
    if number == 200 then return true end
    if number == 201 then return false end
    if number == 202 then return true end
    if number == 203 then return false end
    if number == 204 then return true end
    if number == 205 then return false end
    if number == 206 then return true end
    if number == 207 then return false end
    if number == 208 then return true end
    if number == 209 then return false end
    if number == 210 then return true end
    if number == 211 then return false end
    if number == 212 then return true end
    if number == 213 then return false end
    if number == 214 then return true end
    if number == 215 then return false end
    if number == 216 then return true end
    if number == 217 then return false end
    if number == 218 then return true end
    if number == 219 then return false end
    if number == 220 then return true end
    if number == 221 then return false end
    if number == 222 then return true end
    if number == 223 then return false end
    if number == 224 then return true end
    if number == 225 then return false end
    if number == 226 then return true end
    if number == 227 then return false end
    if number == 228 then return true end
    if number == 229 then return false end
    if number == 230 then return true end
    if number == 231 then return false end
    if number == 232 then return true end
    if number == 233 then return false end
    if number == 234 then return true end
    if number == 235 then return false end
    if number == 236 then return true end
    if number == 237 then return false end
    if number == 238 then return true end
    if number == 239 then return false end
    if number == 240 then return true end
    if number == 241 then return false end
    if number == 242 then return true end
    if number == 243 then return false end
    if number == 244 then return true end
    if number == 245 then return false end
    if number == 246 then return true end
    if number == 247 then return false end
    if number == 248 then return true end
    if number == 249 then return false end
    if number == 250 then return true end
    if number == 251 then return false end
    if number == 252 then return true end
    if number == 253 then return false end
    if number == 254 then return true end
    if number == 255 then return false end
    if number == 256 then return true end
    if number == 257 then return false end
    if number == 258 then return true end
    if number == 259 then return false end
    if number == 260 then return true end
    if number == 261 then return false end
    if number == 262 then return true end
    if number == 263 then return false end
    if number == 264 then return true end
    if number == 265 then return false end
    if number == 266 then return true end
    if number == 267 then return false end
    if number == 268 then return true end
    if number == 269 then return false end
    if number == 270 then return true end
    if number == 271 then return false end
    if number == 272 then return true end
    if number == 273 then return false end
    if number == 274 then return true end
    if number == 275 then return false end
    if number == 276 then return true end
    if number == 277 then return false end
    if number == 278 then return true end
    if number == 279 then return false end
    if number == 280 then return true end
    if number == 281 then return false end
    if number == 282 then return true end
    if number == 283 then return false end
    if number == 284 then return true end
    if number == 285 then return false end
    if number == 286 then return true end
    if number == 287 then return false end
    if number == 288 then return true end
    if number == 289 then return false end
    if number == 290 then return true end
    if number == 291 then return false end
    if number == 292 then return true end
    if number == 293 then return false end
    if number == 294 then return true end
    if number == 295 then return false end
    if number == 296 then return true end
    if number == 297 then return false end
    if number == 298 then return true end
    if number == 299 then return false end
    if number == 300 then return true end
    if number == 301 then return false == false end
    if number == 302 then return true == true end
    if number == 303 then return false == true end
    if number == 304 then return true == true end
    if number == 305 then return false == false end
    if number == 306 then return true == (not false) end
    if number == 307 then return false == true end
    if number == 308 then return not false end
    if number == 309 then return not true end
    if number == 310 then return true end
    if number == 311 then return false end
    if number == 312 then return true end
    if number == 313 then return false end
    if number == 314 then return true end
    if number == 315 then return false end
    if number == 316 then return true end
    if number == 317 then return false end
    if number == 318 then return true end
    if number == 319 then return false end
    if number == 320 then return true end
    if number == 321 then return false end
    if number == 322 then return true end
    if number == 323 then return false end
    if number == 324 then return true end
    if number == 325 then return false end
    if number == 326 then return true end
    if number == 327 then return false end
    if number == 328 then return true end
    if number == 329 then return false end
    if number == 330 then return true end
    if number == 331 then return false end
    if number == 332 then return true end
    if number == 333 then return false end
    if number == 334 then return true end
    if number == 335 then return false end
    if number == 336 then return true end
    if number == 337 then return false end
    if number == 338 then return true end
    if number == 339 then return false end
    if number == 340 then return true end
    if number == 341 then return false end
    if number == 342 then return true end
    if number == 343 then return false end
    if number == 344 then return true end
    if number == 345 then return false end
    if number == 346 then return true end
    if number == 347 then return false end
    if number == 348 then return true end
    if number == 349 then return false end
    if number == 350 then return true end
    if number == 351 then return false end
    if number == 352 then return true end
    if number == 353 then return false end
    if number == 354 then return true end
    if number == 355 then return false end
    if number == 356 then return true end
    if number == 357 then return false end
    if number == 358 then return true end
    if number == 359 then return false end
    if number == 360 then return true end
    if number == 361 then return false end
    if number == 362 then return true end
    if number == 363 then return false end
    if number == 364 then return true end
    if number == 365 then return false end
    if number == 366 then return true end
    if number == 367 then return false end
    if number == 368 then return true end
    if number == 369 then return false end
    if number == 370 then return true end
    if number == 371 then return false end
    if number == 372 then return true end
    if number == 373 then return false end
    if number == 374 then return true end
    if number == 375 then return false end
    if number == 376 then return true end
    if number == 377 then return false end
    if number == 378 then return true end
    if number == 379 then return false end
    if number == 380 then return true end
    if number == 381 then return false end
    if number == 382 then return true end
    if number == 383 then return false end
    if number == 384 then return true end
    if number == 385 then return false end
    if number == 386 then return true end
    if number == 387 then return false end
    if number == 388 then return true end
    if number == 389 then return false end
    if number == 390 then return true end
    if number == 391 then return false end
    if number == 392 then return true end
    if number == 393 then return false end
    if number == 394 then return true end
    if number == 395 then return false end
    if number == 396 then return true end
    if number == 397 then return false end
    if number == 398 then return true end
    if number == 399 then return false end
    if number == 400 then return true end

    return Yggdrasil.isEven(number - 2)
end

Yggdrasil.isisEven = function(func) --Check if the function checks for even numbers.
    local check1 = nil --check1, if true and check2 is true and check3 is true and check4 is true then the function checks for even numbers.
    local check2 = nil --check2, if true and check1 is true and check3 is true and check4 is true then the function checks for even numbers.
    local check3 = nil --check3, if true and check2 is true and check1 is true and check4 is true then the function checks for even numbers.
    local check4 = nil --check4, if true and check2 is true and check3 is true and check1 is true then the function checks for even numbers.
    if type(func) == "function" then
        check1 = true --Setting check1 to true when func is indeed a function.
        local test1 = 1 --First test with a number that isn't even.
        local test2 = 2 --Second test with a number that is even.
        local num1 = math.random(0,100000000000000000)
        local num2 = math.random(0,100000000000000000)
        local test3 --func might try to be a function that checks for even numbers even when it's not, this is to prevent it by having a random number.
        local test3isEven = nil
        if num1 > num2 then
            test3 = math.random(num2,num1)
        elseif num2 > num1 then
            test3 = math.random(num1,num2)
        end

        local function isEven(number) --My own function that checks for even numbers.
            if number == 1 then return false end
            if number == 2 then return true end
            if number == 3 then return false end
            if number == 4 then return true end
            if number == 5 then return false end
            if number == 6 then return true end
            if number == 7 then return false end
            if number == 8 then return true end
            if number == 9 then return false end
            if number == 10 then return true end
            if number == 11 then return false end
            if number == 12 then return true end
            if number == 13 then return false end
            if number == 14 then return true end
            if number == 15 then return false end
            if number == 16 then return true end
            if number == 17 then return false end
            if number == 18 then return true end
            if number == 19 then return false end
            if number == 20 then return true end
            if number == 21 then return false end
            if number == 22 then return true end
            if number == 23 then return false end
            if number == 24 then return true end
            if number == 25 then return false end
            if number == 26 then return true end
            if number == 27 then return false end
            if number == 28 then return true end
            if number == 29 then return false end
            if number == 30 then return true end
            if number == 31 then return false end
            if number == 32 then return true end
            if number == 33 then return false end
            if number == 34 then return true end
            if number == 35 then return false end
            if number == 36 then return true end
            if number == 37 then return false end
            if number == 38 then return true end
            if number == 39 then return false end
            if number == 40 then return true end
            if number == 41 then return false end
            if number == 42 then return true end
            if number == 43 then return false end
            if number == 44 then return true end
            if number == 45 then return false end
            if number == 46 then return true end
            if number == 47 then return false end
            if number == 48 then return true end
            if number == 49 then return false end
            if number == 50 then return true end
            if number == 51 then return false end
            if number == 52 then return true end
            if number == 53 then return false end
            if number == 54 then return true end
            if number == 55 then return false end
            if number == 56 then return true end
            if number == 57 then return false end
            if number == 58 then return true end
            if number == 59 then return false end
            if number == 60 then return true end
            if number == 61 then return false end
            if number == 62 then return true end
            if number == 63 then return false end
            if number == 64 then return true end
            if number == 65 then return false end
            if number == 66 then return true end
            if number == 67 then return false end
            if number == 68 then return true end
            if number == 69 then return false end
            if number == 70 then return true end
            if number == 71 then return false end
            if number == 72 then return true end
            if number == 73 then return false end
            if number == 74 then return true end
            if number == 75 then return false end
            if number == 76 then return true end
            if number == 77 then return false end
            if number == 78 then return true end
            if number == 79 then return false end
            if number == 80 then return true end
            if number == 81 then return false end
            if number == 82 then return true end
            if number == 83 then return false end
            if number == 84 then return true end
            if number == 85 then return false end
            if number == 86 then return true end
            if number == 87 then return false end
            if number == 88 then return true end
            if number == 89 then return false end
            if number == 90 then return true end
            if number == 91 then return false end
            if number == 92 then return true end
            if number == 93 then return false end
            if number == 94 then return true end
            if number == 95 then return false end
            if number == 96 then return true end
            if number == 97 then return false end
            if number == 98 then return true end
            if number == 99 then return false end
            if number == 100 then return true end
            if number == 101 then return false end
            if number == 102 then return true end
            if number == 103 then return false end
            if number == 104 then return true end
            if number == 105 then return false end
            if number == 106 then return true end
            if number == 107 then return false end
            if number == 108 then return true end
            if number == 109 then return false end
            if number == 110 then return true end
            if number == 111 then return false end
            if number == 112 then return true end
            if number == 113 then return false end
            if number == 114 then return true end
            if number == 115 then return false end
            if number == 116 then return true end
            if number == 117 then return false end
            if number == 118 then return true end
            if number == 119 then return false end
            if number == 120 then return true end
            if number == 121 then return false end
            if number == 122 then return true end
            if number == 123 then return false end
            if number == 124 then return true end
            if number == 125 then return false end
            if number == 126 then return true end
            if number == 127 then return false end
            if number == 128 then return true end
            if number == 129 then return false end
            if number == 130 then return true end
            if number == 131 then return false end
            if number == 132 then return true end
            if number == 133 then return false end
            if number == 134 then return true end
            if number == 135 then return false end
            if number == 136 then return true end
            if number == 137 then return false end
            if number == 138 then return true end
            if number == 139 then return false end
            if number == 140 then return true end
            if number == 141 then return false end
            if number == 142 then return true end
            if number == 143 then return false end
            if number == 144 then return true end
            if number == 145 then return false end
            if number == 146 then return true end
            if number == 147 then return false end
            if number == 148 then return true end
            if number == 149 then return false end
            if number == 150 then return true end
            if number == 151 then return false end
            if number == 152 then return true end
            if number == 153 then return false end
            if number == 154 then return true end
            if number == 155 then return false end
            if number == 156 then return true end
            if number == 157 then return false end
            if number == 158 then return true end
            if number == 159 then return false end
            if number == 160 then return true end
            if number == 161 then return false end
            if number == 162 then return true end
            if number == 163 then return false end
            if number == 164 then return true end
            if number == 165 then return false end
            if number == 166 then return true end
            if number == 167 then return false end
            if number == 168 then return true end
            if number == 169 then return false end
            if number == 170 then return true end
            if number == 171 then return false end
            if number == 172 then return true end
            if number == 173 then return false end
            if number == 174 then return true end
            if number == 175 then return false end
            if number == 176 then return true end
            if number == 177 then return false end
            if number == 178 then return true end
            if number == 179 then return false end
            if number == 180 then return true end
            if number == 181 then return false end
            if number == 182 then return true end
            if number == 183 then return false end
            if number == 184 then return true end
            if number == 185 then return false end
            if number == 186 then return true end
            if number == 187 then return false end
            if number == 188 then return true end
            if number == 189 then return false end
            if number == 190 then return true end
            if number == 191 then return false end
            if number == 192 then return true end
            if number == 193 then return false end
            if number == 194 then return true end
            if number == 195 then return false end
            if number == 196 then return true end
            if number == 197 then return false end
            if number == 198 then return true end
            if number == 199 then return false end
            if number == 200 then return true end
            if number == 201 then return false end
            if number == 202 then return true end
            if number == 203 then return false end
            if number == 204 then return true end
            if number == 205 then return false end
            if number == 206 then return true end
            if number == 207 then return false end
            if number == 208 then return true end
            if number == 209 then return false end
            if number == 210 then return true end
            if number == 211 then return false end
            if number == 212 then return true end
            if number == 213 then return false end
            if number == 214 then return true end
            if number == 215 then return false end
            if number == 216 then return true end
            if number == 217 then return false end
            if number == 218 then return true end
            if number == 219 then return false end
            if number == 220 then return true end
            if number == 221 then return false end
            if number == 222 then return true end
            if number == 223 then return false end
            if number == 224 then return true end
            if number == 225 then return false end
            if number == 226 then return true end
            if number == 227 then return false end
            if number == 228 then return true end
            if number == 229 then return false end
            if number == 230 then return true end
            if number == 231 then return false end
            if number == 232 then return true end
            if number == 233 then return false end
            if number == 234 then return true end
            if number == 235 then return false end
            if number == 236 then return true end
            if number == 237 then return false end
            if number == 238 then return true end
            if number == 239 then return false end
            if number == 240 then return true end
            if number == 241 then return false end
            if number == 242 then return true end
            if number == 243 then return false end
            if number == 244 then return true end
            if number == 245 then return false end
            if number == 246 then return true end
            if number == 247 then return false end
            if number == 248 then return true end
            if number == 249 then return false end
            if number == 250 then return true end
            if number == 251 then return false end
            if number == 252 then return true end
            if number == 253 then return false end
            if number == 254 then return true end
            if number == 255 then return false end
            if number == 256 then return true end
            if number == 257 then return false end
            if number == 258 then return true end
            if number == 259 then return false end
            if number == 260 then return true end
            if number == 261 then return false end
            if number == 262 then return true end
            if number == 263 then return false end
            if number == 264 then return true end
            if number == 265 then return false end
            if number == 266 then return true end
            if number == 267 then return false end
            if number == 268 then return true end
            if number == 269 then return false end
            if number == 270 then return true end
            if number == 271 then return false end
            if number == 272 then return true end
            if number == 273 then return false end
            if number == 274 then return true end
            if number == 275 then return false end
            if number == 276 then return true end
            if number == 277 then return false end
            if number == 278 then return true end
            if number == 279 then return false end
            if number == 280 then return true end
            if number == 281 then return false end
            if number == 282 then return true end
            if number == 283 then return false end
            if number == 284 then return true end
            if number == 285 then return false end
            if number == 286 then return true end
            if number == 287 then return false end
            if number == 288 then return true end
            if number == 289 then return false end
            if number == 290 then return true end
            if number == 291 then return false end
            if number == 292 then return true end
            if number == 293 then return false end
            if number == 294 then return true end
            if number == 295 then return false end
            if number == 296 then return true end
            if number == 297 then return false end
            if number == 298 then return true end
            if number == 299 then return false end
            if number == 300 then return true end
            if number == 301 then return false == false end
            if number == 302 then return true == true end
            if number == 303 then return false == true end
            if number == 304 then return true == true end
            if number == 305 then return false == false end
            if number == 306 then return true == (not false) end
            if number == 307 then return false == true end
            if number == 308 then return not false end
            if number == 309 then return not true end
            if number == 310 then return true end
            if number == 311 then return false end
            if number == 312 then return true end
            if number == 313 then return false end
            if number == 314 then return true end
            if number == 315 then return false end
            if number == 316 then return true end
            if number == 317 then return false end
            if number == 318 then return true end
            if number == 319 then return false end
            if number == 320 then return true end
            if number == 321 then return false end
            if number == 322 then return true end
            if number == 323 then return false end
            if number == 324 then return true end
            if number == 325 then return false end
            if number == 326 then return true end
            if number == 327 then return false end
            if number == 328 then return true end
            if number == 329 then return false end
            if number == 330 then return true end
            if number == 331 then return false end
            if number == 332 then return true end
            if number == 333 then return false end
            if number == 334 then return true end
            if number == 335 then return false end
            if number == 336 then return true end
            if number == 337 then return false end
            if number == 338 then return true end
            if number == 339 then return false end
            if number == 340 then return true end
            if number == 341 then return false end
            if number == 342 then return true end
            if number == 343 then return false end
            if number == 344 then return true end
            if number == 345 then return false end
            if number == 346 then return true end
            if number == 347 then return false end
            if number == 348 then return true end
            if number == 349 then return false end
            if number == 350 then return true end
            if number == 351 then return false end
            if number == 352 then return true end
            if number == 353 then return false end
            if number == 354 then return true end
            if number == 355 then return false end
            if number == 356 then return true end
            if number == 357 then return false end
            if number == 358 then return true end
            if number == 359 then return false end
            if number == 360 then return true end
            if number == 361 then return false end
            if number == 362 then return true end
            if number == 363 then return false end
            if number == 364 then return true end
            if number == 365 then return false end
            if number == 366 then return true end
            if number == 367 then return false end
            if number == 368 then return true end
            if number == 369 then return false end
            if number == 370 then return true end
            if number == 371 then return false end
            if number == 372 then return true end
            if number == 373 then return false end
            if number == 374 then return true end
            if number == 375 then return false end
            if number == 376 then return true end
            if number == 377 then return false end
            if number == 378 then return true end
            if number == 379 then return false end
            if number == 380 then return true end
            if number == 381 then return false end
            if number == 382 then return true end
            if number == 383 then return false end
            if number == 384 then return true end
            if number == 385 then return false end
            if number == 386 then return true end
            if number == 387 then return false end
            if number == 388 then return true end
            if number == 389 then return false end
            if number == 390 then return true end
            if number == 391 then return false end
            if number == 392 then return true end
            if number == 393 then return false end
            if number == 394 then return true end
            if number == 395 then return false end
            if number == 396 then return true end
            if number == 397 then return false end
            if number == 398 then return true end
            if number == 399 then return false end
            if number == 400 then return true end

            return isEven(number - 2)
        end

        if isEven(test3) then
            test3isEven = true
        else
            test3isEven = false
        end

        if func(test1) == false then
            check2 = true
        else
            check2 = false
        end

        if func(test2) == true then
            check3 = true
        else
            check3 = false
        end

        if func(test3) == test3isEven then
            check4 = true
        else
            check4 = false
        end
    else
        check1 = nil
    end

    if check1 and check2 and check3 and check4 then
        return true
    else
        return false
    end
end