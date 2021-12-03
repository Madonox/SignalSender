# SignalSender

SignalSender is a Roblox signal library.  This library allows you to create "signals", which are custom events that can be utilized to create all kinds of things!
In order to get started, see the documentation below!
**NOTICE:** This library is in it's alpha release, expect missing functionality / bugs.  I will be expanding it shortly.

## Getting Started

In order to begin using SignalSender, you must firstly install the library.  In order to do so, simply clone the roblox model found here: https://www.roblox.com/library/8165716598/SignalSender
Once you have inserted it into your game, simply place it into ReplicatedStorage and you're done!

## The Basics

Now that you've installed the module, it's time to begin using it!  In order to begin using it, you must `require` it first.  In order to do that, simply copy the code below!
```lua
local SignalSender = require(game.ReplicatedStorage.SignalSender.SignalSender)
```
Once you've done that, you can now create signals!
In order to create a basic signal, you can do the following:
```lua
local basicSignal = SignalSender.new({"method1","method2","method3"}) -- The table contains all methods the signal will have.
-- please note: the signal list can not currently be edited!
```

## Interactions

Now that you've setup a signal, you can now begin interacting with it!  In order to add a connection, you would simply do what you would do for a normal instance.
```lua
basicSignal.method1:Connect(function(argument1,argument2)
  print(argument1)
  print(argument2)
end)
```
Now, in order to trigger that function, you'd simply do the following:
```lua
basicSignal:Fire("method1","this is an argument","this is another argument")
```

While this is all there is to the library now, I do plan to expand it very soon!
