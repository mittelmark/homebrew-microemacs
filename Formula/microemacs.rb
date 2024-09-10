
class Microemacs < Formula
  desc "MicroEmacs 24 Text Editor"
  homepage "https://github.com/bjasspa/jasspa"
  url "https://github.com/bjasspa/jasspa/releases/download/me_20240902/Jasspa_MicroEmacs_20240902_help_ehf.zip"
  sha256 "CC95587293B33B0805906D1143CF473F419325F493E146C695C6325A45D56D27"
  version "20240902"
  depends_on "microemacs-mec"
  depends_on "microemacs-mew"  

  def install
    # Define the target directory
    target_dir = Pathname.new(Dir.home) + ".config/jasspa"
    mkdir_p target_dir unless File.exist?(target_dir)
    print(target_dir)
    system "curl -L -o help_ehf.zip https://github.com/bjasspa/jasspa/releases/download/me_20240902/Jasspa_MicroEmacs_20240902_help_ehf.zip"
    # Unzip the downloaded file
    system "unzip -o help_ehf.zip -d #{buildpath}"

    # Install the license and README files
    cp "#{buildpath}/COPYING.txt", target_dir 
    cp "#{buildpath}/readme.txt", target_dir 
    # Install help file
    cp "#{buildpath}/macros/me.ehf", target_dir
    # Clean up the downloaded ZIP file
    rm_f "help_ehf.zip"    
  end

end
