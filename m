From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: Congratulations! we have got hash function screwed up
Date: Thu, 6 Jan 2005 15:45:06 +0300
Message-ID: <20050106124505.GE5352@backtop.namesys.com>
References: <20041228221218.GA6412@schmorp.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-23044-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20041228221218.GA6412@schmorp.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: " Marc A. Lehmann " <pcg@goof.com>
Cc: reiserfs-list@namesys.com, stefan@hello-penguin.com

Hello,

On Tue, Dec 28, 2004 at 11:12:18PM +0100,  Marc A. Lehmann  wrote:
> Hi!
> 
> When trying to upgrade or reinstall the xfonts-75dpi,
> xfonts-75dpi-transcoded or 100dpi & transcoded debian packages on my
> 2.6.10-rc3 amd64 reiserfsv3 host, I get the following errors:
> 
>    dpkg: error processing
>    /var/cache/apt/archives/xfonts-75dpi_4.3.0.dfsg.1-10_all.deb (--unpack):
>     unable to make backup link of
>     `./usr/X11R6/lib/X11/fonts/75dpi/lutBS19-ISO8859-1.pcf.gz' before
>     installing new version: Device or resource busy
>     dpkg-deb: subprocess paste killed by signal (Broken pipe)
>    Preparing to replace xfonts-75dpi-transcoded 4.3.0.dfsg.1-10 (using
>          .../xfonts-75dpi-transcoded_4.3.0.dfsg.1-10_all.deb) ...
>    dpkg: error processing /var/cache/apt/archives/xfonts-75dpi-transcoded_4.3.0.dfsg.1-10_all.deb (--unpack):
>     unable to make backup link of `./usr/X11R6/lib/X11/fonts/75dpi/lutBS19-ISO8859-10.pcf.gz' before installing new version: Device or resource busy
>    dpkg-deb: subprocess paste killed by signal (Broken pipe)
>    Errors were encountered while processing:
>     /var/cache/apt/archives/xfonts-75dpi_4.3.0.dfsg.1-10_all.deb
>     /var/cache/apt/archives/xfonts-75dpi-transcoded_4.3.0.dfsg.1-10_all.deb
> 
> And at the same time, I get this in my kernel log:
> 
>    ReiserFS: hdg2: warning: reiserfs_add_entry: Congratulations! we have got hash function screwed up
> 
> Sure sounds like a filesystem bug to me. Is this 2.6.10-rc3-specific or a
> generic bug in handling hash collisions?

Tea hash is designed to be more resistant.  

there is a generic problem with overloading of the generation counter, but
tea hash should mix file names better and have less chances to 'screw the hash
function up'.  

Does the debian install all X font files into one dir? May be you have your own
font files installed in the same dir? I suggest to split the dir into several
ones.

> Deleteing the fonts and installing the package works, but the next upgrade
> makes the error appear again.
> 
> -- 
>                 The choice of a
>       -----==-     _GNU_
>       ----==-- _       generation     Marc Lehmann
>       ---==---(_)__  __ ____  __      pcg@goof.com
>       --==---/ / _ \/ // /\ \/ /      http://schmorp.de/
>       -=====/_/_//_/\_,_/ /_/\_\      XX11-RIPE

-- 
Alex.
