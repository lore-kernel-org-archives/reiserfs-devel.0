From: Christoph Hellwig <hch@lst.de>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 12:59:14 +0200
Message-ID: <20040826105914.GA30795@lst.de>
References: <20040824202521.GA26705@lst.de> <412CEE38.1080707@namesys.com> <20040825200859.GA16345@lst.de> <Pine.LNX.4.58.0408251314260.17766@ppc970.osdl.org> <Pine.LNX.4.58.0408260204050.22259@artax.karlin.mff.cuni.cz> <Pine.LNX.4.58.0408251723540.17766@ppc970.osdl.org> <412DA11B.2070303@namesys.com> <20040826105330.GB30449@mail.shareable.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20626-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040826105330.GB30449@mail.shareable.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jamie Lokier <jamie@shareable.org>
Cc: Hans Reiser <reiser@namesys.com>, Linus Torvalds <torvalds@osdl.org>, Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>, Christoph Hellwig <hch@lst.de>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

On Thu, Aug 26, 2004 at 11:53:30AM +0100, Jamie Lokier wrote:
> Hans Reiser wrote:
> > being able to cat dirname/pseudos/cat and get a 
> > concatenation of all of the files is nice, and being able to cat 
> > dirname/pseudos/tar and get an archive of the directory is nice
> 
> Yes.  Being able to cd into filename.tar.gz and filename.iso is also
> nice, but all of these features should be supported by the VFS
> generically, not in any specific filesystem, and there should be a
> hook to invoke the various fun filesystem-independent handlers by name.

It doesn't belong into the kernel at all.  If at all it belongs into a
userspace filesystems, but even in that case the magic detection of
which one to use is kinda hard.  You absoutely don't want to hardcode
file formats in the kernel.
