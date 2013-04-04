# Cleaning Out
Page.delete_all
Page.create(starting_point: true, content: "You wake up on a road. It's foggy and damp. You have 30 gold pieces and a bacon sandwich. Which do you choose?")
Page.create(conclusion: true, parent_id: Page.first.id, content: "Go into the forest", result: "WINNER: you won 30 gold pieces!")
Page.create(conclusion: true, parent_id: Page.first.id, content: "Walk down the road", result: "LOSER: you've been eaten by a shark")
