From: "Felix E. Klee" <felix.klee.reiserfs@gmx.net>
Subject: Re: ReiserFS on a USB memory stick?
Date: Fri, 3 Oct 2003 23:24:35 +0200
Message-ID: <20031003232435.5ec10a67.felix.klee.reiserfs@gmx.net>
References: <20031003122455.1faa32fa.felix.klee.reiserfs@gmx.net>
	<3F7DACAD.4060102@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15780-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F7DACAD.4060102@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Fri, 03 Oct 2003 21:06:53 +0400 Hans Reiser wrote:
> >I want to run LINUX on a 512MB USB memory stick that supports a
> >minimum of 100,000 rewrites. I'll mostly be running an EMACS session
> >with Preview-Latex where I'll be editing and compiling TeX files.
> >Note that I don't care if the stick fails after 3 months, but it
> >should last about that long.
> >
> >Is ReiserFS a suitable file system for that kind of application or
> >are there better systems? Are there some ways to tune caching so that
> >data isn't written to the stick as often as it could?
> >
> >BTW, I already found JFFS2 but it seems to be made for direct access
> >to flash hardware, while a USB memory stick emulates a hard disk or
> >floppy super drive.
>
> Compact flash does wear leveling in hardware, 

AFAIK, only the expensive ones do.

> I don't know about
> memory sticks.  If people use the FAT filesystem on them, then almost
> surely  they do also.;-)

I guess not - it's mentioned neither on the packaging nor in the
specifications at
    http://www.twinmos.com/flash/flash_p_mobile_usb20.htm#s


> If there is wear leveling, reiserfs will work.  You might want to
> reduce the journal size a bit though.

I'm a newbie to the internals of file systems so I don't see what would
be the advantage of that other than using less space. Could you tell me
why making the journal size smaller would be an improvement?

BTW, I read on
   http://freshmeat.net/articles/view/212/ 
that the journal isn't cached. Is this really true? If so this would
probably render ReiserFS totally unusable for a flash memory
(even with wear leveling) because there would be far to many accesses.

However, I wonder if other file systems are much better even if they
cache all disk writes. The problem that I see is that there probably are
always parts on the disk that are used for maintainance (e.g. an
inode-table) that get written to over and over again.

But this problem can be somewhat improved to my liking by proper
caching of write accesses. I need a solution where data is written not
more than once to the same sector in less than, say, a minute. Is such a
solution feasible, i.e. are there file systems that cache all write
accesses? Or is this not a question of file systems at all, i.e. is
caching done by LINUX on a layer between the block device and the file
system(if so, this would answer my caching questions above)?

Finally: Do you have an idea which common LINUX file system distributes
writes best (this includes writes to inode-tables, etc.)? You mentioned
FAT before, but this is not really usable for running LINUX on it (other
than with UMSDOS or some such thing).

Felix

-- 
To contact me off list don't reply but send mail to
    felix DOT klee AT inka DOT de
Otherwise your email to me might get automatically deleted!
