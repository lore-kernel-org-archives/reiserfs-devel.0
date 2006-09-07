From: David Masover <ninja@slaphack.com>
Subject: Re: FEATURE Req: integrate badblocks check into fsck.reiser*
Date: Thu, 07 Sep 2006 12:35:06 -0500
Message-ID: <4500584A.4040601@slaphack.com>
References: <ed9tqo$2tc$1@sea.gmane.org> <200609012250.44548.vs@namesys.com>	<44F8B3C8.1050802@slaphack.com> <edae71$iqf$1@sea.gmane.org> <44F8BE78.1080503@slaphack.com> <44FB925E.2000300@emc.com> <44FE1C04.70800@namesys.com> <44FEE45B.4060607@slaphack.com> <44FFF5DB.3050200@emc.com> <4500472F.7050902@slaphack.com> <4500529F.2040603@emc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29825-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4500529F.2040603@emc.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ric@emc.com
Cc: Hans Reiser <reiser@namesys.com>, Peter <sw98234@hotmail.com>, reiserfs-list@namesys.com

Ric Wheeler wrote:
> David Masover wrote:

>> Why do you presume to make this decision for users?
> 
> It's not a decision that I want to make for users, it is a decision that 
> Hans and his team need to make about how best to spend their limited 
> resources.

Agreed.  It's not important if it takes more than, say, an hour.

> It will also give more users a bad experience with the file system, 
> since users rarely have the in depth knowledge required to make this 
> kind of choice.

While it's true that most users just click through dialog boxes, I 
imagine this would be sufficient:

===WARNING===WARNING===WARNING===
---------------------------------
THIS DISK IS BAD!
If you continue with the format,
we will not help you when you lose data.
When, not if.  You are strongly encouraged to
THROW THIS DISK OUT!
---------------------------------------------
ARE YOU ABSOLUTELY SURE YOU WANT TO CONTINUE?
(yes/no):

And require an actual "yes" or "no" answer.  No "y/n".

Now, compare that to a filesystem which doesn't allow badblocks in mkfs 
at all.  While it's rare, I suspect that would be a worse experience if 
you actually had a real need for it.  If you've got a huge 300 gig drive 
with some bad blocks, you can always throw some stuff on it anyway, for 
backup, or stuff you don't care about, even knowing it'll fail soon.

Again, probably not a high priority item at all, but it certainly won't 
make the user experience worse.  Any user who says "yes" to the above 
warning does not get to complain about their experience.

> Here we mostly agree.  The need for enhanced tools is not to encourage 
> people to keep using bad drives, rather to allow them to fsck & remount 
> a drive for data recovery.  If you cannot mount & fsck fails to repair 
> enough to give you at least a readable file system, then you are in real 
> trouble ;-)
> 
> Also, unlike failing writes, disk read errors are quite often ephemeral 
> and will be self correcting on the next write (you might get an error 
> from dust, etc that gets "swept" clean on the next write).

Either one, I would personally feel quite a lot safer grabbing a disk 
image and doing the fsck once the image was on known good media.

One thing that would be even better here, though, if you don't want to 
spend the time for a huge backup:  A way to tell badblocks to only scan 
space which is actually being used, and then enough free space to make 
sure relocations work.  If you're mounting readonly, you shouldn't care 
about marking every single bad sector in free space.  I guess this would 
require a lot more intelligence from fsck, though -- it would have to be 
able to constantly check for bad blocks, as opposed to just running 
badblocks once and grabbing a list to avoid.
