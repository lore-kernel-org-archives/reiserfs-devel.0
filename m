From: Oleg Drokin <green@namesys.com>
Subject: Re: Data Shredding on a Journal Filesystem
Date: Wed, 25 Sep 2002 11:30:01 +0400
Message-ID: <20020925113001.A23339@namesys.com>
References: <93F527C91A6ED411AFE10050040665D0049C0072@corpusmx1.us.dg.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11523-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <93F527C91A6ED411AFE10050040665D0049C0072@corpusmx1.us.dg.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: berthiaume_wayne@emc.com
Cc: reiserfs-list@namesys.com

Hello!

On Tue, Sep 24, 2002 at 05:12:03PM -0400, berthiaume_wayne@emc.com wrote:

> 	Hello fellow ReiserFS fans. I'm in search of a data shredder for use
> on reiserfs and am wondering if anyone knows of one. It would need to
> effectively remove any trace both in the journal and on the disk itself any
> and all data pertaining to a file. I'm not sure, but I thought at one time
> Hans was talking about something this himself. I have looked at shred() but
> it does not work with journalling filesystems.

shred should work just fine with reiserfs in case you did not
enable data journaling mode and you have tails disabled.
The only thing that may be left on disk is filename and 
blocks in which file itself was stored.

Bye,
    Oleg
