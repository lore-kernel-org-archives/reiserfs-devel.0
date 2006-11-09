From: Lennart Sorensen <lsorense@csclub.uwaterloo.ca>
Subject: Re: Problem with multiple mounts
Date: Thu, 9 Nov 2006 10:15:46 -0500
Message-ID: <20061109151546.GA8236@csclub.uwaterloo.ca>
References: <45522E67.7050907@linux.vnet.ibm.com> <20061108203323.GA8238@csclub.uwaterloo.ca> <45525C82.5080303@linux.vnet.ibm.com> <20061108230623.GZ6012@schatzie.adilger.int>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-30123-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20061108230623.GZ6012@schatzie.adilger.int>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Suzuki <suzuki@linux.vnet.ibm.com>, reiserfs-list@namesys.com, lkml <linux-kernel@vger.kernel.org>, Jan Kara <jack@suse.cz>

On Wed, Nov 08, 2006 at 04:06:23PM -0700, Andreas Dilger wrote:
> I would suggest that even while this is not supported, it would be prudent
> to fix such a bug.  It might be possible to hit a similar problem if there
> is corruption of the on-disk data in the journal and oopsing the kernel
> isn't a graceful way to deal with bad data on disk.

On the other hand corrupt data at least doesn't change under you while
you are trying to figure out the filesystem.  This particular use would
have meta data changing while you are trying to read it, making things
not be consistent with each other from one moment to another.  There may
be nothing that can be done about it.

--
Len Sorensen
