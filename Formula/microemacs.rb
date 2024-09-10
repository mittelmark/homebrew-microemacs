
class Microemacs < Formula
  desc "MicroEmacs 24 Text Editor"
  homepage "https://github.com/bjasspa/jasspa"
  version "20240902"
  depends_on "microemacs-mec"
  depends_on "microemacs-mew"  
  PREFIX="https://github.com/bjasspa/jasspa/releases/download/me_#{version}/Jasspa_MicroEmacs_#{version}"
  EHF="#{PREFIX}_help_ehf.zip"
  url "#{EHF}"
  sha256 "CC95587293B33B0805906D1143CF473F419325F493E146C695C6325A45D56D27"

  def install
  # Define the target directory
    target_dir = "#{ENV['HOME']}/.config/jasspa"
    # Create the target directory if it doesn't exist
    mkdir_p target_dir unless File.exist?(target_dir)
    cp "#{buildpath}/macros/me.ehf", target_dir
  end

end
