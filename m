From: Hans Reiser <reiser@namesys.com>
Subject: Re: fsck in background?
Date: Mon, 07 Apr 2003 21:06:13 +0400
Message-ID: <3E91B005.1010609@namesys.com>
References: <3E8818CD.1000500@dotcom.pl> <20030331144609.B1430@namesys.com> <3E88775F.5070302@namesys.com> <20030404223737.I1422@schatzie.adilger.int>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13607-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030404223737.I1422@schatzie.adilger.int>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andreas Dilger <adilger@clusterfs.com>, Oleg Drokin <green@namesys.com>
Cc: myciel <myciel@dotcom.pl>, reiserfs-list@namesys.com, lvm-devel@sistina.com

Andreas Dilger wrote:

>On Mar 31, 2003  21:14 +0400, Hans Reiser wrote:
>  
>
>>Oleg Drokin wrote:
>>
>>    
>>
>>>On Mon, Mar 31, 2003 at 12:30:37PM +0200, myciel wrote:
>>>      
>>>
>>>>so I'm curious if maybe fscking in background is planned? - idea is not new
>>>>and bsd guys say that they have it  for freebsd 5.0 in ffs.
>>>>   
>>>>
>>>>        
>>>>
>>>This is not possible for reiserfs, I think.
>>>reiserfs have non-constant metadata location , so while you can certainly
>>>check fs consistency of some snapshot, you cannot fix it because all the
>>>real data might have ben shifted to other blocks, old blocks might have
>>>been already freed and so on.
>>>      
>>>
>>It can be done, but I don't have the funding/staff for it.
>>    
>>
>
>I wrote a script to do this once, using LVM snapshots.  Attached here.
>I haven't used it in a long time, and didn't do much other than write
>it and test it out a bit, but it likely works OK.
>
>It obviously doesn't actually fix any problems that it detects, but
>for systems that run a long time it avoids the need to do a shutdown
>to verify large filesystems are intact.  For ext2/3 it also resets the
>"last checked" count/time so that ext3 will not do gratuitous full fscks
>if the system has been up over 6 months (assuming you run the script
>periodically while the system is running).
>
>Cheers, Andreas
>============================= lvm-fsck =============================
>#!/bin/sh
># Automatically checks ext2/ext3 filesystems that are currently mounted
># and also residing on LVM logical volumes, so that we can snapshot them.
># You need to have the LVM VFS locking patch applied for this to work.
>#
># (C) Andreas Dilger, 2001
>#
># Licensed under the GNU General Public License, version 2 or later
>
>#set -vx
>
># Use the PATH to find any installed fsck programs
>PATH=$PATH:/sbin:/usr/sbin:/usr/local/sbin
>PROG=`basename $0`
>
>FSCKLV=lvfsck
>lvscan | grep ACTIVE | while read LVSCAN DASH ACTIVE LV LV2 SIZE; do
>	[ "$LV" = "Snapshot" ] && continue
>	if [ "$LV" = "Original" ]; then
>		LV=`echo $LV2 | tr -d \"`
>	else
>		LV=`echo $LV | tr -d \"`
>	fi
>	VG="`dirname $LV`"
>	LVS="$VG/$FSCKLV"
>	# This could be smarter (i.e. removing old snapshot after checking if
>	# another lvm-fsck is running, but we don't want to do concurrent fscks
>	# if it takes a really long time to run, or if the script has problems.
>	# Sadly, lvdisplay does not return an error code if $LVS doesn't exist
>	if [ "`lvdisplay $LVS 2> /dev/null`" ]; then
>		echo "$LVS exists!  Unable to check $LV"
>		continue
>	fi
>
>	# Check if this LV is mounted and has a fsck-able filesystem on it
>	AWKLV="`echo $LV | tr / .`"
>	FSTYPE=`mount | awk "/^$AWKLV/ { print \\$5 }"`
>	FSCK="`which fsck.$FSTYPE 2> /dev/null`"
>	[ "$FSCK" ] || continue
>
>	echo "$PROG: running read-only $FSCK on $LV"
>	# Just a guess at how much snapshot space we need
>	SIZE="`df -P $LV | tail +2 | awk '{ print $2 / 500 }'`"
>	lvcreate -s -L ${SIZE}k -n $FSCKLV $LV > /dev/null
>	rc=$?
>	if [ $rc -ne 0 ]; then
>		echo "Creating snapshot of $LV at $LVS failed with rc=$rc" 1>&2
>		continue
>	fi
>	case $FSTYPE in
>	ext2|ext3) $FSCK -f -n $LVS; rc=$?
>		if [ $rc -eq 0 ]; then
>			tune2fs -C 0 $LV > /dev/null
>			tune2fs -T now $LV > /dev/null 2>&1
>			;;
>	reiserfs) echo Yes | $FSCK --check $LVS; rc=$? ;;
>	*) echo "Don't know how to check $FSTYPE filesystems passively"; rc=$1;;
>	esac
>	[ $rc -ne 0 ] && echo "$FSCK of $LV failed with rc=$rc" 1>&2
>	lvremove -f $LVS > /dev/null
>	rc=$?
>	[ $rc -ne 0 ] && echo "lvremove of $LVS failed with rc=$rc" 1>&2
>done
>--
>Andreas Dilger
>http://sourceforge.net/projects/ext2resize/
>http://www-mddsp.enel.ucalgary.ca/People/adilger/
>
>
>
>  
>
Oleg, consider putting a link to this on our web site.....

-- 
Hans


