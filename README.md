# Northwestern SLURM Tempalte

This is a very barebones template for working on the CS Department's SLURM cluster.

The Apptainer image this defined in `image.def` will contain Micromamba, a conda replacement.

```bash
/bin/bash build.sh
srun --pty ./run.sh python
```