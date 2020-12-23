#!/usr/local/bin/python3
# XXX: better shebang

import pandas as pd 

# XXX: file paths
youtube_episodes = pd.read_csv("episodes_from_youtube.csv", names=["episode_title", "video_id"])
youtube_episodes["episode_signature"] = ""
youtube_episodes["episode_number"] = ""
youtube_episodes["season_number"] = ""


for i, row in youtube_episodes.iterrows():
	youtube_title = row[0]
	if "Season" not in youtube_title:
		youtube_episodes.drop(i, inplace=True)
		continue
	
	title = youtube_title.removeprefix("Bob Ross - ")	
	title_split = title.split("(Season ")
	title = title_split[0].strip()
	
	# Special case for S20E1, where the title doesn't follow convention
	if len(title_split) != 2:
		title_split = title.split(" - Season ")
		title = title_split[0].removesuffix(" (High Quality)")
	assert(len(title_split) == 2)
	
	
	signature = title_split[1]
	signature = signature.removesuffix(")")

	(season_number, _, episode_number) = signature.split(" ")
	signature = "S" + season_number + "E" + episode_number

	row["episode_title"] = title
	row["episode_signature"] = signature
	row["episode_number"] = int(episode_number)
	row["season_number"] = int(season_number)

web_episodes = pd.read_csv("episodes_from_web.csv")

episodes = pd.merge(youtube_episodes, web_episodes, how="outer", on=["episode_signature", "episode_title"])
episodes.sort_values(["season_number", "episode_number"], inplace=True)
episodes.to_csv("episodes_final.csv", index=False)
episodes.to_json("episodes_final.json", orient="values")