From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: [reiserfs-dev] [ctgaff@attbi.com: Debian Woody Performance with ReiserFS]
Date: Mon, 11 Nov 2002 16:33:26 +0300
Message-ID: <15823.45478.638434.968665@laputa.namesys.com>
References: <20021109000211.GA46264@attbi.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11960-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20021109000211.GA46264@attbi.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Corey G." <ctgaff@attbi.com>
Cc: reiserfs-dev@namesys.com, reiserfs-list@namesys.com, ed@debian.org

[Ed Boraas CC-ed, probably this is of interest for Debian people.]

Corey G. writes:
 > My Problem and Solution to Bad Performance Using Debian Woody and ReiserFS
 > --------------------------------------------------------------------------
 > 
 > My first three attempts with ReiserFS and Woody were quite dismal.  Not
 > with the installation, but with performance.  I was quite literally pulling
 > hair out of my head because ReiserFS on Mandrake 9 performs remarkably
 > in my opinion.  Why would it work so awful with Debian 3.0?  Note: By
 > design, the default boot disks for Debian 3.0 do not contain ReiserFS
 > support.  In order to install ReiserFS during an initial installation,
 > you must download the BF2.4 disks which have "experimental drivers".  I
 > have seen many comments on the web wondering why Debian still thinks
 > Reiser is experimental.  It must be driven by the ultra conservatism of
 > Debian.  Regardless, ReiserFS is available for Debian Woody.
 > 
 > 
 > Addressing the Problem:
 > -----------------------
 > My first assumption was the kernel, so I upgraded to 2.4.19.  No such
 > luck.  Untarring Mozilla took 3m24s on an Athlon 800mzh with 1GB RAM.
 > The same test took 6 seconds on Mandrake on the same system.  After 
 > digging into the problem I finally came to the conclusion that Mandrake,
 > and probably other distributions, are tuning the hard drives
 > during installation or boot.  I dug around and found some rather safe 
 > settings to implement using "hdparm".  After applying the changes below,
 > my Debian system came to life.  Now I could untar at the speed of light 
 > and still use my mouse at the same time.
 > 
 > So, for whatever reason, Debian has chosen to be quite conservative
 > with assumptions on hard drive tuning.  I will admit that some of the
 > parameters I tried locked up my machine.  However, even the more
 > conservative settings work very nice.  My concern here is that
 > other individuals are certainly going to experience this problem with Debian
 > besides myself.  Another colleague here said he went back to ext2 because
 > the performance was horrible with ReiserFS on Debian.  Unfortunately,
 > this individual refuses to try other distributions so he never had
 > anything to compare.  Had I not seen the incredible performance on
 > Mandrake, I would have assumed that ReiserFS was a very slow filesystem.
 > 
 > To prove my theory about Mandrake pre-tuning the drives during boot, I had 
 > a colleague run hdparm on his Mandrake 9 installation.  Here is the output:
 > 
 > 
 > /dev/hda:
 >  multcount    = 16 (on)
 >  IO_support   =  0 (default 16-bit)
 >  unmaskirq    =  0 (off)
 >  using_dma    =  1 (on)
 >  keepsettings =  0 (off)
 >  readonly     =  0 (off)
 >  readahead    =  8 (on)
 >  geometry     = 1292/240/63, sectors = 19541088, start = 0
 > 
 > 
 > These settins were NOT on by default with Debian.  The most important
 > (I know this from testing) is "using_dma".  After turning this on, things
 > really start to move.

Probably this is because not using DMA increases CPU usage and reiserfs
already loads CPU significantly.

 > 
 > Here are my current settings with Debian:
 > 
 > /dev/hda:
 >  multcount    = 16 (on)
 >  I/O support  =  1 (32-bit)
 >  unmaskirq    =  1 (on)
 >  using_dma    =  1 (on)
 >  keepsettings =  0 (off)
 >  nowerr       =  0 (off)
 >  readonly     =  0 (off)
 >  readahead    =  8 (on)
 >  geometry     = 4866/255/63, sectors = 78177792, start = 0
 >  busstate     =  1 (on)
 > 
 > 
 > I simply added a start script to  /etc/init.d with the following:
 > 
 > #!/bin/sh
 > 
 > hdparm -m 16 -d 1 -u 1 -c 1 /dev/hda
 > 

You can also use -X option of hdparm.


Thank you for your research.

 > 
 > -- 
 > Best Regards,
 > Corey G.
 > 

Nikita.
