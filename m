From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: reiserfschk --rebuild-tree was aborted, said disk was full
Date: Thu, 15 Jun 2006 14:52:37 +0400
Message-ID: <1150368757.6313.31.camel@tribesman.namesys.com>
References: <44910927.5030500@oddjob.se>
	 <1150359868.6313.23.camel@tribesman.namesys.com>
	 <44912841.3050609@oddjob.se>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28788-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44912841.3050609@oddjob.se>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Johan Isacsson <johan@oddjob.se>
Cc: reiserfs-list@namesys.com

Hello

On Thu, 2006-06-15 at 11:28 +0200, Johan Isacsson wrote:
> Hello,
> 
> Unfortunately that output was not logged and it will take a couple of 
> hours to do a new check and get the output, but besides the specific 
> numbers in the following output which i found (after posting my help 
> request) in the mailing list archive the message i got was this:
> [snip]
> 
> Pass 0:
> Loading on-disk bitmap .. ok, 61048992 blocks marked used
> Skipping 10074 blocks (super block, journal, bitmaps) 61038918 blocks will be read
> 0%....20%....40%....60%..                                                    lef      \
> left 0, 13223 /secccseccccc  "r5" hash is selected
> Flushing..finished
>         Read blocks (but not data blocks) 61038918
>                 Leaves among those 141109
>                         - leaves all contents of which could not be saved and deleted \
> 5  Objectids found 414533
> 
> Pass 1 (will try to insert 141104 leaves):
> Looking for allocable blocks .. finished
> 0%....20%....40%....60%....80%....Not enough allocable blocks, checking \
> bitmap...there are 1 allocable blocks, btw
> 
> out of disk space
> 
> Aborted
> 
> [/snip]
> 
> So i guess i should do as you replied to the person posting this and do 
> a dd to a bigger partition and do the rebuild-tree there?
> Here is the reply to the older post:
> 
> [snip]
> 
> you need to get a larger partition, dd hdg1 there, run 'reiserfsck --rebuild-sb' 
> on the copy to enlarge the fs size and after that run 'reiserfsck --rebuild-tree' 
> on it. or you can enlarge the existent hdg1.
> 
> Note: some disk space will be added to the current partition, if there was a 
> reiserfs before, that fs metadata will be mixed with the current fs. to avoid 
> 
> it, zero the added disk space first (dd if=/dev/zero ...)
> 
> [/snip]
> 
> I don't get the last part, if i do this and it works well i end up with 
> an OK file system on the other partition, should i completely wipe the 
> old partition before i dd it back to avoid problems? dd if=/dev/zero 
> of=/dev/oldpart?
> 

no

You copied oldpart to bigger newpart. End of newpart which was not
overwritten by oldpart should be zeroed.

Keep oldpart intact until you have data restored on newpart.



> Do you think there's any hope getting my data back?

yes

> Thanks for replying!
> 
> /Johan
> 
> Vladimir V. Saveliev skrev:
> > Hello
> >
> > On Thu, 2006-06-15 at 09:15 +0200, Johan Isacsson wrote:
> >   
> >> reiserfschk --rebuild-tree was aborted when it nearly had finished pass 
> >> 1 and now i can't mount the partition.
> >> I no longer have the exact error message.
> >>
> >> Just before the filesystem got bad we had removed lots of data because 
> >> the disk got full. Df then reported that there was lots of space left on 
> >> that partition.
> >> After that we had to power cycle the server because it got hung up and 
> >> after the reboot df reborted 100% usage and that some files couldn't be 
> >> read.
> >> I den did a reiserfschk --check which said there wer fatal errors and 
> >> that i needed to do a rebuild-tree, which i did.
> >> And after a long while it was aborted at about 90% of pass 1.
> >>
> >> I have the version 3.6.19-2 of reiserfs-progs (FC 4).
> >> Of course i read about taking a backup after i had done the 
> >> --rebuild-tree :(
> >>
> >>     
> > Please, let us see complete reiserfsck --rebuild-tree output.
> >
> >   
> 

