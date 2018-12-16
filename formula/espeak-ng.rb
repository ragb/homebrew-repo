
# PLEASE REMOVE ALL GENERATED COMMENTS BEFORE SUBMITTING YOUR PULL REQUEST!
class EspeakNg < Formula
  desc "eSpeak NG is an open source speech synthesizer that supports 102 languages and accents."
  homepage "https://github.com/espeak-ng/espeak-ng"
  url "https://github.com/espeak-ng/espeak-ng/releases/download/1.49.2/espeak-ng-1.49.2.tar.gz"
  version "1.49.2"
  sha256 "cf7ed86850b99bafe819548c73a6651a74300980dd15f319ff22e2bd72ea20b4"

  head do
    url "https://github.com/espeak-ng/espeak-ng.git"
    depends_on "autoconf" => :build
    depends_on "automake" => :build
    depends_on "libtool" => :build
  end
  
  depends_on "pcaudiolib"
  
  def install
    ENV.deparallelize  # if your formula fails when building in parallel
    if build.head?
      system "./autogen.sh"
    end
     
    system "./configure", "--disable-debug",
                          "--disable-dependency-tracking",
                          "--disable-silent-rules",
                          "--prefix=#{prefix}"
    system "make", "install" # if this fails, try separate make/make install steps
  end

  test do
    system "espeak-ng", "this is a test of espeak-ng"
  end
end
