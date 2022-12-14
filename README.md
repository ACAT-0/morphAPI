# morphAPI
a extremely lightweight The Binding Of Isaac: Repentance mod/api that allows you to add custom transformations!

## adding transformations to ur mod!

adding a transformation to your mod is easy with morphAPI!
just use the MorphAPI:AddTransformation() function...

### AddTransformation(String name, Table items, Number id, Integer minimum, NullItemID)
name: the name of the transformation. 

items: a table of the various CollectibleType items that your transformation uses.

id: a little identifier for the transformation; relic from early prototyping of the api that i still need to remove, set this to nil

minimum: the minimum amount of items from the items list needed in order to gain the transformation.

NullItemID: the nullitemid object used for the transformation costume! you can set a nullcostume by doing `NullItemID.ID_YOUR_COOL_COSTUME = Isaac.GetCostumeIdByPath("gfx/my costume here.anm2")`

alternatively, you can define this like so, forgoing the extra arguments:
```
 techsav = MorphAPI:AddTransformation("Programmer")
 techsav.Items = {
            CollectibleType.COLLECTIBLE_TECHNOLOGY,
            CollectibleType.COLLECTIBLE_120_VOLT,
            CollectibleType.COLLECTIBLE_BATTERY,
            CollectibleType.COLLECTIBLE_BATTERY_PACK,
            CollectibleType.COLLECTIBLE_CAR_BATTERY,
            CollectibleType.COLLECTIBLE_9_VOLT,
            CollectibleType.COLLECTIBLE_4_5_VOLT,
        }
        techsav.Costume = NullItemID.ID_ADULTHOOD
```


this function returns a table that contains your useful transformation info, so hold on to that.

example:
```lua
mycooltransformation = MorphAPI:AddTransformation("cool transformation",{CollectibleType.ITEM1,CollectibleType.ITEM2},0,2,NullItemID.ID_GUPPY)
```

### CheckTransformation(transformation,callback)
put this in your cache evaluation callback to check/apply the transformation.

transformation: the table that was returned from AddTransformation

callback: optional. the *name* of a function that will be called when the transformation is applied. useful for giving hearts upon gaining a transformation or something. 

### getStatus(transformation)
returns whether or not the player currently has the inputted transformation. returns true if yes, false if no. put this in your callbacks to add special unique transformation effects!

anyways, that's the whole thing. thank you for listening and all that jazz
