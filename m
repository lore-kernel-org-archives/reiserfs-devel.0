From: berthiaume_wayne@emc.com
Subject: RE: Data Shredding on a Journal Filesystem
Date: Thu, 26 Sep 2002 13:20:51 -0400
Message-ID: <93F527C91A6ED411AFE10050040665D0049C0085@corpusmx1.us.dg.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11554-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: green@namesys.com
Cc: reiserfs-list@namesys.com

	Hi Oleg.

	I'm using the standard journaling from 2.4.19 - metadata for
recovery from power failures. We are also  using tails at this time. I have
been investigating the use of -o notails as a performance improvement;
however, I need to weigh that against disk space usage as well.

-----Original Message-----
From: Oleg Drokin [mailto:green@namesys.com]
Sent: Wednesday, September 25, 2002 3:30 AM
To: berthiaume_wayne@emc.com
Cc: reiserfs-list@namesys.com
Subject: Re: [reiserfs-list] Data Shredding on a Journal Filesystem


Hello!

On Tue, Sep 24, 2002 at 05:12:03PM -0400, berthiaume_wayne@emc.com wrote:

> 	Hello fellow ReiserFS fans. I'm in search of a data shredder for use
> on reiserfs and am wondering if anyone knows of one. It would need to
> effectively remove any trace both in the journal and on the disk itself
any
> and all data pertaining to a file. I'm not sure, but I thought at one time
> Hans was talking about something this himself. I have looked at shred()
but
> it does not work with journalling filesystems.

shred should work just fine with reiserfs in case you did not
enable data journaling mode and you have tails disabled.
The only thing that may be left on disk is filename and 
blocks in which file itself was stored.

Bye,
    Oleg
