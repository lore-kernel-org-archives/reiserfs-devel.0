From: berthiaume_wayne@emc.com
Subject: RE: fsync() Performance Issue
Date: Fri, 3 May 2002 16:35:04 -0400
Message-ID: <93F527C91A6ED411AFE10050040665D0049BF9B4@corpusmx1.us.dg.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10226-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mason@suse.com
Cc: reiserfs-list@namesys.com, green@namesys.com

	Chris, I have some quick preliminary results for you. I have
additional testing to perform and haven't run debugreiserfs() yet. If you
have a preference for which tests to run debugreiserfs() let me know.
	Base testing was done against 2.4.13 built on RH 7.1 using the
test_writes.c code I forwarded to you. The system is a Tyan with single
PIII, IDE Promise 20269, Maxtor 160GB drive - write cache disabled. All
numbers are with fsync() and 1KB files. As I said, more testing, i.e.
filesizes, need to be performed.

2.4.13 			
	=> 47.4ms/file
2.4.19-pre7 / no options
	=> 50.3ms/file
2.4.19-pre7 speedup / no options
	=> 46.8ms/file
2.4.19-pre7 speedup, data logging, write barrier / no options
	=> 47.1ms/file
2.4.19-pre7 speedup, data logging, write barrier / data=journal
	=> 25.2ms/file
2.4.19-pre7 speedup, data logging, write barrier / data=journal,barrier=none
	=> 27.8ms/file

	Now what I find interesting are the last two results. The write
cache is disabled on the HDD. These early results are most promising. Next
week I'll be running bonnie++ and our homegrown test against reiserfs and
ext3fs with the same kernel metrics but add filesizes: 10K, 100K, 1M, 10M,
and 100M. 
	One question is will these patches be going into the 2.4 tree and
when?
Regards,
Wayne.  

-----Original Message-----
From: Chris Mason [mailto:mason@suse.com]
Sent: Wednesday, May 01, 2002 9:32 AM
To: berthiaume_wayne@emc.com
Subject: RE: [reiserfs-list] fsync() Performance Issue


Here are some quick results from the test program you sent.  I haven't
yet done the test on an unpatch kernel, so these numbers just show the
improvement from data logging.

As the size of the synchronous write increases, data logging helps
less.  With an 8k file size, data logging decreases total run time and
per file time by 40%.  16k file size it decreases it by 32%.

This was on a scsi drive.

-chris

