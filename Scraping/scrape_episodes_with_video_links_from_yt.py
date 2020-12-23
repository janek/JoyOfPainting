# -*- coding: utf-8 -*-

# Sample Python code for youtube.playlistItems.list
# See instructions for running these code samples locally:
# https://developers.google.com/explorer-help/guides/code_samples#python

import os
import json
import csv 

import google_auth_oauthlib.flow
import googleapiclient.discovery
import googleapiclient.errors

scopes = ["https://www.googleapis.com/auth/youtube.readonly"]

playlist_ids = ["PLAEQD0ULngi5PAjhOL-GfvbcQDn2Hujoj",
	"PLAEQD0ULngi7EkzzzLDl33ibKHMDdUFc0",
	"PLAEQD0ULngi6c0D5_ELtW5p_NLShDktAN",
	"PLAEQD0ULngi6tej39ptiDqix2wd-W6glj",
	"PLAEQD0ULngi6J8P64GAMRZSzucIru0rMG",
	"PLAEQD0ULngi5c9XxQCtE8zGh157RJWH39",
	"PLAEQD0ULngi6XUucZGmcQeVRGHNg2WVsB",
	"PLAEQD0ULngi5ot5FztonBZegKLnsa1gXC",
	"PLAEQD0ULngi6dGd30_mzWENbNpT1k844a",
	"PLAEQD0ULngi5b8jcMLQ003OV5C2qUNeFE",
	"PLAEQD0ULngi5_UcEWkQZu23WzQP1Tkxq3",
	"PLAEQD0ULngi7-jK4pdhsSiu5CC0ojRqmM",
	"PLAEQD0ULngi56cKK-XkgZPwVLZ0lI15Mn",
	"PLAEQD0ULngi79FbgDR5HQURtzgXlRUfYa",
	"PLAEQD0ULngi5jejZ_dD7KhhEoLbjmglar",
	"PLAEQD0ULngi759CWjXUQM4IUE0fCn-REo",
	"PLAEQD0ULngi78t8tWZw6zPofUY5_Tz6AU",
	"PLAEQD0ULngi4tDLpPnT7XV0hzcIKMZLlP",
	"PLAEQD0ULngi5rdYozRhnJIOp5pWHCsPn2",
	"PLAEQD0ULngi5d5K57ImROanUMpcF-HXIS",
	"PLAEQD0ULngi7aIB4ifBbRHlAmsWpDko5M",
	"PLAEQD0ULngi5nVGjPmjw-vCE5AuDTLkkQ",
	"PLAEQD0ULngi6eJ6Sry9JCR0afC1HEhMjo",
	"PLAEQD0ULngi7_Td-kv4YRaDwJUpUuz0WR",
	"PLAEQD0ULngi5oKehJMOnVTetKSjfmFrT1",
	"PLAEQD0ULngi5UR35RJsvL0Xvlm3oeY4Ma",
	"PLAEQD0ULngi6bAFRfcqgpKP4T4SnoxoAz",
	"PLAEQD0ULngi56KMlB1P_wK9pJZcMpEFQd",
	"PLAEQD0ULngi7zDD6O36FKkEHse-JCdVvh",
	"PLAEQD0ULngi5VAEOviVE6svrUW2axISf6",
	"PLAEQD0ULngi69x_7JbQvSMprLRK_KSVLu",
	"PLAEQD0ULngi699dPZp_bI7yFX8BP7pF8i",
	"PLAEQD0ULngi55eOOpIGvWYAOCEAi16GNP",
	"PLAEQD0ULngi67rwmhrkNjMZKvyCReqDV4"
]

episodes={}

def main():
	# Disable OAuthlib's HTTPS verification when running locally.
	# *DO NOT* leave this option enabled in production.
	os.environ["OAUTHLIB_INSECURE_TRANSPORT"] = "1"

	api_service_name = "youtube"
	api_version = "v3"
	client_secrets_file = "youtube_api_client_secret.json"

	# Get credentials and create an API client
	flow = google_auth_oauthlib.flow.InstalledAppFlow.from_client_secrets_file(
		client_secrets_file, scopes)
	credentials = flow.run_console()
	youtube = googleapiclient.discovery.build(
		api_service_name, api_version, credentials=credentials)

	for playlist_id in playlist_ids:
		print("fetching playlist ", playlist_id)
		request = youtube.playlistItems().list(
			maxResults=100,
			part="snippet",
			playlistId=playlist_id
		)
		response = request.execute()
		
		for i in response['items']:
			title = i['snippet']['title']
			id = i['snippet']['resourceId']['videoId']
			episodes[title] = id
	
	print(len(episodes))
	w = csv.writer(open("youtube_episodes.csv", "w"))
	for key, val in episodes.items():
		w.writerow([key, val])


if __name__ == "__main__":
	main()