# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Pracphoenix.Repo.insert!(%Pracphoenix.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

# Insert data into the database

# Insert data into the database

alias Pracphoenix.Repo
alias Pracphoenix.Offers.Offer
alias Pracphoenix.Offers

Repo.insert! %Offer{
  uni: "City University of London",
  course: "Computer Science",
}

Repo.insert! %Offer{
  uni: "University of Greenwich",
  course: "Pharmacy",
}

Repo.insert! %Offer{
  uni: "University College London",
  course: "Economics",
}
