From: berthiaume_wayne@emc.com
Subject: RE: beta reiserfs data logging patches
Date: Wed, 29 May 2002 10:07:38 -0400
Message-ID: <93F527C91A6ED411AFE10050040665D0049BFACC@corpusmx1.us.dg.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10433-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: mason@suse.com
Cc: reiserfs-list@namesys.com

	What I noticed is mount() would not allow me to disable write
barrier on ext3 - option not supported.

-----Original Message-----
From: Chris Mason [mailto:mason@suse.com]
Sent: Wednesday, May 29, 2002 9:36 AM
To: berthiaume_wayne@emc.com
Cc: reiserfs-list@namesys.com
Subject: RE: beta reiserfs data logging patches


On Wed, 2002-05-29 at 09:01, berthiaume_wayne@emc.com wrote:
> 	I'll definitely run them through the benchmark. 
> 
> 	BTW: I have finished the tests and am assembling the data. The
> patches caused rather interesting results. ReiserFS now performs on the
same
> level as Ext3FS in 2.4.19-pre7 when write cache is not used. When using
> barrier writes, performance outshined Ext3FS. I'll forward the data.

I suspect this means the barrier patch is being slightly unfair to ext3,
it should affect both filesystems equally.  I'll look closer when the
results come in.

-chris

