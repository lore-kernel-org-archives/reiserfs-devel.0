From: Dave Thomas <linuxsense@gmail.com>
Subject: Re: "WARNING: Wrong master super block magic" message on boot only
Date: Sun, 12 Sep 2004 01:02:37 -0700
Message-ID: <676b8ab0409120102326e5b16@mail.gmail.com>
References: <676b8ab0409102026251feacd@mail.gmail.com>
	 <20040911193217.GR6294@backtop.namesys.com>
Reply-To: Dave Thomas <linuxsense@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21700-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040911193217.GR6294@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alex Zarochentsev <zam@namesys.com>
Cc: reiserfs-list@namesys.com

On Sat, 11 Sep 2004 23:32:17 +0400, Alex Zarochentsev <zam@namesys.com> wrote:
> > This message only shows up on boot...if I unmount the partition then
> > mount it again I do not get that error. I ran a 'fsck' on the
> > partition and everything looked OK...output is at end of message. I
> > have re-run 'mkfs.reiser4' on the partition but this did not stop the
> > 'warning' message on boot.
> 
> do you mean that the system could not mount reiser4 volume at boot time?
> or it was only reiser4 warning?


The partition mounts and functions just fine...I just get the warning.
 

> 
> I can only guess that software raid was not started at the moment of first
> attempt to mount it.  


Interesting point. I'll setup the system so the reiser4 volume is
mounted later in the boot.


> Do other fs work well with the same device?


Yes, the ext3 volumes do not give any errors.

Thanks Alex, I appreciate your response.

Dave
