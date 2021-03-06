# Write your code below game_hash
require 'pry'
def game_hash
  {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {
          player_name: "Alan Anderson",
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1
        },
        {
          player_name: "Reggie Evans",
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7
        },
        {
          player_name: "Brook Lopez",
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15
        },
        {
          player_name: "Mason Plumlee",
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 11,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5
        },
        {
          player_name: "Jason Terry",
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1
        }
      ]
    },
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {
          player_name: "Jeff Adrien",
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2
        },
        {
          player_name: "Bismack Biyombo",
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 22,
          blocks: 15,
          slam_dunks: 10
        },
        {
          player_name: "DeSagna Diop",
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5
        },
        {
          player_name: "Ben Gordon",
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0
        },
        {
          player_name: "Kemba Walker",
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 7,
          blocks: 5,
          slam_dunks: 12
        }
      ]
    }
  }
end

# Write code here








def winning_team
  winning_score = 0 
  winner = ""
    game_hash.map {
    |location, team_info, count = 0|
      game_hash[location][:players].map {
        |each_player|
        count += each_player[:points]
      }
      if count > winning_score
        winning_score = count 
        winner = "#{game_hash[location][:team_name]} is the winner!"
      end
    }
    winner
end
#p winning_team
"""PLS COME BACKand figure out how to use player_numbers and num_points_scored to solve this problem"""


def player_with_longest_name(least_biggest_type = 0, conditional_stat = :player_name)
  winning_player = ""
  biggest_number = least_biggest_type
  game_hash.map {
    |location, team_info|
      game_hash[location][:players].map {
        |each_player|
        if each_player[conditional_stat].length > biggest_number
          biggest_number = each_player[conditional_stat].length
          winning_player = each_player[:player_name]
        end
        #binding.pry
      }
  }
  winning_player
end
#p player_with_longest_name


def player_with_most_x(least_biggest_type = 0, conditional_stat)
  winning_player = ""
  biggest_number = least_biggest_type
  game_hash.map {
    |location, team_info|
      game_hash[location][:players].map {
        |each_player|
        if each_player[conditional_stat] > biggest_number
          biggest_number = each_player[conditional_stat] 
          winning_player = each_player[:player_name]
        end
        #binding.pry
      }
  }
  winning_player
end
#p player_with_most_x(:shoe)


def most_points_scored
  player_with_most_x(:points)
end
#p most_points_scored

def big_shoe_rebounds
  player_stats(player_with_most_x(:shoe))[:rebounds]
  #binding.pry
end

def player_stats(player)
  player_here(player)
end

def player_numbers(team)
  game_hash.collect {
    |location, team_info|
    if team_info.values.include? team
      game_hash[location][:players].collect {
        |i|
        i[:number]
      }
    end
  }.flatten.compact
end


def player_here(player)
  game_hash.select {
    |i, a|
    game_hash[i][:players].select {
      |b|
      points = b.select {
        |c, d|
        return b if d == player
      }
      #binding.pry
    }
  }
end

def shoe_size(player)
  player_here(player)[:shoe]
end

def team_names
  game_hash.collect {
    |i,a|
    game_hash[i][:team_name]
  }
end

def team_colors(team)
  game_hash.collect {
    |a, i|
    return game_hash[a][:colors] if i[:team_name] == team
  }
end

def num_points_scored(player)
 player_here(player)[:points]
end

def long_name_steals_a_ton?
  candidate = player_with_longest_name
  condition = player_with_most_x(:steals)
  "#{true}, #{condition} had the most steals :)" if candidate == condition
end
p long_name_steals_a_ton?


p "HALLELUJAYH!"
