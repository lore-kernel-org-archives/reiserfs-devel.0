From: Bernd Niederberger <bernd.niederberger@gmx.net>
Subject: Re: out of disk space
Date: Thu, 30 Oct 2003 22:37:32 +0100
Message-ID: <200310302237.32567.bernd.niederberger@gmx.net>
References: <200310280216.43709.Bernd.Niederberger@gmx.net> <200310281355.46512.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15944-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200310281355.46512.vitaly@namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com
Cc: Vitaly Fertman <vitaly@namesys.com>

Am Dienstag, 28. Oktober 2003 12:02 schrieb Vitaly Fertman:
> On Tuesday 28 October 2003 04:16, Bernd Niederberger wrote:
> > Hello,
>
> Hi,
>
> > I have a big problem. I can't access my data on /dev/hda4.
> > First I got an error out of disk space therefore I deleted some big mpg
> > files to get space. But after reboot I got the same error but I knew
> > there
>
> you mean you removed the file, nothing strange happened, you reboot the
> computer and after that there was no space on the disk again?
>
> What kernel version do you use? Some patches? Do you see anything
> related in the syslog?
>
> > should be some gig free space. Reiserfsck --fix-fixable /dev/hdb4 didn't
> > help. Then I tried reiserfsck --rebuild-tree --scan-whole-partition
> > /dev/hdb4 with the following problem:
>
> why did you use --scan-whole-partition? have you read man page about it?
> you should have run just
>    reiserfsck --rebuild-tree /dev/hdb4
> try it now, it should solve the problem. If not, email us about it.
Thank you!
I hav created a new partition an copied from /dev/zero to the new partition. 
After this I copied the damaged partition with dd to the new partition and 
did the steps you told to do - and it worked.

regards
Bernd

