set -eu

poincept_dir=$(realpath $(dirname $0)/..)
pushd $poincept_dir >/dev/null

cfg_file=configs/s3dis/semseg-pt-v3m1-0-base.py

exp_path=/home/alisherblack/stuff/sonata/repos/Pointcept/exp/sonata/s3dis-ptv3-test
rm -rf $exp_path


export PYTHONPATH=./
python tools/test.py \
  --config-file $cfg_file \
  --num-gpus 1 \
  --data-root /home/alisherblack/stuff/sonata/cache/s3dis-compressed \
  --options \
    save_path=$exp_path \
    batch_size=4 \
    num_worker=32 \
    weight=/home/alisherblack/stuff/sonata/repos/Pointcept/exp/sonata/s3dis-ptv3/model/model_best.pth \
    enable_wandb=False




popd >/dev/null

