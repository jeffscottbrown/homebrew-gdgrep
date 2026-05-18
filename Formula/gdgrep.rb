# Homebrew formula template for gdgrep.
#
# This file lives in the gdgrep source repo as a reference copy.
# The release workflow copies it to jeffscottbrown/homebrew-gdgrep and
# replaces the v0.4.0 and SHA256_* tokens with real values.
#
# To set up the tap repo for the first time:
#   1. Create https://github.com/jeffscottbrown/homebrew-gdgrep
#   2. Inside that repo, create Formula/gdgrep.rb with this file's contents.
#   3. Add a fine-grained PAT with Contents: Read+Write on homebrew-gdgrep
#      as the HOMEBREW_TAP_TOKEN secret in the gdgrep repo.
#   4. Push a v*.*.* tag to trigger the first release and formula update.

class Gdgrep < Formula
  desc "Fast, friendly grep written in the Jerry language"
  homepage "https://github.com/jeffscottbrown/gdgrep"
  version "v0.4.0"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/jeffscottbrown/gdgrep/releases/download/v0.4.0/gdgrep-macos-arm64.tar.gz"
      sha256 "9f07f69218883d67f5dd773953617959c10028f66e98df7d013f7ccd21ff6f39"
    end
    on_intel do
      url "https://github.com/jeffscottbrown/gdgrep/releases/download/v0.4.0/gdgrep-macos-x86_64.tar.gz"
      sha256 "4b7d03efcc62d89c580296959f0d0f2bd21310ccd59c7407bf53e1a1ed08f284"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jeffscottbrown/gdgrep/releases/download/v0.4.0/gdgrep-linux-x86_64.tar.gz"
      sha256 "dc27d075b31c9f5a1b61e9a4e3eb5373bd1ae8e911b47ce7a54010905b0e412c"
    end
  end

  def install
    if OS.mac?
      if Hardware::CPU.arm?
        bin.install "gdgrep-macos-arm64" => "gdgrep"
      else
        bin.install "gdgrep-macos-x86_64" => "gdgrep"
      end
    elsif OS.linux?
      bin.install "gdgrep-linux-x86_64" => "gdgrep"
    end
  end

  test do
    (testpath/"input.txt").write("apple\nbanana\napricot\n")
    assert_match "apple",   shell_output("#{bin}/gdgrep apple #{testpath}/input.txt")
    assert_match "apricot", shell_output("#{bin}/gdgrep ap    #{testpath}/input.txt")
    assert_match "1:apple", shell_output("#{bin}/gdgrep -n apple #{testpath}/input.txt")
    assert_match "APPLE",   shell_output("#{bin}/gdgrep -i apple #{testpath}/input.txt").upcase
  end
end
