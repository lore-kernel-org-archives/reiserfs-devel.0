From: Chris Mason <mason@suse.com>
Subject: RE: beta reiserfs data logging patches
Date: 29 May 2002 09:36:24 -0400
Message-ID: <1022679384.22608.1414.camel@tiny>
References: <93F527C91A6ED411AFE10050040665D0049BFAC7@corpusmx1.us.dg.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10430-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <93F527C91A6ED411AFE10050040665D0049BFAC7@corpusmx1.us.dg.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: berthiaume_wayne@emc.com
Cc: reiserfs-list@namesys.com

On Wed, 2002-05-29 at 09:01, berthiaume_wayne@emc.com wrote:
> 	I'll definitely run them through the benchmark. 
> 
> 	BTW: I have finished the tests and am assembling the data. The
> patches caused rather interesting results. ReiserFS now performs on the same
> level as Ext3FS in 2.4.19-pre7 when write cache is not used. When using
> barrier writes, performance outshined Ext3FS. I'll forward the data.

I suspect this means the barrier patch is being slightly unfair to ext3,
it should affect both filesystems equally.  I'll look closer when the
results come in.

-chris


