
class Me24 < Formula
  desc "MicroEmacs 24 Text Editor"
  homepage "https://github.com/bjasspa/jasspa"
  version "20240901"
  PREFIX="https://github.com/bjasspa/jasspa/releases/download/me_20240901/Jasspa_MicroEmacs_20240901_abin_"
  FILE="Jasspa_MicroEmacs_20240901_abin_"
  if OS.mac?
      if Hardware::CPU.arm?
          # Code for Apple Silicon (M1, M2, etc.)
          url "#{PREFIX}macos_apple_mecs.zip"
          ZIP="#{FILE}macos_apple_mecs.zip"
          OSV="macos"
          sha256 "0378dd9ed9926e487d1fb91fb5e52 4969145a8dc5b3521630f31ce3c8f1a6903"
      elsif Hardware::CPU.intel?
          url "#{PREFIX}macos_intel_mecs.zip"
          ZIP="#{FILE}macos_intel_mecs.zip"
          OSV="macos"
          sha256 "724e286ce7b72d2eb30ad6e5ad63a38e8eb4157f57b17184dc4e6d99eecbeb3e"
      end
  elsif OS.linux?
      url "#{PREFIX}linux_mecs.zip"
      ZIP="#{FILE}linux_mecs.zip"
      OSV="linux"
    sha256 "efd191089a0e40b8b454bf4eb4af80f0972edcbe8c7e031bee0880c9d4d571b6"
  elsif OS.windows?
      url "#{PREFIX}windows_mecs.zip"
      ZIP="#{FILE}windows_mecs.zip"
      OSV="win32"
    sha256 "fd5791efeee561f8c33f6dd36136eea2de0df5992f48fd44043977b24d147129"
  end

  def install
      if OS.linux?
          bin.install "bin/linux5-intel64/mecs"
      elsif OS.mac? && Hardware::CPU.arm?
          bin.install "bin/macos14-apple64/mecs"
      elsif OS.mac? && Hardware::CPU.intel?
          bin.install "bin/macos14-intel64/mecs"
      elsif OS.windows?
          bin.install "bin/windows100-intel32/mecs"
      end
  end

  test do
    assert_match "MicroEmacs 24 - Date 2024/09/01 - linux", shell_output("#{bin}/mecs -V")
  end
end
