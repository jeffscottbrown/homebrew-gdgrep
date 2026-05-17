class Gdgrep < Formula
  desc "Fast, friendly grep written in the Jerry language"
  homepage "https://github.com/jeffscottbrown/gdgrep"
  version "VERSION_PLACEHOLDER"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/jeffscottbrown/gdgrep/releases/download/VERSION_PLACEHOLDER/gdgrep-macos-arm64.tar.gz"
      sha256 "SHA256_MACOS_ARM64"
    end
    on_intel do
      url "https://github.com/jeffscottbrown/gdgrep/releases/download/VERSION_PLACEHOLDER/gdgrep-macos-x86_64.tar.gz"
      sha256 "SHA256_MACOS_X86_64"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/jeffscottbrown/gdgrep/releases/download/VERSION_PLACEHOLDER/gdgrep-linux-x86_64.tar.gz"
      sha256 "SHA256_LINUX_X86_64"
    end
  end

  def install
    bin.install "gdgrep"
  end

  test do
    (testpath/"input.txt").write("apple\nbanana\napricot\n")
    assert_match "apple",   shell_output("#{bin}/gdgrep apple #{testpath}/input.txt")
    assert_match "apricot", shell_output("#{bin}/gdgrep ap    #{testpath}/input.txt")
    assert_match "1:apple", shell_output("#{bin}/gdgrep -n apple #{testpath}/input.txt")
    assert_match "APPLE",   shell_output("#{bin}/gdgrep -i apple #{testpath}/input.txt").upcase
  end
end
