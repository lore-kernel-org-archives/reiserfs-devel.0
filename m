From: Alex Zarochentsev <zam@namesys.com>
Subject: Re: silent semantic changes with reiser4
Date: Mon, 30 Aug 2004 17:25:04 +0400
Sender: linux-fsdevel-owner@vger.kernel.org
Message-ID: <20040830132504.GR5108@backtop.namesys.com>
References: <20040825205149.GA17654@lst.de> <412DA2CF.2030204@namesys.com> <20040826124119.GA431@lst.de> <20040826134812.GB5733@mail.shareable.org> <20040826155744.GA4250@lst.de> <20040826160638.GJ5733@mail.shareable.org> <20040826161303.GA4716@lst.de> <Pine.LNX.4.58.0408260919380.2304@ppc970.osdl.org> <20040826172029.GP5733@mail.shareable.org> <Pine.LNX.4.58.0408261021250.2304@ppc970.osdl.org>
Mime-Version: 1.0
Return-path: <linux-fsdevel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.58.0408261021250.2304@ppc970.osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Linus Torvalds <torvalds@osdl.org>
Cc: Jamie Lokier <jamie@shareable.org>, Christoph Hellwig <hch@lst.de>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

On Thu, Aug 26, 2004 at 10:29:45AM -0700, Linus Torvalds wrote:
> 
> 
> On Thu, 26 Aug 2004, Jamie Lokier wrote:
> >
> >     run_setuid_program
> > 
> >         -> calls pwd
> >            pwd opens("."), (".."), ("../..") etc.
> 
> Ehh.. Not only does pwd not do that..
> 
> (hint: there's a getcwd() system call)
> 
> >         -> the setuid program thus ends up opening a device or fifo,
> >            when it does pwd's path walk.  Yes it could use the getcwd
> >            syscall, but some programs do their own path walk.
> 
> .. but even if it did that, it should use O_DIRECTORY when it did so. If 
> it doesn't, it's broken.
> 
> So no, it would _not_ open the device or fifo when it did so.
> 
> The fact is, anything that expects to open a directory should already be 
> opening it with O_DIRECTORY.

reiser4 files-as-dirs do not depend on that.

A file behaves as directory if one calls i_op->lookup() or f_op->readdir().  I
am not sure that O_DIRECTORY should be a switch. 

> That said, ".." and "." are special already inside the kernel, and it 
> migth be worth making them automatically imply O_DIRECTORY, since nothing 
> else makes sense anyway. That would fix the case where somebody uses ".." 
> _without_ using O_DIRECTORY. 
> 
> > It also fits the container idea very well:
> > 
> >         /dev/hda/part1/ <- the filesystem inside partition 1
> 
> I don't think you can do that. The kernel has no idea how to mount the
> filesystem.
> 
> If it's already mounted somewhere else, that's a different issue.  
> Although it might be mounted in several places (as a bind mount) with
> different writability, I guess, so even then it might be "interesting".
> 
> 		Linus

-- 
Alex.
