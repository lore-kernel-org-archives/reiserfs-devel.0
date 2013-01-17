From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Further work on reiser4: discard support and performance issues
Date: Thu, 17 Jan 2013 17:39:02 +0100
Message-ID: <50F82926.8020605@gmail.com>
References: <1856576.kOCPiaH0RB@intelfx-laptop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:message-id:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=xCPDp3WyhFyA52njRgh8qKlr7yTAtddjLyanQ+JHeYk=;
        b=Ku0tecWCHU1Hb9Ggw5dw6f64q7bGNbQv1K2whjAwPWStO1zZnyPMvHuiavWW2XnnAi
         AFurau2rWCVsnLsLGckFbg8TCwO5Gwf2FG+Qt3sXsKtKuPCEJnOfnJM3HH2rO/PYFqAC
         HaMy2CZhBpTInJBiuYYyfHE5NBlyWbSWN6UlwIHNxkePPmZXHhXn8953FYQnaBmOVkkG
         c+luojauy3I92ePDzZBQXb6Nd6l8D2vk+u+znKonQFjTOQWxeHBIQBJ6ml2zcUqq8hQZ
         S9PdlZZmzRHC+yDeUebxZtKyYUH8w6nq1PM2ydZPjEr9nQ5LIYGwi4GaRk9W5wMEIMry
         lHNg==
In-Reply-To: <1856576.kOCPiaH0RB@intelfx-laptop>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: reiserfs-devel@vger.kernel.org

On 01/07/2013 02:42 AM, Ivan Shapovalov wrote:
> Hi again Edward,

Hello.

>
> Here's what I want to try to do with reiser4 in meantime. I'd appreciate some
> hints on that all...
>
> So, first thing I'd like to implement is TRIM/discard support, both online
> (via -o discard) and in a separate FITRIM ioctl().
> That's just because I've got an SSD two days ago and thus now have to use in
> rootfs some discard-aware fs like ext4.


I think it would be nice for beginning. Moreover, reiser4 still doesn't
have any setup optimal for SSD.

Unfortunately I don't have a ready proposal for TRIM/discard support in
reiser4.

I have ready proposals for the following features (they can be rather
complicated for the beginners though):

1) Repacker (On-line defragmentation);
2) Support of different transaction models:
     a. pure journalling;
     b. pure COW (Copy-On-Write);
     c. smart (the current "mixed" one);
     d. no transaction support (for people with UPSs);
3) Subvolumes (AKA "chunkfs");
4) Snapshots.

>
> And then I want to do something with performance: sometimes during heavy I/O
> to a slow /home storage (especially when it's multithreaded) many processes,
> including the DE, just get stuck in "D" state and sit there for a minute or
> two with load average of apx. 5.5 (on a hyperthreaded 2-core CPU).


and some process waits for fsync() completion?


>
> For the first, I can look into other filesystems' implementations, but I'll
> probably be unsure at which layer to put the actual discard call (in order not
> to break reiser4's transactional nature).


If you decide to proceed with TRIM/discard support, you will need to
prepare the proposal by yourself. Let's start with some background,
that is:
. clarify underlying reasons (specific for SSD geometry?) of
   TRIM/discard support: why do we need such support on the file
   system layer;
. review of existing hardware and software means for such support;
. etc..

And yes, it would be nice to review existing TRIM/discard support
implementations in other file systems (say, ext4).

Once we figure out, what bits of reiser4 you should understand
perfectly to implement TRIM/discard support, I'll provide you with
respective hints.


> And for the second, I just don't know why does that happen. Can it be due to
> some r4-specific things/issues or that's just a horribly slow random access
> speed of my hw?

Which hw? SSD?

I also remember complaints that umount (i.e. the final sync takes 2-3,
or even more minutes). It looks like in some cases reiser4 accumulates
too much dirty stuff..

It would be nice to periodically dump some info about atoms (current
number of all atoms, size of each atom, etc) to see the full picture of
their evolution during such freezing. I think, it makes sense to port
the old reiser4 profiling stuff, and populate it with more info (if
needed).

Also there is an oldest issue:
The following (old) benchmarks created with mongo(*) test suit show x2
advantage of reiser4 against reiserfs(v3) on CREATE phase (let's
consider only this phase for simplicity):

http://web.archive.org/web/20061113154648/http://www.namesys.com/benchmarks.html

I've made similar benchmarks with latest 2.6 kernels (sorry, lost the
results) and found that the advantage has disappeared (real time in
CREATE phase is the same as of reiserfs, or even worse). It shouldn't
be so: it indicates that something wrong is going on.. I remember
people complained on the performance drop in reiser4 long time ago, but
didn't have a chance to investigate this.

The straightforward way to narrow down the problem changeset is to
bisect starting from 2.6.8-mm2, the archives can be found here:
http://mirror.sit.wisc.edu/pub/linux/kernel/people/akpm/patches/2.6/
http://ftp.icm.edu.pl/packages/linux-reiserfs/reiser4-for-2.6/
http://mirror.sit.wisc.edu/pub/linux/kernel/people/edward/reiser4/reiser4-for-2.6/
However, it can be rather painful and requires a separate machine.

Thanks,
Edward.

(*) 
http://sourceforge.net/projects/reiser4/files/reiser4-utils/bench-stress-tools/
