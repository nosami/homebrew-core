class GoMd2man < Formula
  desc "Converts markdown into roff (man pages)"
  homepage "https://github.com/cpuguy83/go-md2man"
  url "https://github.com/cpuguy83/go-md2man.git",
      tag:      "v2.0.1",
      revision: "b1ec32e02fe539480dc03e3bf381c20066e7c6cc"
  license "MIT"

  bottle do
    rebuild 1
    sha256 cellar: :any_skip_relocation, arm64_big_sur: "c8228c62cba90dfcda781325c0cd8709ee32e31f5ec7eb3471e822e7bb7627b4"
    sha256 cellar: :any_skip_relocation, big_sur:       "c6f05023662243e7c46d5206a1a2af2db7c2bc584086608f18388e1a05ecc755"
    sha256 cellar: :any_skip_relocation, catalina:      "1ff2123c31e56bc183a1b9b0e270c01ee31e16efc34c060e0d4ecbde87d9e16e"
    sha256 cellar: :any_skip_relocation, mojave:        "1ff2123c31e56bc183a1b9b0e270c01ee31e16efc34c060e0d4ecbde87d9e16e"
    sha256 cellar: :any_skip_relocation, high_sierra:   "1ff2123c31e56bc183a1b9b0e270c01ee31e16efc34c060e0d4ecbde87d9e16e"
    sha256 cellar: :any_skip_relocation, x86_64_linux:  "267262bbebe51ae5c1ab8a53ee6d0a260751ae09f11685a7afbc7a1c6c6eda8c"
  end

  depends_on "go" => :build

  def install
    system "go", "build", *std_go_args(ldflags: "-s -w")
    system bin/"go-md2man", "-in=go-md2man.1.md", "-out=go-md2man.1"
    man1.install "go-md2man.1"
  end

  test do
    assert_includes pipe_output(bin/"go-md2man", "# manpage\nand a half\n"),
                    ".TH manpage\n.PP\nand a half\n"
  end
end
