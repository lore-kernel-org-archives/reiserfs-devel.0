From: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2004@gmx.net>
Subject: Re: Need help recovering lost partitions
Date: Thu, 29 Jan 2004 00:35:32 +0100
Message-ID: <40184744.1020301@gmx.net>
References: <20040128143848.27765.h003.c001.wm@mail.ngenllc.com.criticalpath.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16644-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040128143848.27765.h003.c001.wm@mail.ngenllc.com.criticalpath.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: dan@ngenllc.com
Cc: matts@ksu.edu, reiserfs-list@namesys.com

dan@ngenllc.com wrote:

> So how can I scan the partition for the old
> superblocks?  gpart and parted weren't picking them up,
> but I know they were there.  And the 6GB of data it
> found is much less then the size of the partition
> (50GB), which makes me think that some data might still
> be there (i.e. only 100 * (6/50) % of the data could
> have been overwritten).

If you did reiserfsck --rebuild-tree --scan-whole-partition on the
unpartitioned hard drive, it is very likely that this reduced your chance
of rescueing some data to zero.

It all depends on how much money you're willing to spend. For starters, I
would recommend you to try the support offered by Namesys. Since they
wrote reiserfs they should have the best chance rescuing you data if it is
still on disk. If the data has already been overwritten by your actions,
you could try some data rescure company who claim to restore overwritten
data with a scanning tunneling microscope or somesuch.

The namesys support has helped a colleague of mine to restore all of his
data albeit some filenames were lost. The files themselves were
uncorrupted. And another big advantage of namesys is that they charge only
about 1/10th of the amount a commercial data rescue company would bill
you. (based on quotes from the web sites of the respective companies)


HTH,
Carl-Daniel

