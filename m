From: Pysiak Satriani <pysiak.satriani@wp.pl>
Subject: Re[4]: reiser4.1
Date: Fri, 4 Mar 2005 20:22:42 +0100
Message-ID: <1144043083.20050304202242@wp.pl>
References: <4461b4b458db80949fe1830f90501153@hotmail.com>
 <1109776277.3504.469.camel@tribesman.namesys.com>
 <42263473.7050900@namesys.com>            <37288019.20050303095520@wp.pl>
 <200503040755.j247tsK0001173@turing-police.cc.vt.edu>
Reply-To: Pysiak Satriani <pysiak.satriani@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200503040755.j247tsK0001173@turing-police.cc.vt.edu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Hello Valdis,

Friday, March 4, 2005, 8:55:52 AM, you wrote:

> IBM's AIX 4.3 and later support LZ compression on their JFS file system.
> I was able to measure a 10-15% speed-up by converting /usr to compressed
> even on a 133MZ Power604e chip because even back then, it was faster to
> read half as many blocks off a SCSI disk and decompress.
Interesting.

> So it's been at least a potential win for a decade or so, assuming your
> filesystem is able to deal well with fragments (you can't really win unless
> you take a 4K or so logical block, compress it to some number of 512-byte
> chunks, and then store the resulting chunks cheaply - JFS does the
> blocks-and-frags efficiently, so it's easy to win.
I wonder if NTFS compression does it well... I was always scared of
compression on NTFS because of possible slowdowns and just the fact that
compression adds another level of complexity to all reads/write and
possible future recovery if something breaks down.

-- 
Best regards,
Maciej


