From: Yury Umanets <umka@namesys.com>
Subject: Re: Bug in reiserfsck 3.6.5
Date: Wed, 09 Apr 2003 14:09:23 +0400
Message-ID: <3E93F153.9060608@namesys.com>
References: <200304090557.29034.kelledin+RFS@skarpsey.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13621-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200304090557.29034.kelledin+RFS@skarpsey.dyndns.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Kelledin (by way of Kelledin <kelledin+RFS@skarpsey.dyndns.org>)" <kelledin@users.sourceforge.net>
Cc: reiserfs-list@namesys.com

Kelledin (by way of Kelledin) wrote:

>(I'd send this directly to Yura, but I'm having a bit of trouble 
>getting mail through.  Twice it's bounced off the 
>namesys.botik.ru mailserver as suspected spam, and when I 
>finally employ a mailertable trick, namesys.botik.ru no longer 
>resolves.  I think some angry god is conspiring against me and 
>my bug report...)
>
>I recently found that when installing reiserfsprogs with
>/sbin/fsck.reiserfs symlinked to reiserfsck, fsck.reiserfs
>generates a SIGABORT when called as an fsck backend via "fsck -a
>-A -C -T" (fairly common command used in some system boot
>scripts).  It was quite interesting to troubleshoot, as the
>problem _didn't_ occur if I turned fsck.reiserfs into a wrapper
>script, or called "fsck.reiserfs -a /dev/sda14" directly from
>the bash prompt...
>
>I traced it down to this line in lib/io.c:
>
>--
>void flush_buffers (dev_t dev)
>{
>    if (!dev)
>        die ("flush_buffers: device is not specifed");
>        ^^^^^
>--
>
>I'm fairly certan what is happening is that when fsck calls the
>fsck.reiserfs backend, it's closing all default stream
>descriptors (stdin, stdout, stderr) before exec'ing it.  So if
>fsck.reiserfs opens the device file (/dev/sda14) before anything
>else, then fs->dev_t gets a descriptor value of zero.  This
>eventually trickles down to flush_buffers(), which thinks
>something is wrong with this and croaks.
>
>(This is obviously incorrect thinking on the part of
>flush_buffers().  Having a general-purpose file descriptor with
>a value of 0 is unusual, but not really incorrect.)
>
>When reiserfsck is called directly from the shell prompt, or is
>executed via a wrapper script, it actually gets its own
>stdin/stdout/stderr sitting on descriptors 0/1/2 and thus
>doesn't trip over this bug.  So creating a wrapper script works
>as a quick band-aid fix.
>
>The proper solution is to change the flush_buffers() way of
>thinking; the attached patch might be enough.  Or it might not 
>be.  If some other bit of code is actually setting fs->fs_dev to 
>0 to signify a real error condition, then a real fix is going to 
>require more far-reaching changes.
>
>--
>Kelledin
>"If a server crashes in a server farm and no one pings it, does
>it still cost four figures to fix?"
>  
>
Can you try last pre reiserfsprogs 
ftp://ftp.namesys.com/pub/reiserfsprogs/pre/reiserfsprogs-3.6.6-pre1.tar.gz 
please. It seems this bug fixed yet.

-- 
Yury Umanets 
"We're flying high, we're watching the world passes by..."



