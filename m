From: "Felix E. Klee" <felix.klee.reiserfs@gmx.net>
Subject: Re: ReiserFS on a USB memory stick?
Date: Tue, 7 Oct 2003 16:04:22 +0200
Message-ID: <20031007160422.49fc53a6.felix.klee.reiserfs@gmx.net>
References: <20031003122455.1faa32fa.felix.klee.reiserfs@gmx.net>
	<3F7DACAD.4060102@namesys.com>
	<20031003232435.5ec10a67.felix.klee.reiserfs@gmx.net>
	<3F7E518E.3060301@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15802-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3F7E518E.3060301@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hans Reiser <reiser@namesys.com>
Cc: reiserfs-list@namesys.com, prt@gnu.org

On Sat, 04 Oct 2003 08:50:22 +0400 Hans Reiser wrote:
> >Finally: Do you have an idea which common LINUX file system
> >distributes writes best (this includes writes to inode-tables, etc.)?
> >You mentioned FAT before, but this is not really usable for running
> >LINUX on it (other than with UMSDOS or some such thing).
> 
> No no, FAT DOES NOT distribute writes, which is why if FAT is used on 
> something you know it must use wear leveling (or it is a piece of
> trash).

Ah, I misunderstood your reply to my original message. I thought you
were referring to the fact that files in a FAT based system get
fragmented fast and therefore data gets distributed (which actually
doesn't matter since the file allocation table is probably the
most problematic part).

> I suggest you simply ask your manufacturer if your stick does wear 
> leveling.  It most likely does.

I just got answers from TwinMOS international and German technical
support. One said that all their sticks use wear leveling technology,
the other said, more specifically, that it uses so called "random write"
technology. 

So, I guess it doesn't really matter what file system I use if I want to
minimize the wear on the stick. 

BTW, as I'm running LINUX on the stick, it might be a good idea to
backup, erase and restore the entire data on the stick once in a while.
Due to wear leveling technology this might interchange the physical
position of areas with rewritable data (/home, /var, etc.) and areas
with read-only data (/usr, etc.). This might also be a good chance to
try out different file systems ;)

Felix


-- 
To contact me off list don't reply but send mail to
    felix DOT klee AT inka DOT de
Otherwise your email to me might get automatically deleted!
