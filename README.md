# Ghost_Game
Ruby implementation of everyone's (or maybe just my) favorite road-trip word game, Ghost.
- [x] Phase 1
- [x] Phase 2
- [x] Phase 3
- [ ] Phase Bonus

## Learning Goals
- Understand how different classes interact
- Be able to write classes in different files and use ```require_relative``` to connect them
- Know how to test methods in ```pry```
- Know how to read lines from a text file
- Understand how ```__FILE__ == $PROGRAM_NAME works```

### Phase 1: Playing a Single Round
Let's start by writing the logic to play a single round of Ghost (that is, playing until one player spells a word). Write your game for two players only, and don't worry about keeping track of wins/losses (we can get to this later). The basic logic will look something like this:

Instantiate a new Game object, passing in both of the Players.
The Game maintains a fragment instance variable, which represents the word as it has been built up by the players.
The Players take turns adding a letter to the fragment. The Game should ensure that a play is valid before actually changing the fragment.
The Game checks the fragment against a dictionary; if the fragment is a word contained in the dictionary, then the previous player loses.

#### Sample Code
```Ruby
  def valid_play?(string)
        return false if !ALPHA.include?(string)
        potential_fragment = fragment + string
        return false if !dictionary.any? { |word| word.start_with?(potential_fragment) }
        @fragment += string
    end
```
#### Phase Preview
![todo_board-gif](https://media.giphy.com/media/xNgIWE7gNv21T99uhw/giphy.gif)

### Phase 2: Playing a Full Game
Now that we have the logic to play a single round of Ghost, we'll have to add another layer.

#### Sample Code
```Ruby
  def valid_play?(string)
        return false if !ALPHA.include?(string)
        potential_fragment = fragment + string
        return false if !dictionary.any? { |word| word.start_with?(potential_fragment) }
        @fragment += string
    end
```

#### Phase Preview
![todo_board-gif](https://media.giphy.com/media/xNgIWE7gNv21T99uhw/giphy.gif)

### Phase 3: Multiplayer!
Refactor your game to work with more than just two players. Instead of ending the game when one of the players reaches five losses, simply exclude that player from further rounds. End the game when only one player is left standing. Hint: You won't be able to use an instance variable for each player anymore. What data structure might we use as an alternative?

#### Sample Code
```Ruby
  def valid_play?(string)
        return false if !ALPHA.include?(string)
        potential_fragment = fragment + string
        return false if !dictionary.any? { |word| word.start_with?(potential_fragment) }
        @fragment += string
    end
```

#### Phase Preview
![todo_board-gif](https://media.giphy.com/media/xNgIWE7gNv21T99uhw/giphy.gif)

### Phase Bonus
Write an AiPlayer class for your Ghost game. You'll need to figure out the logic for picking a winning letter on each turn. In order to do this, your AiPlayer will need to know both the current fragment and the number of other players (n).

#### Sample Code
```Ruby
  def valid_play?(string)
        return false if !ALPHA.include?(string)
        potential_fragment = fragment + string
        return false if !dictionary.any? { |word| word.start_with?(potential_fragment) }
        @fragment += string
    end
```

#### Phase Preview
![todo_board-gif](https://media.giphy.com/media/xNgIWE7gNv21T99uhw/giphy.gif)

## Gameplay Overview
- youtube link

## Tech Used
- Ruby 3.0
- Git 2.30.0
- Github