From: Edward Shishkin <edward@namesys.com>
Subject: Re: reiser4 mount options
Date: Sun, 23 Dec 2007 17:12:50 +0300
Message-ID: <476E6CE2.7030004@namesys.com>
References: <14476466.post@talk.nabble.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <14476466.post@talk.nabble.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: butdiene <butdiene@yahoo.com>
Cc: reiserfs-devel@vger.kernel.org

butdiene wrote:

>Hi,
>
>I run reiser4 on a laptop. I got serious fsync/flush problem.
>
>almost randomly, the hard drive would run busy for minutes to dozens of
>minutes. while the computer is still responsive during this period, but
>firefox would hang until the hard gets idle again.
>  
>

Hm.. firefox is fsync-bound app?

>I guess I can set mount options to improve the situation.
>  
>

That hang can have a complex nature.

Well, try to play with the mount option "tmgr.atom_max_size=N",
where N is atom size in blocks (by default it is total RAM pages / 4).
Look at /proc/mounts to make sure that your changes take effect.

If it doesn't help, then let me know.

Thanks,
Edward.

>Any suggestion is appreciated.
>
>thanks
>  
>

