set -eu

poincept_dir=$(realpath $(dirname $0)/..)
pushd $poincept_dir >/dev/null

cfg_file=configs/s3dis/semseg-pt-v3m1-0-base.py

exp_dir=exp/sonata/s3dis-ptv3
rm -rf $exp_dir

export PYTHONPATH=./
python tools/train.py \
  --config-file $cfg_file \
  --num-gpus 1 \
  --data-root /home/alisherblack/stuff/sonata/cache/s3dis-compressed \
  --options \
    save_path=$exp_dir \
    batch_size=2 \
    num_worker=16 \
    epoch=40 \
    eval_epoch=20 \
    enable_wandb=False

popd >/dev/null