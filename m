From: Oleg Drokin <green@namesys.com>
Subject: Re: My mistake....
Date: Thu, 11 Jul 2002 17:05:37 +0400
Message-ID: <20020711170537.A2611@namesys.com>
References: <000b01c228db$3a1b1f00$0e01a8c0@englishbay.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10972-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <000b01c228db$3a1b1f00$0e01a8c0@englishbay.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Brian <brian@english-bay.com>
Cc: reiserfs-list@namesys.com

Hello!

   Have you tried specifying explicit -t reiserfs parameter?

Bye,
    Oleg
On Thu, Jul 11, 2002 at 06:02:35AM -0700, Brian wrote:
> Hi:
> 
> Will try to make a long story short.
> 
> I had a 20 gig HD partitioned into 2 10 gig partitons both employing
> reiserfs - it was employed as a samba fileserver for a few Windows boxes.
> All the files were huge and written contiguously - not fragmented.
> 
> While doing a new install of Slackware 8.1 (stock Linux kernel 2.4.18) on
> the samba fileserver I accidently formatted over one of the partitions with
> ext3 (EXT3 2.4-0.9.17) - I didn't do surface integrity testing during the
> format.
> 
> After I discovered my error, a quick scan of the raw disk showed the files
> still resident although all the journals appeared overwritten.
> 
> I deleted the partition, rebooted and repartioned exactly as before. I have
> run reiserfsck and rebuilt everything BUT when I try to mount the partition
> "mount" insists it's still an empty ext3 filesystem.
> 
> How do I restore the reiserfs format without undoing all the rebuilding I
> have done? (60 directories and 2500 files)
> 
> The partition remains unmounted and unused but I would love to get those
> files back and also use of the partition.
> 
> The first partition and reiser filesystem (reiserfs version 3.6.25 with r5
> hash) works perfectly.
> 
> Feel free to tell me what an idiot I am for making such a blunder as long as
> you can offer some constructive advice.
> 
> Any hints/help much appreciated.
> 
> Best regards,
> 
> Brian
> BSFH
> 
