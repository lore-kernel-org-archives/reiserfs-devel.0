From: Hans Reiser <reiser@namesys.com>
Subject: Re: ReiserFS on a USB memory stick?
Date: Sat, 04 Oct 2003 08:50:22 +0400
Message-ID: <3F7E518E.3060301@namesys.com>
References: <20031003122455.1faa32fa.felix.klee.reiserfs@gmx.net>	<3F7DACAD.4060102@namesys.com> <20031003232435.5ec10a67.felix.klee.reiserfs@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15784-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20031003232435.5ec10a67.felix.klee.reiserfs@gmx.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Felix E. Klee" <felix.klee.reiserfs@gmx.net>
Cc: reiserfs-list@namesys.com, prt@gnu.org

Felix E. Klee wrote:

>
>I'm a newbie to the internals of file systems so I don't see what would
>be the advantage of that other than using less space.
>
none

> Could you tell me
>why making the journal size smaller would be an improvement?
>
>BTW, I read on
>   http://freshmeat.net/articles/view/212/ 
>that the journal isn't cached. Is this really true?
>
Not at all.  All journaling file systems cache the journal, with the 
possible exception of NTFS whose performance sucks.

Also, preserve lists were replaced in ReiserFS by the journaling code 
many years ago.  Maybe I should work on updating our website today, and 
displace all the V3 docs with V4 docs....

In my benchmarks at least, ext3 performs better than XFS except for very 
large files and large directories.

> If so this would
>probably render ReiserFS totally unusable for a flash memory
>(even with wear leveling) because there would be far to many accesses.
>
>However, I wonder if other file systems are much better even if they
>cache all disk writes. The problem that I see is that there probably are
>always parts on the disk that are used for maintainance (e.g. an
>inode-table) that get written to over and over again.
>
>But this problem can be somewhat improved to my liking by proper
>caching of write accesses. I need a solution where data is written not
>more than once to the same sector in less than, say, a minute. Is such a
>solution feasible, i.e. are there file systems that cache all write
>accesses? Or is this not a question of file systems at all, i.e. is
>caching done by LINUX on a layer between the block device and the file
>system(if so, this would answer my caching questions above)?
>
>Finally: Do you have an idea which common LINUX file system distributes
>writes best (this includes writes to inode-tables, etc.)? You mentioned
>FAT before, but this is not really usable for running LINUX on it (other
>than with UMSDOS or some such thing).
>

No no, FAT DOES NOT distribute writes, which is why if FAT is used on 
something you know it must use wear leveling (or it is a piece of trash).

I suggest you simply ask your manufacturer if your stick does wear 
leveling.  It most likely does.

>
>Felix
>
>  
>


-- 
Hans


