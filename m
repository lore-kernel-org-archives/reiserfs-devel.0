From: "Raymond A. Meijer" <raymond@internet.gr>
Subject: Re: Serious problem after lvextend and resize_reiserfs
Date: Fri, 11 Jul 2008 11:35:28 +0300
Message-ID: <200807111135.28881.raymond@internet.gr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Content-Disposition: inline
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

On Thu 10 Jul 2008 15:41, Raymond A. Meijer wrote:

Hello again,

> My partition was filling up, and I wanted to resize it, like I've done
> dozens of times. But something went wrong this time:
>
> root@home:~# resize_reiserfs -s +4G /dev/system/lvm01
> reiserfs_open: the reiserfs superblock cannot be found on
> /dev/system/lvm01.
>
> Oops! :(

Oops indeed...

User error: hit any user to continue.

/dev/system/lvm01 was a Reiser4 partition, not ReiserFS... :X :X :X

Unbelievably enough: fsck.reiser4 --build-sb and fsck.reiser4 --build-fs fixed 
it and everything is back! :-D

Respect... _O_

Now, when was that Reiser4 resizer coming out? ;)

I really hope somebody else will continue this project after what happened 
with Hans, because both ReiserFS and Reiser4 have been working really well 
here for years...


Thank you for your time,

Ray

-- 
You cannot discover new oceans unless
you have the courage to lose sight of
the shore

