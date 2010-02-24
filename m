From: Christian Kujau <lists@nerdbynature.de>
Subject: Re: reiserfs issue with 2.6.32.8
Date: Tue, 23 Feb 2010 23:03:49 -0800 (PST)
Message-ID: <alpine.DEB.2.01.1002232249440.28195@bogon.housecafe.de>
References: <dda83e781002141023t2abe95b8w83f59d6f411f68a2@mail.gmail.com>  <alpine.DEB.2.01.1002142229470.28195@bogon.housecafe.de> <dda83e781002232131i53b59c8eu7192257fc4e4f3e0@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <dda83e781002232131i53b59c8eu7192257fc4e4f3e0@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bret Towe <magnade@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, reiserfs-devel@vger.kernel.org

On Tue, 23 Feb 2010 at 21:31, Bret Towe wrote:
> ok attached is strace log of cp on 2.6.32.9

I've run cp through strace as well (copying something from an XFS 
partition to a reiserfs partition, I guess that's what you did too), and 
noticed a small difference at the end:

< open("/home/foo/1", O_RDONLY)          = 3
< fstat(3, {st_mode=S_IFREG|0640, st_size=755, ...}) = 0
< open("2", O_WRONLY|O_CREAT|O_EXCL, 0640) = 4         

While your cp(1) did:

> open("downloads/[DB]_Bleach_258_[27104F7A].avi", O_RDONLY) = 3
> fstat(3, {st_mode=S_IFREG|0644, st_size=178308328, ...}) = 0
> open("/mdhd/media/Episodes/unwatched/[DB]_Bleach_258_[27104F7A].avi", O_WRONLY|O_CREAT|O_EXCL, 0644) = -1 EINVAL (Invalid argument)


And open(2) will return -EINVAL when:
   - The implementation does not support synchronised I/O for this file. 
   - The value of the oflag argument is not valid.

As we're not passing O_SYNC, it's the latter, if I read this correctly. Which
still doesn't explain *why* (the filesystem?) returns "invalid flag". 

> now I've had a hd drop out of raid (running checks on it atm)

Hm, maybe it's all hardware related after all, let's see what these checks 
turn up. Strange though, that nothing gets reported in dmesg...

Christian.
-- 
BOFH excuse #159:

Stubborn processes
