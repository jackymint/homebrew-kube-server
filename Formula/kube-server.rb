class KubeServer < Formula
  desc "Lightweight Kubernetes cluster manager for macOS"
  homepage "https://github.com/jackymint/kube-server"
  version "0.2.0"

  on_arm do
    url "https://github.com/jackymint/kube-server/releases/download/v#{version}/kube-server-darwin-arm64.tar.gz"
    sha256 "04438e10759c85a40076034381431566be63d3b475bcc78938e737211d0f24f2" # arm64
  end

  on_intel do
    url "https://github.com/jackymint/kube-server/releases/download/v#{version}/kube-server-darwin-amd64.tar.gz"
    sha256 "24f7c02a892e2431383fa8efd4c08897c61e32071b6e156867cf26a9815b4f12" # amd64
  end

  depends_on :macos => :ventura
  depends_on "vfkit"
  depends_on "socket_vmnet"
  depends_on "qemu"

  def install
    bin.install "kube-server-darwin-arm64" => "kube-server" if Hardware::CPU.arm?
    bin.install "kube-server-darwin-amd64" => "kube-server" if Hardware::CPU.intel?
  end

  test do
    assert_match "kube-server", shell_output("#{bin}/kube-server --help")
  end
end
