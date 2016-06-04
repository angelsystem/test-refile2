require "refile/s3"
require 'refile/simple_form'

aws = {
  access_key_id: "AKIAIZE4N7LF6BXERSYQ",
  secret_access_key: "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",
  region: "us-west-2",
  bucket: "weclubdemo3",
}
Refile.cache = Refile::S3.new(prefix: "cache", **aws)
Refile.store = Refile::S3.new(prefix: "store", **aws)
