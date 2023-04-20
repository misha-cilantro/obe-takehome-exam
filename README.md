# README

This is a simple API that allows searching for Rick & Morty characters by name and seeing how many times they appeared per season.
It uses the Rick & Morty API [https://rickandmortyapi.com/] and the rickmorty gem.

Call API like: `/api/v1/character?name=rick`. 

The name parameter is required. All other parameters are ignored. If no character is found, an empty array is returned.

Note that in order to be responsive the app assumes that there are always 10 episodes per season after season1 (which had 11).
This is accurate through season 6, but if this changes the app will be wrong for later seasons... though ideally we'll have plenty
of time to update the API by then.

# Caching
Search data is cached once per day.

# Ruby version
Ruby 3.2.2

`.tool-versions` file exists for those using asdf for ruby version management.

#System dependencies
This uses barebones Rails 7. The only additional gem is `rickmorty`, so it should be pretty straightforward to set up.
Note this app was generated with `--api` so there is no view rendering.
