From: William Stearns <wstearns@pobox.com>
Subject: Re: Unable to create reiserfs on an empty file
Date: Wed, 3 Apr 2002 09:56:34 -0500 (EST)
Message-ID: <Pine.LNX.4.44.0204030952160.8574-100000@sparrow.websense.net>
References: <Pine.LNX.4.44.0203011216270.22313-100000@sparrow.websense.net>
Reply-To: William Stearns <wstearns@pobox.com>
Mime-Version: 1.0
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <Pine.LNX.4.44.0203011216270.22313-100000@sparrow.websense.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ML-reiserfs <reiserfs-list@namesys.com>
Cc: William Stearns <wstearns@pobox.com>

Good day, all,
	I'd be interested in hearing whether the following issue is 1) 
PEBCAK (Problem Exists Between Chair And Keyboard) on my part ;-), 2) a 
bug in mkreiserfs, 3) a known issue with or without an available fix, or 
4) a non-issue.
	My sincerest apologies if I've made a silly mistake at this end.
	Cheers,
	- Bill

On Fri, 1 Mar 2002, William Stearns wrote:

	I need to be able to create filesystems on empty files for the
User-Mode linux project (http://user-mode-linux.sourceforge.net).  My
mkemptyfs (at ftp://uml-pub.ists.dartmouth.edu/wstearns/mkrootfs/ )
essentially does this with the undocumented -f switch:

dd if=/dev/zero of=emptyfs.reiser.100 bs=$((1024 * 1024)) count=0 seek=100 || exit 1
echo 'y' | mkreiserfs -f emptyfs.reiser.100

	Unfortunately, mkreiserfs gives a 1 return code and doesn't appear
to actually do anything:

[wstearns@sparrow mkrootfs]$ od emptyfs.reiser.100
0000000 000000 000000 000000 000000 000000 000000 000000 000000
*
620000000

	Switching to a non-sparse dd (count=100, no seek) has no effect on 
this.  Typing 'y' on the command line instead of echoing it doesn't make 
any difference either.
	I'm using reiserfs-utils 3.x.0j from Redhat 7.2.  I'm running on 
Redhat 7.2 with a self compiled kernel (2.4.19-pre1-ac1 with Ingo's O1 
scheduler).  An strace of the attempt is available at 
ftp://uml-pub.ists.dartmouth.edu/wstearns/mkrootfs/mkreiserfs-f-emptyfs.reiser.100.strace.sparse.or.nonsparse
(the straces from building on a sparse or non-sparse file are identical).

[wstearns@sparrow bin]$ rpm -qi reiserfs-utils
Name        : reiserfs-utils               Relocations: /usr 
Version     : 3.x.0j                            Vendor: Red Hat, Inc.
Release     : 2                             Build Date: Sat Jul 21 03:07:07 2001
Install date: Mon Nov 26 01:00:09 2001      Build Host: stripples.devel.redhat.com
Group       : System Environment/Base       Source RPM: reiserfs-utils-3.x.0j-2.src.rpm
Size        : 587086                           License: GPL
Packager    : Red Hat, Inc. <http://bugzilla.redhat.com/bugzilla>
URL         : http://www.namesys.com/
Summary     : Tools for creating, repairing and debugging ReiserFS 
filesystems
[wstearns@sparrow bin]$ uname -a
Linux sparrow.websense.net 2.4.19-pre1-ac1 #1 Wed Feb 27 01:32:13 EST 2002 i686 unknown

	I suppose I could work around it by loop mounting the file and
running mkreiserfs on the loop device, but the loopback filesystem appears
(from recent lkml discussions) to have issues with files >2G.  I would
like to create empty filesystems larger than that.
	Are there other details that might make this easier to diagnose?  
Or should I just get out a brown paper bag now?  :-)

---------------------------------------------------------------------------
        "Tatu Ylonen was given public awards & wined & dined by the
Finnish government for making ssh available to the world.  Phil
Zimmerman got a prison-term-commuted-to-community-service for doing the
same with PGP.  There is **NO** doubt that US govermnmet laws, PAST and
PRESENT, HAVE hindered the development, commercialization and sales of
cryptographic software."
        -- Duncan Napier <napier@napiersys.bc.ca>
--------------------------------------------------------------------------
William Stearns (wstearns@pobox.com).  Mason, Buildkernel, named2hosts, 
and ipfwadm2ipchains are at:                        http://www.stearns.org
--------------------------------------------------------------------------


