From: Alistair McDonald <alistair@inrevo.com>
Subject: Re: core dump on reiserfsck --rebuildtree
Date: Tue, 23 Sep 2003 23:10:37 +0100
Message-ID: <200309232310.37438.alistair@inrevo.com>
References: <65047.80.5.156.133.1064000151.squirrel@blanark.dyndns.org> <200309221102.08476.alistair@inrevo.com> <200309221438.41949.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15731-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200309221438.41949.vitaly@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Vitaly Fertman <vitaly@namesys.com>

(resent as it did not appear to have got through to the list first time; 
apologies for any duplicates)

On Monday 22 September 2003 11:38 am, you wrote:
>
> so it all looks like you have some problems with your hardware -- first of
> all on the second reiserfsck run you get a lot of errors -- it is not
> possible as pass0 already scanned through all blocks of your fs on the
> first run and fixed all problems. Before at pass1 you got strange error
> about not fixed corruption at pass0 -- you described in the first email.
> and now -- unreadable block. probably data on the way from harddrive to the
> memory get corrupted somehow -- you should test it all.
>
> we provide the assistance with broken hardware in terms of our
> www.namesys.com/support.html page.
>



Hi Vitaly

You were right, trust the code, it's hardware. However, I found my 
investigation interesting (you might have heard it all before, of course). 
hdparm reported that dma was off for the two drives in the lvm volume, so I 
switched it on on. reiserfsck --rebuild-tree then ran without any stage0 
errors, (and 24 times faster too) but it hung 5% from the end. I couldn't 
kill the process, or even shut down the machine cleanly, I tried to switch to 
init 1 and then just power off. A repeat run hung in the same place again. 

In the system log, I got: 
Sep 22 17:07:15 altair hdg: dma_intr: status=0x51 { DriveReady 
SeekCompleteError }
Sep 22 17:07:15 altair hdg: dma_intr: error=0x40 { UncorrectableError }, 
LBAsect=15574917, sector=15574784
Sep 22 17:07:15 altair end_request: I/O error, cmd 0 dev 22:01 (hdg), sector 
15574784

And from various searches, it seems that the drive is bad. There is no way 
forward. smart self-tests fail, but the smart status reamains "good"!

Now, as the first interesting thing, I read somewhere that dma is only turned 
ON by default if the kernel has support for the controller built in. Out of 
interest, can anyone confirm this? As my /dev/hda is supported, and has dma 
on, I see some empirical evidence for this. 

So, I suspect that if I'd had DMA turned on when my machine booted after the 
power outage, I'd have never had any problems, and never had to run 
reiserfsck, let alone with rebuild-tree. That's fustrating, and I now set dma 
on in the startup scripts.

Anyway, my hard drive is bad. I bet no-one will be suprised if I tell you it's 
an IBM Deskstar. It is under warrany, but to replace I have to send it away 
and THEN receive a replacement. So I lose my data, which I'd really like to 
preserve, well, as much as I can. 

Moving on to replacements, of all the 120Gb drives on the market, the IBM is 
the biggest. So any replacement drives (I will not buy another 2 deskstars) 
will be smaller, by about 3%. (120 gigs seems the best bang for the buck; I 
could buy a 160 and allocate the first 241254720 sectors I suppose.) 
I would like to stick to using lvm, so if I create a new logical volume, will 
copying the current /dev/lvm1/data to a new logical volume with dd  work? The 
copy will fail at the damaged area of the disk, and hang, I suspect, but am I 
right in saying that the first 97% would be copied (in theory; in practice it 
will stop at the bad sector(s)) and I could then run rebuild-tree on this 
copy and get some data back? 

Thanks for your help to date; I realise that the above isn't reiser specific, 
and if you don't want to help, I don't mind. 

Alistair 
-- 
Alistair McDonald     InRevo Ltd
Tel: 07017 467 386    http://www.inrevo.com
