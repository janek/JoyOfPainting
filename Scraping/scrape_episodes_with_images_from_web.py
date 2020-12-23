#!/usr/local/bin/python3
# TODO: better shebang

import requests
from bs4 import BeautifulSoup
import pandas as pd


base_season_url = "https://www.twoinchbrush.com/season/"

dfs = []

num_seasons = 31 
for i in range(1,num_seasons+1):
	url =  base_season_url + str(i)
	page = requests.get(url)
	soup = BeautifulSoup(page.content, 'html.parser')
	
	spans = soup.section("span")
	texts = [s.getText() for s in spans]
	imgs = soup.section("img")
	
	episode_numbers = texts[::2] 
	episode_titles = texts[1:][::2]
	episode_titles = [title.replace("\n", "").strip() for title in episode_titles]
	
	episode_image_links = [img['src'].split("/")[-1] for img in imgs]
	
	episodes_df = pd.DataFrame(
		{'episode_signature': episode_numbers,
		 'episode_title': episode_titles,
		 'image_link': episode_image_links
		})
	
	dfs.append(episodes_df)


episodes = pd.concat([df for df in dfs])
episodes = episodes[episodes.image_link.str.contains("painting")]
episodes = episodes[episodes.image_link != "so-you-want-to-buy-a-bob-ross-painting.jpg"]
episodes.reset_index(drop=True, inplace=True)

episodes.to_csv("episodes.csv")