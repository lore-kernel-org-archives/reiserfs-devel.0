From: Ric Wheeler <ric@emc.com>
Subject: Re: FEATURE Req: integrate badblocks check into fsck.reiser*
Date: Thu, 07 Sep 2006 06:35:07 -0400
Message-ID: <44FFF5DB.3050200@emc.com>
References: <ed9tqo$2tc$1@sea.gmane.org> <200609012250.44548.vs@namesys.com>	<44F8B3C8.1050802@slaphack.com> <edae71$iqf$1@sea.gmane.org> <44F8BE78.1080503@slaphack.com> <44FB925E.2000300@emc.com> <44FE1C04.70800@namesys.com> <44FEE45B.4060607@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29822-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <44FEE45B.4060607@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Masover <ninja@slaphack.com>
Cc: Hans Reiser <reiser@namesys.com>, Peter <sw98234@hotmail.com>, reiserfs-list@namesys.com



David Masover wrote:

> Hans Reiser wrote:
>
>> Ric Wheeler wrote:
>
>
>>> Having mkfs ignore bad writes would seem to encourage users to create
>>> a new file system on a disk that is known to be bad & most likely not
>>> going to function well.  If a user ever has a golden opportunity to
>>> toss a drive in the trash, it is when they notice mkfs fails ;-)  This
>>> option to mkfs sounds like an invitation to disaster.
>>
>> Yes, you are right, the option should be to run badblocks and then fail
>> if it finds any.
>
>
> Unless it creates significantly more work for us, there should be an 
> option to run badblocks, and if it finds any, it should prompt the 
> user (with BIG FAT CAPSLOCK WARNINGS) whether they want to format 
> anyway. Formatting anyway should work, and we should be able to have 
> blocks marked bad.


I think that you are missing the way modern drives behave.  To give a 
typical example, on a 300 GB drive, we typically have 2000 or more extra 
sectors that are used for automatic remapping.  Theses sectors are 
consumed only when the drive retries a failed write multiple times.

If you fail a write, that means (barring even worse failure modes like a 
whole head going south) that all of these sectors have been consumed.

If they have not been consumed, the user will never see the remapping 
(it happens as part of a normal write, just takes longer than usual).

We really, really do not need a list of bad blocks to avoid during 
writing a new file system image. 

I think that the more interesting case is handling bad blocks during 
recovery.  It is not clear to me that fsck needs a list, but we have 
worked with Hans and Vladamir to get support for doing a reverse mapping 
(given a list of bad blocks, show the user what files, etc got hit).

>
> It would also be nice to be able to change this later -- to pass in a 
> list of badblocks to, say, fsck (which I think is the original 
> request).  This is especially nice for recovery, if you don't have the 
> luxury of copying a whole disk image to another drive before running 
> fsck.
>
> That's not to say that we should automatically detect and relocate bad 
> blocks during normal operation (while the FS is mounted), but 
> deliberately removing functionality to protect you from yourself isn't 
> the Linux Way.  Linux has a long history of kernel config options that 
> say things like "YOU WILL LOSE DATA. You have been warned."


The linux way is not to review ideas and see if they merit us coding 
them up.  LKML is nothing if not a long list of good/bad/weird ideas 
that get proposed, reviewed and often as not dumped in the dust bin of 
history ;-)  Ideas are good, discussion is great, but we should not 
invest in features that are known to produce a definite failure.

I spend a lot of time monitoring and helping debug file system/disk 
failures on a huge installed base of reiser3 file systems (running on 
sata and pata drives). As part of this, I spend a lot of time talking to 
disk vendors about how and when to pull the plug on bad drives.

ric

