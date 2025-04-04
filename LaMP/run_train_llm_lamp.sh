TASK_NAME=LaMP-4

python train_llm.py \
    --train_data ./LaMP/${TASK_NAME}/train_merged_rank.json \
    --validation_data ./LaMP/${TASK_NAME}/train_merged_rank.json \
    --model_name google/flan-t5-base \
    --task ${TASK_NAME} \
    --output_dir LaMP/results/ \
    --retriever contriver \
    --use_profile \ /*used to perfrom personalization with RAG */
    --is_ranked \ /*used if you pre-ranked the profiles based on the provided retrieval model*/
    --num_retrieved 2
