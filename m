From: Matt Stegman <matts@ksu.edu>
Subject: Re: Need help recovering lost partitions
Date: Wed, 28 Jan 2004 17:22:46 -0600 (CST)
Message-ID: <Pine.GSO.4.44L.0401281653030.29593-100000@unix1.cc.ksu.edu>
References: <20040128143848.27765.h003.c001.wm@mail.ngenllc.com.criticalpath.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-16643-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040128143848.27765.h003.c001.wm@mail.ngenllc.com.criticalpath.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: dan@ngenllc.com
Cc: reiserfs-list@namesys.com

Hmmm.

It seems that mkreiserfs leaves the first 64kB of the partition blank.
The magic is "ReIsEr2Fs", and it is bytes 53 - 61 in the 17th block (the
filesystem blocksize being 4kB).

I imagine there's a GUID in the superblock you could also look at, but
I'll have to go looking for the format.  This is just gleaned from
`od -c /dev/hda1`.

So the quickly written, but slowly executed way to find this is
(nnn is the number of 4kB blocks your disk has):

for n in `seq 0 nnn`; do
  magic=`dd if=/dev/hda bs=1 skip=$((4096 * $n + 52)) count=9 2>/dev/null`
  if [ "$magic" == "ReIsEr2Fs" ]; then
    echo Block $n \(sector $(($n * 8))\) is Reiserfs magic block
  fi
done

If you're good with C, you could probably whip up a single program to do
this which will work much faster (doesn't have the overhead of starting
new processes to read each block).

Now each of the listed sectors in the output (minus 64kB; remember the
blank spot) could be a starting sector for the filesystem.  You should
have some idea how big your partitions were; do some math to figure out if
any numbers are unlikely to be the right blocks.

This isn't a complete answer for your problem.  I may have skipped
over some things that I assume you know already.  And, of course, I may
just be wrong.

And never underestimate which blocks may have been overwritten.  Even if
you do manage to locate and recreate all your old partitions, you may not
be able to get any data back.  And as Phil said, you should work from a
backup; if at all possible, STOP WRITING TO THE ORIGINAL DISK.

There may even be data recovery places who do this sort of thing
professionally.

-- 
Matt Stegman



On Wed, 28 Jan 2004 dan@ngenllc.com wrote:

> So how can I scan the partition for the old
> superblocks?  gpart and parted weren't picking them up,
> but I know they were there.  And the 6GB of data it
> found is much less then the size of the partition
> (50GB), which makes me think that some data might still
> be there (i.e. only 100 * (6/50) % of the data could
> have been overwritten).
>
> -Dan


