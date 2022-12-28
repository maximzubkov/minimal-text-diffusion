if [ ! -d data ]
then
  mkdir data
fi

if [ ! -d data/e2e ]
then
  mkdir data/e2e
fi

wget https://github.com/XiangLi1999/Diffusion-LM/raw/main/datasets/e2e_data/src1_train.txt
wget https://github.com/XiangLi1999/Diffusion-LM/raw/main/datasets/e2e_data/src1_valid.txt
wget https://github.com/XiangLi1999/Diffusion-LM/raw/main/datasets/e2e_data/src1_test.txt

mv src1_train.txt data/e2e/train_initial.txt
mv src1_valid.txt data/e2e/valid_initial.txt
mv src1_test.txt data/e2e/test_initial.txt

python scripts/e2e.py
