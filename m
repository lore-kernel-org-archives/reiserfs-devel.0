From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: out of disk space
Date: Tue, 28 Oct 2003 14:02:50 +0300
Message-ID: <200310281355.46512.vitaly@namesys.com>
References: <200310280216.43709.Bernd.Niederberger@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15917-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200310280216.43709.Bernd.Niederberger@gmx.net>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Bernd Niederberger <Bernd.Niederberger@gmx.net>
Cc: Reiserfs mail-list <Reiserfs-List@Namesys.COM>

On Tuesday 28 October 2003 04:16, Bernd Niederberger wrote:
> Hello,

Hi, 

> I have a big problem. I can't access my data on /dev/hda4.
> First I got an error out of disk space therefore I deleted some big mpg
> files to get space. But after reboot I got the same error but I knew there

you mean you removed the file, nothing strange happened, you reboot the
computer and after that there was no space on the disk again? 

What kernel version do you use? Some patches? Do you see anything 
related in the syslog?

> should be some gig free space. Reiserfsck --fix-fixable /dev/hdb4 didn't
> help. Then I tried reiserfsck --rebuild-tree --scan-whole-partition
> /dev/hdb4 with the following problem:

why did you use --scan-whole-partition? have you read man page about it?
you should have run just
   reiserfsck --rebuild-tree /dev/hdb4
try it now, it should solve the problem. If not, email us about it.

-- 
Thanks,
Vitaly Fertman
