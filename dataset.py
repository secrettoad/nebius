from datasets import load_dataset
import os

os.environ['HF_DATASETS_CACHE']='/mnt/jail/root/.cache/huggingface/datasets'
dataset = load_dataset("pile-of-law/pile-of-law", 'tax_rulings')
for split in dataset:
     dataset[split].to_json(f"pile_of_law_tax_rulings_{split}.json", orient="records")
dataset = load_dataset("pile-of-law/pile-of-law", 'irs_legal_advice_memos')
for split in dataset:
     dataset[split].to_json(f"pile_of_law_irs_legal_advice_memos_{split}.json", orient="records")

