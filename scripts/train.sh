set -eu

poincept_dir=$(realpath $(dirname $0)/..)
pushd $poincept_dir >/dev/null

cfg_file=configs/s3dis/semseg-pt-v3m1-0-base.py

exp_dir=exp/sonata/s3dis-ptv3
rm -rf $exp_dir

export PYTHONPATH=./
CUDA_LAUNCH_BLOCKING=1 python tools/train.py \
  --config-file $cfg_file \
  --num-gpus 1 \
  --options \
    save_path=$exp_dir \
    batch_size=2 \
    num_worker=16 \
    epoch=20 \
    eval_epoch=10 \
    enable_wandb=False

popd >/dev/null