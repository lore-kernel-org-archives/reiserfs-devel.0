From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: reiserfs tails and disk space
Date: Wed, 18 Jan 2006 21:34:49 +0300
Message-ID: <200601182134.49888.vitaly@namesys.com>
References: <20060117181548.GB11010@untroubled.org> <43CD3E45.6080304@namesys.com>
Mime-Version: 1.0
Content-Type: Multipart/Mixed;
  boundary="Boundary-00=_JpozD1gHRiJ8MHw"
Return-path: <reiserfs-list-return-27788-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43CD3E45.6080304@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: Bruce Guenter <lists-reiserfs-list@bruce-guenter.dyndns.org>
Cc: Hans Reiser <reiser@namesys.com>, reiserfs-list@namesys.com

--Boundary-00=_JpozD1gHRiJ8MHw
Content-Type: text/plain;
  charset="koi8-r"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Tuesday 17 January 2006 21:58, Hans Reiser wrote:
> The result is not expected, Vitaly please look into it.
> 
> Hans
> 
> Bruce Guenter wrote:
> 
> >Hi.
> >
> >I've been running a few tests with reiserfs and tails, and have been
> >unable to create a setup where the use (or lack) of tails results in a
> >significant difference in the amount of disk space used.

thank you for the report, the attached patch should fix 
the broken mount options. please try it.

> >Here's what I've done:
> >
> >1. Create a fresh 1GB filesystem (in a file on loopback), using reiserfs
> >with no options.
> >
> >2. Mount the filesystem with either no options, "notail", "tails=off",
> >"tails=on", or "tails=small".
> >
> >3. Unpack a sources tarball onto the filesystem, consisting of two fully
> >compiled versions of the linux kernel.  The tarball contains 47996 files
> >and 3321 directories totalling about 660MB of space.
> >
> >4. Measure the free disk space using df.
> >
> >5. Use dd to fill up the free disk space and count how many 1kB blocks
> >it could write.
> >
> >In all of the tests, the result was within 12kB of each other.  In fact,
> >the tests with "notail" or "tails=off" options had more usable disk
> >space than when using tails.
> >
> >Results:
> >
> >Options    1K-blocks    Used Available
> >default      1023964  645988  377976
> >notail       1023964  645988  377976
> >tails=off    1023964  645996  377968
> >tails=on     1023964  646000  377964
> >tails=small  1023964  645996  377968
> >
> >default      377600+0 records out
> >notail       377600+0 records out
> >tails=off    377592+0 records out
> >tails=on     377588+0 records out
> >tails=small  377592+0 records out
> >
> >I've put the log files and scripts up for review at
> >	http://untroubled.org/reiserfsdf/
> >I'm using Gentoo Linux, kernel 2.6.14-gentoo-r5
> >
> >Am I missing something, is this an expected result, or is something
> >broken?
> >
> >Thanks.
> >  
> >
> 
> 
> 

-- 
Vitaly

--Boundary-00=_JpozD1gHRiJ8MHw
Content-Type: text/x-diff;
  charset="koi8-r";
  name="linux-2.6.14-reiserfs-mount-options-fix.patch"
Content-Transfer-Encoding: 7bit
Content-Disposition: attachment;
	filename="linux-2.6.14-reiserfs-mount-options-fix.patch"

--- linux-2.6.15-rc5-mm3-clean/fs/reiserfs/super.c	2005-12-21 23:57:54.000000000 +0300
+++ linux-2.6.15-rc5-mm3/fs/reiserfs/super.c	2006-01-18 21:28:25.206460792 +0300
@@ -1131,7 +1131,7 @@
 			REISERFS_SB(s)->s_mount_opt &= ~(1 << REISERFS_ATTRS);
 		}
 	} else if (le32_to_cpu(rs->s_flags) & reiserfs_attrs_cleared) {
-		REISERFS_SB(s)->s_mount_opt |= REISERFS_ATTRS;
+		REISERFS_SB(s)->s_mount_opt |= (1 << REISERFS_ATTRS);
 	}
 }
 

--Boundary-00=_JpozD1gHRiJ8MHw--
