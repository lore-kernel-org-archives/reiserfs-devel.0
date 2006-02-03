From: "Raymond A. Meijer" <rmeijer@internet.gr>
Subject: Re: vs-4080
Date: Fri, 3 Feb 2006 13:38:31 +0200
Message-ID: <200602031338.31351.rmeijer@internet.gr>
References: <200601111109.09437.rmeijer@internet.gr> <1137632976.6573.7.camel@tribesman.namesys.com> <200601201302.24802.rmeijer@internet.gr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27996-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200601201302.24802.rmeijer@internet.gr>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Fri 20 Jan 2006 13:02, Raymond A. Meijer wrote:

> > > > > ReiserFS: dm-8: warning: vs-4080: reiserfs_free_block: free_block
> > > > > (dm-8:46707368)[dev:blocknr]: bit already cleared

> > It would be interesting to check the filesystem after a week of regular
> > load to see whether new such corruptions appeared.

> No problems so far:
>
> reiserfsck --fix-fixable started at Fri Jan 20 12:08:21 2006

[...]

> reiserfsck finished at Fri Jan 20 12:30:05 2006

Still no problems:

reiserfsck --fix-fixable started at Fri Feb  3 13:14:52 2006
###########
Replaying journal..
Reiserfs journal '/dev/debian/mirror' in blocks [18..8211]: 0 transactions replayed
Checking internal tree..finished
Comparing bitmaps..finished
Checking Semantic tree:
finished
No corruptions found
There are on the filesystem:
        Leaves 121472
        Internal nodes 820
        Directories 36818
        Other files 581476
        Data block pointers 68825551 (0 of them are zero)
        Safe links 0
###########
reiserfsck finished at Fri Feb  3 13:37:21 2006


Ray
