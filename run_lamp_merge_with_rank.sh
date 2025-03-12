DATA=train

docker compose exec moriyama_task python \
	LaMP/utils/merge_with_rank.py \
	--lamp_questions_addr LaMP/${DATA}_questions.json \
	--lamp_output_addr LaMP/${DATA}_outputs.json \
	--profile_ranking_addr LaMP/${DATA}_questions_rank.json \
	--merged_output_addr LaMP/${DATA}_merged_rank.json
