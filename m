From: Oleg Drokin <green@namesys.com>
Subject: Re: Stress test failure for reiserfs, but ext3 ok on Linux 2.4.20
Date: Wed, 15 Jan 2003 13:43:15 +0300
Message-ID: <20030115134315.A31068@namesys.com>
References: <20030115023559.GA14694@mathematik.uni-bielefeld.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12356-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030115023559.GA14694@mathematik.uni-bielefeld.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Bernhard Sadlowski <sadlowsk@mathematik.Uni-Bielefeld.DE>
Cc: reiserfs-list@namesys.com

Hello!

On Wed, Jan 15, 2003 at 03:35:59AM +0100, Bernhard Sadlowski wrote:

> I am using the attached stess.sh script (probably from this mailinglist)
> for creating load on a reiserfs filesystem, which forks 100
> (read,write,delete) processes: 
> # mkreiserfs /dev/sda4
> # mount /dev/sda4 /backup
> # stress.sh -c /usr -n 100 /backup 
> Then wait until /backup fills up.

Hm. This resembles me something.
Can you reproduce the same problem if you apply patches from
ftp://ftp.namesys.com/pub/reiserfs-for-2.4/testing/quota-2.4.20/
These patches add quota support to reiserfs, but also change some
new inode-related operation to prevent deadlocks like you are seeing.

> Any I/O freezes and even after killing the script, the remaining cp and
> mv commands don't terminate. They are in status "D". A simle "ls
> /backup" never comes back. Only a hard powerdown fixes this situation,
> because "init 6" etc. doesn't work. I have even activated the reiserfs
> debug, but I don't see any additional info.

Try executing sysrq-t after the lockup happens, then send us decoded output
plese.

Thank you.

Bye,
    Oleg
