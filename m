From: Tom Epperly <tomepperly@attbi.com>
Subject: Re: reiserfs keeps failing fsck suggested reiserfsck --rebuild-sb
Date: Sun, 27 Apr 2003 20:48:39 -0700
Message-ID: <1051501719.708.1.camel@sarantium>
References: <1051501483.850.22.camel@sarantium>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-list-return-13839-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-reply-to: <1051501483.850.22.camel@sarantium>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

I neglected to mention that I am running on a self-compiled 2.4.20
kernel with Debian patches applied (i.e., it's based on the
kernel-source-2.4.20 debian package).

On Sun, 2003-04-27 at 20:44, Tom Epperly wrote:
> I have a Debian Unstable Linux system running on a fairly generic
> Pentium III box with two IDE drives. I've been running with my root
> partition as ext2 and reiserfs for all my other partitions for many
> months. I don't remember when I actually made the switch.
> 
> I recently upgraded to reiserfsprogs 3.6.6-1 via the normal "apt-get
> update ; apt-get upgrade". Since then, fsck has been failing when I
> reboot. I've tried running "reiserfsck --rebuild-sb" as directed, but I
> get the same message again when I reboot.
> 
> My of my dialog with the Debian maintainer is here:
> http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=190963
> 
> I get this message:
> sarantium:/home/tepperly# fsck /dev/hda11
> fsck 1.33 (21-Apr-2003)
> <--------reiserfsck 3.6.6, 2003-------->
>  
>   *************************************************************
>   ** If you are using the latest reiserfsprogs and  it fails **
>   ** please  email bug reports to reiserfs-list@namesys.com, **
>   ** providing  as  much  information  as  possible --  your **
>   ** hardware,  kernel,  patches,  settings,  all reiserfsck **
>   ** messages  (including version),  the reiserfsck logfile, **
>   ** check  the  syslog file  for  any  related information. **
>   ** If you would like advice on using this program, support **
>   ** is available  for $25 at  www.namesys.com/support.html. **
>   *************************************************************
>  
> Will read-only check consistency of the filesystem on /dev/hda11
> Will put log info to 'stdout'
>  
> Do you want to run this program?[N/Yes] (note need to type Yes if you
> do):Yes
>  
> reiserfs_open_journal: journal parameters from the super block does not
> match
> to journal parameters from the journal. It is expected if you created
> your fs
> with old reiserfsprogs. In this case rebuild-sb will fix it all for you.
>  
> Either make journal partition available or use --no-journal-available
> If you have the standard journal or if your partition is available
> and you specified it correctly, you must run rebuild-sb.
> sarantium:/home/tepperly#
> 
> I've run reiserfsck --rebuild-sb on all the reiserfs partitions. It
> never says anything to indicate that it did or didn't do anything. It
> would be nice to see something like "super block updated" or "no change
> needed", but that's kind of beside the point.
> 
> When I reboot after running reiserfsck --rebuild-sb on all the reiserfs
> partitions, it fails in fsck in the same way with the same message. It
> is as though reiserfsck isn't doing anything or is not doing the right
> thing.
> 
> The Debian developer suggested that I write to this mailing list for
> suggestions.
> 
> Regards,
> 
> Tom
-- 
Tom Epperly <tomepperly at attbi dot com>

