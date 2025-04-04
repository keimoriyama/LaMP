TASK_NAME=LaMP-4

docker compose exec lamp_reproduce python LaMP/train_llm.py \
    --train_data ./LaMP/${TASK_NAME}/train_merged_rank.json \
    --validation_data ./LaMP/${TASK_NAME}/train_merged_rank.json \
    --model_name google/flan-t5-base \
    --task ${TASK_NAME} \
    --output_dir LaMP/results/ \
    --retriever contriver \
    --num_retrieved 2
