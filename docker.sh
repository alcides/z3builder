docker run \
  --interactive --tty --rm \
  --volume "$PWD":/wd \
  --workdir /wd \
  --entrypoint "./z3_builder.sh" \
  "confident/headrest"
