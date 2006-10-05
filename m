From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: Problems with "--rebuild-tree" on network (ENBD) storage
Date: Fri, 6 Oct 2006 02:23:23 +0400
Message-ID: <200610060223.23700.vs@namesys.com>
References: <4524BD36.1090002@tuxes.nl> <200610060150.10754.vs@namesys.com> <45258027.1010904@tuxes.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-30009-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <45258027.1010904@tuxes.nl>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bas van Schaik <bas@tuxes.nl>
Cc: reiserfs-list@namesys.com

Hello

On Friday 06 October 2006 01:59, Bas van Schaik wrote:
> Hi Vladimir,
> 
> 
> > On Thursday 05 October 2006 12:07, you wrote:
> >> Hi all,
> >>
> >> I'm having severe problems with reiserfsck --rebuild-tree on a
> >> CryptoLoop over LVM over RAID5 over ENBD (Enhanced Network Block Device)
> >> device. The first pass is no problem (finds errors, but runs perfectly),
> >> but the second pass hangs my whole system (load increasing to values
> >> like 30, 40, 50) after being active for about 20 minutes. 
> > 
> > Please be precise: which pass hangs? Pass 1 or pass 2? 
> > Note that reiserfsck --rebuild-tree starts with pass 0.
> I'm sorry: it hangs during the second pass, which is indeed called "pass 1".
> 
> > Please clarify what does "hangs whole system" mean. If the system hangs so that it has to be hard rebooted -
> Like I said: loads increases dramatically and renders the machine unusable.
> 
> > it is very likely that your problem has nothing to do with reiserfsck.
> I do think it has something to do with reiserfsck, since the system was
> functioning fine until I had to repair my filesystem! 

ok, may I ask you to run badblocks on that device? reiserfsck wants to be able to read and write filesystem device.
badblocks will show us whether your device is in good shape. 

> I've tried it for 
> many times now, but it hangs every time during the rebuild-tree.
> 
> > If reiserfsck just consumes 100% CPU on pass2 - there is experimental version of reiserfsck which improves pass 2 performance
> > substantially in some cases. 
> It's not a matter of CPU usage, it's about I/O. I suspect that ReiserFS
> fills my memory (TCP buffers) faster than they can flush, which causes
> starvation of the buffers.
> 
> >> Attached, 
> >> you'll find two graphs of this behaviour.
> >>
> > I see nothing attached.
> I think the mailing list doesn't support attachments, but there's not
> much too see anyway. Just a graph indicating an increasing load.
> 
> However, thanks for your thoughts!
> 
>  -- Bas
> 
> 
> 
> >> We're talking about a cluster of 5 machines, 4 of them are filled with
> >> in total about 3TB of harddisks, the 5th one imports those devices using
> >> ENBD and performs 4x RAID5 over it. LVM combines those 4 arrays to one
> >> device, and the cryptoloop over LVM ensures safe storage. In the normal
> >> situation, there should a mount point /backups (from /dev/loop0) with
> >> 2.4TB total space.
> >>
> >> However, about a week ago I added a new RAID-array to LVM, and started
> >> resizing my /backups partition to the maximum available space within
> >> LVM. During this resize, my new RAID5-array dropped out due to a disk
> >> failure (I didn't let md finish syncing the array...) and the resize
> >> failed. At that point, I had a corrupt filesystem, and I'm trying to run
> >> reiserfsck --rebuild-tree for a week now.
> >>
> >> I don't know exactly what is happening, but someone hinted me that
> >> reiserfsck might be filling up my TCP buffers (remember, it's a
> >> networked block device!) which will lock-up all the I/O to the network
> >> block device.
> >>
> >> For your information: I'm running Debian Sarge with a 2.6.17 kernel from
> >> Debian Etch and reiserfsprogs version 3.6.19 from Debian Sarge. The 5th
> >> system (frontend) contains a P4 3.0GHz and 1GB of RAM.
> >>
> >> Has anyone seen something like this before? Or does someone have an idea
> >> how I can solve this problem? Might it be worth a try to "upgrade" to
> >> Reiser4? If there's no other way, I am willing to give up my data
> >> (there's a partial backup of this backup anyway), but I do need to be
> >> sure that this won't happen again!
> >>
> >> BTW, I didn't find out how to subscribe to this list, so please cc. me
> >> in your reply! Thanks!
> >>
> >> Regards,
> >>
> >>  -- Bas van Schaik
> >>
> 
> 
> 
