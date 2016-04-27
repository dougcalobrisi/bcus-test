FROM ruby:2.3-onbuild
EXPOSE 4567
CMD ["rake", "run"]
