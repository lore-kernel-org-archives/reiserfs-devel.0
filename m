From: maciejej@msoe.edu
Subject: Re: AMD64 testing
Date: Wed, 22 Dec 2004 13:22:45 -0600 (CST)
Message-ID: <63258.68.255.59.159.1103743365.squirrel@www.msoe.edu>
References: <20041222131123.GW26192@nysv.org>
    <b65fbb130412220603d6a333d@mail.gmail.com>
    <20041222184058.GX26192@nysv.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-22886-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20041222184058.GX26192@nysv.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Markus =?iso-8859-1?Q?T=F6rnqvist?= <mjt@nysv.org>
Cc: Sander Sweers <sander.sweers@gmail.com>, reiserfs-list@namesys.com

> On Wed, Dec 22, 2004 at 03:03:49PM +0100, Sander Sweers wrote:
>>
>>I will get an AMD64 soon (hopefully this year) and will run 64bit
>>Gentoo on it. How has it been running overall, is it workable and not
>
> For the record, Ubuntu Warty/Universe here with some random stuff
> pulled from Hoary.
>
>>crashing like every 5 minutes? Just want to get an idee because I can
>>then decide of I will go with Reiser4 root from the start or test on
>>separate partitions.
>
> I had crashing, but it was due to faulty hardware ;)
>
> Seriously I haven't had any issues with my /home/mjt/ as Reiser4
> so far. Tuxracer did crash once trying to open some .sav file,
> but I was stupid and just deleted the file :P

I've had reiser4/AMD64, root and all, last for days without crashing.
Eventually I noticed that it always seemed to crash when working with a
large file and small files at the same time. To replicate this usage
pattern, I'd dd a huge file from /dev/zero while compiling a kernel. The
kernel compilation is a good way of testing for corruption, too. If the
source fails to build after a crash, it's probably corrupt and you can
check your md5sums. Anyway, I've been running the following two commands
from a kernel source tree simultaneously:

for i in `seq 1 20` ; do make mrproper ; zcat /proc/config.gz > .config ;
make ; echo $i ; done

for i in `seq 1 5` ; do dd if=/dev/null of=large_file bs=1M count=20k ; rm
large_file ; echo $i ; done

Eventually, these two commands always cause a hard lock, or with debugging
enabled, a panic. I get the same results if dd runs on a different
filesystem on the same drive. Either command alone runs many iterations
with no signs of stopping, and both commands run on any other filesystem
simultaneously.

>
>>And if I can help in any way please let me know!
>
> Ditto.
>
> --
> mjt
>
>

