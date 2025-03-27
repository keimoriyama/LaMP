cd LaMP
python train_llm.py \
    --train_data /*address to sorted training data using the previous step*/ \
    --validation_data /*address to sorted validation data using the previous step*/ \
    --model_name /*address to the model that should be used for initialization of the LLM*/ \
    --task LaMP-4 /*name of the task [LaMP-1, LaMP-2, ..., LaMP-7]*/ \
    --output_dir results/ /*output directory to save results and checkpoints*/ \
    --retriever contriver /*the ranking model to be used [bm25, contriever, recency]*/ \
    --use_profile \ /*used to perfrom personalization with RAG */
    --is_ranked \ /*used if you pre-ranked the profiles based on the provided retrieval model*/
    --num_retrieved 2 /*number of items to be retrieved from the user profile*/ \ 
