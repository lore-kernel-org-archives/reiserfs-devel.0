From: Yury Umanets <umka@namesys.com>
Subject: Re: Problems with reiserfsck 3.6.9 (Newbie)
Date: 21 Jul 2003 14:15:48 +0400
Message-ID: <1058782548.29972.1.camel@haron.namesys.com>
References: <OFC07A0152.B0CB2D3C-ONC1256D6A.00325BC5-C1256D6A.0035E056@oilgear.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14974-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <OFC07A0152.B0CB2D3C-ONC1256D6A.00325BC5-C1256D6A.0035E056@oilgear.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: jbingemer@oilgear.de
Cc: reiserfs-list@namesys.com

On Mon, 2003-07-21 at 13:47, jbingemer@oilgear.de wrote:
> Hello,
> 
> I've problems with my big harddisk in my home server.
> 
> The problem started with accessing an CD image stored on that disk over a 
> NFS share. The same directory is also shared over SAMBA for my 2000 box. 
> (The Disk is a Samsung 120GB drive, half a year old).
> 
> The server just stopped responding when I tried to burn this image (at 
> 176MB the buffer turned empty and cdrdao stopped responding). I was not 
> able to access the samba share or the nfs share of that volume any more.
> 
> So I restarted the server, unmounted the volume and started reiserfsck. 
> The output told me to run --rebuild-tree, so I tried this, but @ Block 
> 25268519 it just stopped doing anything for 2h. I wasn't able to restart 
> the server anymore, so I switched it off yesterday evening.
> 
> This morning I installed the newest reiserfsprogs from your Homepage and 
> tried the --rebuild-tree again. It hangs again, but on a different block. 
> Here is the output of 'reiserfsck /dev/hde5 --rebuild-tree' :
> 
> --SNIP--
> bi:~ # reiserfsck /dev/hde5 --rebuild-tree
> 
> <-------------reiserfsck, 2003------------->
> reiserfsprogs 3.6.9
> 
>   *************************************************************
>   ** Do not  run  the  program  with  --rebuild-tree  unless **
>   ** something is broken and MAKE A BACKUP  before using it. **
>   ** If you have bad sectors on a drive  it is usually a bad **
>   ** idea to continue using it. Then you probably should get **
>   ** a working hard drive, copy the file system from the bad **
>   ** drive  to the good one -- dd_rescue is  a good tool for **
>   ** that -- and only then run this program.                 **
>   ** If you are using the latest reiserfsprogs and  it fails **
>   ** please  email bug reports to reiserfs-list@namesys.com, **
>   ** providing  as  much  information  as  possible --  your **
>   ** hardware,  kernel,  patches,  settings,  all reiserfsck **
>   ** messages  (including version),  the reiserfsck logfile, **
>   ** check  the  syslog file  for  any  related information. **
>   ** If you would like advice on using this program, support **
>   ** is available  for $25 at  www.namesys.com/support.html. **
>   *************************************************************
> 
> Will rebuild the filesystem (/dev/hde5) tree
> Will put log info to 'stdout'
> 
> Do you want to run this program?[N/Yes] (note need to type Yes if you 
> do):Yes
> Replaying journal..
> 0 transactions replayed
> ###########
> reiserfsck --rebuild-tree started at Mon Jul 21 10:23:02 2003
> ###########
> 
> Pass 0:
> ####### Pass 0 #######
> Loading on-disk bitmap .. ok, 25871679 blocks marked used
> Skipping 9105 blocks (super block, journal, bitmaps) 25862574 blocks will 
> be read
> 0%block 42751: The number of items (38) is incorrect, should be (5) - 
> corrected
> block 42751: The free space (36) is incorrect, should be (3508) - 
> corrected
> pass0: block 42751, item 1: The file [26801 41683] has the wrong mode 
> (?rwxrw-r-x), corrected to (-rwxrw-r-x)
> pass0: block 42751, item 3: The file [26801 41687] has the wrong mode 
> (c---rw-rw-), corrected to (----rw-rw-)
>                                                      left 25269095, 6381 
> /sec
> --SNIP--
> 
> Is there anything I can try or did I make a mistake ?
Hello,

First of all we need some information. And exactly: what kernel do you
running? and do you have some messages in your system log about
unability to read some sectors due to IO error?
> 
> Best regards
> Joerg Bingemer
-- 
We're flying high, we're watching the world passes by...

