# APEX

开源工具：https://github.com/JiaqinKang/apexNoRecoilMarco

## 压枪宏

罗技，2022-09

使用前进侧键开启或关闭抖动，用后退侧键开启或关闭下压。不行就用管理员模式打开GHUB。

按住开镜版

```lua
EnablePrimaryMouseButtonEvents(true)
turn=0
down=0
function OnEvent(event, arg)
	local offset
	local recovery_offset
	local downcount
	local qwq = IsMouseButtonPressed(3)
    OutputLogMessage("Event: "..event.." Arg: "..arg.."\n")
	if(event== "MOUSE_BUTTON_PRESSED" and arg==1 and turn==1 and qwq==true) then
		downcount=0
		repeat
--			OutputLogMessage("%d\n",downcount)
			downcount=downcount+1
			if(downcount<=150 and down==1) then
				MoveMouseRelative(0,1)
			end
--[[
offset对应抖动的幅度，可以根据自己的灵敏度调整，太小的话没有减少后坐力的效果
--]]
			offset=math.random(8,8)
			recovery_offset = -offset
			Sleep(2)
			MoveMouseRelative(offset,offset)
			Sleep(2)
			MoveMouseRelative(recovery_offset,recovery_offset)
		until not IsMouseButtonPressed(1)
	end
--[[
arg的数字表示鼠标的按键4表示侧键的后退键，5表示前进键，可以设置自己喜欢的按键避免误触
turn变量对应鼠标的抖动开关
down变量对应鼠标的下压开关
--]]
	if(event== "MOUSE_BUTTON_PRESSED" and arg==4) then 
		if(turn==0)	then
			turn=1
		else
			turn=0	
		end
	end
	if(event== "MOUSE_BUTTON_PRESSED" and arg==99) then
		if(down==0)	then
			down=1
		else
			down=0	
		end
	end
end
```

切换开镜版

```lua
EnablePrimaryMouseButtonEvents(true)
turn=0
down=0
function OnEvent(event, arg)
	local offset
	local recovery_offset
	local downcount
    OutputLogMessage("Event: "..event.." Arg: "..arg.."\n")
	if(event== "MOUSE_BUTTON_PRESSED" and arg==1 and turn==1) then
		downcount=0
		repeat
--			OutputLogMessage("%d\n",downcount)
			downcount=downcount+1
			if(downcount<=150 and down==1) then
				MoveMouseRelative(0,1)
			end
--[[
offset对应抖动的幅度，可以根据自己的灵敏度调整，太小的话没有减少后坐力的效果
--]]
			offset=math.random(7,10)
			recovery_offset = -offset
			Sleep(2)
			MoveMouseRelative(offset,offset)
			Sleep(2)
			MoveMouseRelative(recovery_offset,recovery_offset)
		until not IsMouseButtonPressed(1)
	end
--[[
arg的数字表示鼠标的按键4表示侧键的后退键，5表示前进键，可以设置自己喜欢的按键避免误触
turn变量对应鼠标的抖动开关
down变量对应鼠标的下压开关
--]]
	if(event== "MOUSE_BUTTON_PRESSED" and arg==5) then 
		if(turn==0)	then
			turn=1
		else
			turn=0	
		end
	end
	if(event== "MOUSE_BUTTON_PRESSED" and arg==4) then
		if(down==0)	then
			down=1
		else
			down=0	
		end
	end
end
```
