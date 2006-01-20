From: "Raymond A. Meijer" <rmeijer@internet.gr>
Subject: Re: vs-4080
Date: Fri, 20 Jan 2006 13:02:24 +0200
Message-ID: <200601201302.24802.rmeijer@internet.gr>
References: <200601111109.09437.rmeijer@internet.gr> <200601171711.38508.rmeijer@internet.gr> <1137632976.6573.7.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27809-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1137632976.6573.7.camel@tribesman.namesys.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

On Thu 19 Jan 2006 3:09, Vladimir V. Saveliev wrote:

> > > > ReiserFS: dm-8: warning: vs-4080: reiserfs_free_block: free_block
> > > > (dm-8:46707368)[dev:blocknr]: bit already cleared

> It would be interesting to check the filesystem after a week of regular
> load to see whether new such corruptions appeared.

No problems so far:

reiserfsck --fix-fixable started at Fri Jan 20 12:08:21 2006
###########
Replaying journal..
Reiserfs journal '/dev/debian/mirror' in blocks [18..8211]: 0 transactions replayed
Checking internal tree..finished
Comparing bitmaps..finished
Checking Semantic tree:
finished
No corruptions found
There are on the filesystem:
        Leaves 118509
        Internal nodes 806
        Directories 36322
        Other files 570374
        Data block pointers 67438522 (0 of them are zero)
        Safe links 0
###########
reiserfsck finished at Fri Jan 20 12:30:05 2006


Thanks,

Ray
