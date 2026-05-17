# Homebrew formula template for gdgrep.
#
# This file lives in the gdgrep source repo as a reference copy.
# The release workflow copies it to jeffscottbrown/homebrew-gdgrep and
# replaces the v0.2.3 and SHA256_* tokens with real values.
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
  version "v0.2.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jeffscottbrown/gdgrep/releases/download/v0.2.3/gdgrep-macos-arm64.tar.gz"
      sha256 "5aa6369d7dd67a839371ede0093c2c6d656a3505fa22574c6ccb10039d86cf95"
    end
    on_intel do
      url "https://github.com/jeffscottbrown/gdgrep/releases/download/v0.2.3/gdgrep-macos-x86_64.tar.gz"
      sha256 "9c98d855137b459f1bcc359977350c660e900abd61de9602da015ec706aab617"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jeffscottbrown/gdgrep/releases/download/v0.2.3/gdgrep-linux-x86_64.tar.gz"
      sha256 "47d898b8c14ae3f9bff36787dac88a064da2af7e656030b9c58553921ec62e77"
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
