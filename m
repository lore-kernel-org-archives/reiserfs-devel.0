From: "David R. Bergstein" <dbergstein@comcast.net>
Subject: Re: reiserfsck question - session results
Date: Mon, 29 Jul 2002 00:43:08 -0400
Message-ID: <0GZZ00FN7UFXM0@mtaout06.icomcast.net>
References: <0GZZ00C5ZQAFLJ@mtaout05.icomcast.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <reiserfs-list-return-11089-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <0GZZ00C5ZQAFLJ@mtaout05.icomcast.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list <reiserfs-list@namesys.com>

It turned out there was no problem after I ran reiserfsck, it was an 
initscript issue, specifically in /etc/rc.d/rc.sysinit on Mandrake 8.1.  The 
script assumes that the root filesystem is first mounted read-only, however I 
had previously taken steps to ensure that this reiserfs partition is mounted 
read-write so journal replays work correctly.  This resulted in the boot time 
message about the root filesystem not being cleanly unmounted.

For the benefit of others in similar situations, I changed the following 
lines to check for reiserfs in /proc/mounts:

[dbergst@rebel rc.d]$ diff -C 4 rc.sysinit rc.sysinit.original
*** rc.sysinit  Mon Jul 29 00:28:13 2002
--- rc.sysinit.original Tue Oct 16 14:25:51 2001
***************
*** 378,387 ****
  }

  _RUN_QUOTACHECK=0
  ROOTFSTYPE=`grep " / " /proc/mounts | awk '{ print $3 }'`
! if [ -z "$fastboot" -a "$ROOTFSTYPE" != "nfs" ] && \
!    [ -z "$fastboot" -a "$ROOTFSTYPE" == "reiserfs" ]; then

          gprintf "Checking root filesystem\n"
        Fsck -T -a $fsckoptions /

--- 378,386 ----
  }

  _RUN_QUOTACHECK=0
  ROOTFSTYPE=`grep " / " /proc/mounts | awk '{ print $3 }'`
! if [ -z "$fastboot" -a "$ROOTFSTYPE" != "nfs" ]; then

          gprintf "Checking root filesystem\n"
        Fsck -T -a $fsckoptions /

On Sunday 28 July 2002 11:13 pm, David R. Bergstein wrote:
> Hello,
>
> I recently encountered some issues on my boot partition on a system running
> the linux 2.4.19-rc3 kernel.  There were some corruptions that were
> reported by reiserfsck version 3.6.2 that could be repaired using the
> fix-fixable option.  To ensure that this could be done with the partition
> completely unmounted I built a rescure CD with the appropriate kernel,
> modules, and statically linked copies of the reiserfsprogs 3.6.2 utilities.
>
> I had to back the partition up to an image file, so I was able to replay
> what happened next.  Apparently, when I boot up the system in normal mode.
> I get a message indicating the boot partition was NOT cleanly unmounted,
> which is in conflict with checking the partition offline (says it was
> cleanly unmounted), i.e.: here is a copy of the on-line message I see in
> /var/log/boot.log:
>
> Jul 28 22:49:56 rebel fsck: Reiserfs super block in block 16 on 0x815 of
> format 3.6 with standard journal
> Jul 28 22:49:56 rebel fsck: Blocks (total/free): 126496/75295 by 4096 bytes
> Jul 28 22:49:56 rebel fsck: Filesystem is NOT cleanly umounted

-- 

David R. Bergstein
Systems Engineer and Blues Musician - 
http://mywebpages.comcast.net/dbergstein/
Heart of Blue - bookings on-line at http://www.heartofblue.com
OpenPGP Public Key 0xE1F138CA - For info see http://www.gnupg.org
Key fingerprint = C86E CA2A 4171 AC73 91D7  3DCE 8832 D764 E1F1 38CA
________________________________________________________________________

There's another way to survive.  Mutual trust -- and help.
		-- Kirk, "Day of the Dove", stardate unknown
