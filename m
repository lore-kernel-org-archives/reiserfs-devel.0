From: Chris Mason <mason@suse.com>
Subject: RE: [PATCH CFT] tons of logging patches
Date: 04 Jun 2002 12:55:28 -0400
Message-ID: <1023209728.31683.170.camel@tiny>
References: <93F527C91A6ED411AFE10050040665D0049BFAF9@corpusmx1.us.dg.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-10506-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <93F527C91A6ED411AFE10050040665D0049BFAF9@corpusmx1.us.dg.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: berthiaume_wayne@emc.com
Cc: reiserfs-list@namesys.com, manuel.krause@mb.tu-ilmenau.de

On Tue, 2002-06-04 at 11:48, berthiaume_wayne@emc.com wrote:
> 	Chris, isn't there a danger, remotely, that with data=ordered you
> could lose your data? For Ext3FS, if the machine should crash after the
> filesystem data is updated but before the metadata is updated, fsck(8) will
> reclaim the newly allocated blocks; therefore, the updated file is no longer
> correct.

Yes, reiserfs does the same.  data=ordered only promises that before the
updated metadata is on disk, the data blocks they reference will be on
disk too.  This way you know that if you add new bytes to a file, after
a crash you will either have valid data in the file, or no new bytes
added at all.

The only way you can be sure the actual metadata is there is by waiting
for an fsync(file) to finish.

-chris


