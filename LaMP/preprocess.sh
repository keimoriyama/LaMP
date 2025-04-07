TASK_NAME=LaMP-5
DATA=train


docker compose exec lamp_reproduce python \
	LaMP/rank_profiles.py \
	--input_data_addr ./LaMP/${TASK_NAME}/${DATA}_questions.json \
	     --task ${TASK_NAME} \
	     --output_ranking_addr ./LaMP/${TASK_NAME}/${DATA}_questions_rank.json \
	     --ranker contriever


docker compose exec lamp_reproduce python \
	LaMP/utils/merge_with_rank.py \
	--lamp_questions_addr ./LaMP/${TASK_NAME}/${DATA}_questions.json \
	--lamp_output_addr ./LaMP/${TASK_NAME}/${DATA}_outputs.json \
	--profile_ranking_addr ./LaMP/${TASK_NAME}/${DATA}_questions_rank.json \
	--merged_output_addr ./LaMP/${TASK_NAME}/${DATA}_merged_rank.json
