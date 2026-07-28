cask "seqtoid" do
  arch arm: "arm64", intel: "amd64"

  version "6.1.0-beta.1"
  sha256 arm:   "b52cac850148b942db0568af6913d4d8290701bc62fc9ac966a186e70f4c7b81",
         intel: "59f9b1e8d39325aa73f094b96474a022bb38f3ed74ea5619e0ece2ba8fd5f55d"

  url "https://github.com/IT-Academic-Research-Services/seqtoid-cli/releases/download/v#{version}/seqtoid-cli_darwin_#{arch}.tar.gz"
  name "SeqToID CLI"
  desc "A CLI for uploading samples to SeqToID"
  homepage "https://github.com/IT-Academic-Research-Services/seqtoid-cli"

  binary "seqtoid-cli_darwin_#{arch}/seqtoid"

  # Unsigned beta: strip the Gatekeeper quarantine so the binary runs without the
  # "unverified developer" prompt. Removed once the binary is code-signed.
  postflight do
    system_command "/usr/bin/xattr",
                   args: ["-dr", "com.apple.quarantine", "#{staged_path}/seqtoid-cli_darwin_#{arch}/seqtoid"]
  end
end
