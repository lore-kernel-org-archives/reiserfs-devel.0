From: <pcg( Marc)@goof(A.).(Lehmann )com>
Subject: Congratulations! we have got hash function screwed up
Date: Tue, 28 Dec 2004 23:12:18 +0100
Message-ID: <20041228221218.GA6412@schmorp.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22930-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com
Cc: stefan@hello-penguin.com

Hi!

When trying to upgrade or reinstall the xfonts-75dpi,
xfonts-75dpi-transcoded or 100dpi & transcoded debian packages on my
2.6.10-rc3 amd64 reiserfsv3 host, I get the following errors:

   dpkg: error processing
   /var/cache/apt/archives/xfonts-75dpi_4.3.0.dfsg.1-10_all.deb (--unpack):
    unable to make backup link of
    `./usr/X11R6/lib/X11/fonts/75dpi/lutBS19-ISO8859-1.pcf.gz' before
    installing new version: Device or resource busy
    dpkg-deb: subprocess paste killed by signal (Broken pipe)
   Preparing to replace xfonts-75dpi-transcoded 4.3.0.dfsg.1-10 (using
         .../xfonts-75dpi-transcoded_4.3.0.dfsg.1-10_all.deb) ...
   dpkg: error processing /var/cache/apt/archives/xfonts-75dpi-transcoded_4.3.0.dfsg.1-10_all.deb (--unpack):
    unable to make backup link of `./usr/X11R6/lib/X11/fonts/75dpi/lutBS19-ISO8859-10.pcf.gz' before installing new version: Device or resource busy
   dpkg-deb: subprocess paste killed by signal (Broken pipe)
   Errors were encountered while processing:
    /var/cache/apt/archives/xfonts-75dpi_4.3.0.dfsg.1-10_all.deb
    /var/cache/apt/archives/xfonts-75dpi-transcoded_4.3.0.dfsg.1-10_all.deb

And at the same time, I get this in my kernel log:

   ReiserFS: hdg2: warning: reiserfs_add_entry: Congratulations! we have got hash function screwed up

Sure sounds like a filesystem bug to me. Is this 2.6.10-rc3-specific or a
generic bug in handling hash collisions?

Deleteing the fonts and installing the package works, but the next upgrade
makes the error appear again.

-- 
                The choice of a
      -----==-     _GNU_
      ----==-- _       generation     Marc Lehmann
      ---==---(_)__  __ ____  __      pcg@goof.com
      --==---/ / _ \/ // /\ \/ /      http://schmorp.de/
      -=====/_/_//_/\_,_/ /_/\_\      XX11-RIPE
