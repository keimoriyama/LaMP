docker compose exec moriyama_task python \
	LaMP/rank_profiles.py \
	--input_data_addr ./LaMP/dev_questions.json \
	     --task LaMP-4 \
	     --output_ranking_addr ./LaMP/dev_questions_rank.json \
	     --ranker contriever
