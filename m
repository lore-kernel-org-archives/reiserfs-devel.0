From: Matthias Andree <ma@dt.e-technik.uni-dortmund.de>
Subject: Re: Congratulations! we have got hash function screwed up
Date: Thu, 30 Dec 2004 13:40:53 +0100
Message-ID: <m38y7gx8kq.fsf@merlin.emma.line.org>
References: <77912E9FD42896419D1CEF15E1C397A58AFCF1@london.jaguarfreightservices.local>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-22947-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <77912E9FD42896419D1CEF15E1C397A58AFCF1@london.jaguarfreightservices.local>
	(Yiannis Mavroukakis's message of "Thu, 30 Dec 2004 11:52:58 -0000")
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Yiannis Mavroukakis <yiannis@jaguarfreight.com>
Cc: reiserfs-list@namesys.com

"Yiannis Mavroukakis" <yiannis@jaguarfreight.com> writes:

> Your "proven" reasoning sounds a bit strange to me..Microsoft (aka
> major distributor at least in my books) had her filesystems "in the
> field" for ages, does this prove any of them good (or bad for that
> matter)?

My reasoning mentioned a /required/, but not a /sufficient/ criterion.

In other words: not before it is proven in the field will I consider it
for production use.

Remember the Linux 2.2 reiserfs 3.5 NFS woes?
Remember the early XFS-NFS woes?

These are all reasons to avoid a shiny new file system for serious work.

> I don't think I'd wait for a distributor to shove reiser4 down my
> throat, just because the distributor seems to trust it, so the logical
> course would be for me to try it out. I'll grant you that I am not
> using it on the mission critical server, because our hosting provider
> will not support it (ext3 addicts..oh well)

For practical recovery reasons (error on root FS after a crash), ext3fs
is easier to handle. You can fsck the (R/O) root partition just fine
(e2fsck then asks you to reboot right away); for reiserfs, you'll have
to boot into some emergency or rescue system...

> but I do have it on my development server, that does house critical
> code and receives all kinds of hammering from yours truly; And I use
> it at home.

I reformatted my last "at home" reiserfs an hour ago and unloaded the
reiserfs kernel module, as the way how Hans has responded to the error
report is inacceptable.

Anyone is free to choose the file system, and as the simple
demonstration code posted earlier shows a serious flaw in reiserfs,
Hans's response was boldfaced, I ditched reiserfs3. End of story.

-- 
Matthias Andree
