From: Oleg Drokin <green@namesys.com>
Subject: Re: BUG() in _get_block_create_0
Date: Mon, 23 Dec 2002 19:26:02 +0300
Message-ID: <20021223192602.C1645@namesys.com>
References: <3E073A4D.4090704@paradigmashift.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12226-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3E073A4D.4090704@paradigmashift.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nick Wellnhofer <nick@paradigmashift.com>
Cc: reiserfs-list@namesys.com

Hello!

On Mon, Dec 23, 2002 at 05:31:09PM +0100, Nick Wellnhofer wrote:

> I'm using ReiserFS with the old 3.5 format on a web server. The system 
> has been running fine for 2 years. About 1 month ago I upgraded from 
> Linux 2.2.16 to 2.4.18 (SuSE 8.1 default kernel). Some weeks ago I got 
> reiserfs error messages in syslog suggesting a fsck and I had some files 
> which couldn't be accessed or deleted. So last week I ran reiserfsck 
> --rebuid-tree. At first everything worked fine. The problematic files 
> could be accessed again.

What was reiserfsck version?

> After about 3 hours I got an oops report in my syslog, but the system 
> kept running normally. Again 3 hours later the machine crashed with 
> another oops. It turned out that the BUG() in _get_block_create_0 in 
> fs/reiserfs/inode.c was hit both times. According to the value of EAX
>   le_key_k_type (version, key)
> is TYPE_ANY (0x0f) but TYPE_DIRECT (0x02) is expected.

Hm, sounds like FS corruption.

> The machine is a web server in production and I have only remote access, 
> so I couldn't run reiserfsck again.
> Any suggestions?

We'd be interested in metadata snapshot
(debugreiserfs -p /dev/your_device | bzip2 -9c >metadata.bz2).
You probably can even do this on readonly-mounted device.
Probably it will even work on read-write mounted device, but
make sure no much write activity is performed on that fs at the time
of snapshot. Also avoid writing metadata to the same fs you are taking
this metadata from ;)

Bye,
    Oleg
