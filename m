From: Oleg Drokin <green@namesys.com>
Subject: Re: ReiserFS problems
Date: Fri, 8 Aug 2003 13:56:13 +0400
Message-ID: <20030808095613.GB4607@namesys.com>
References: <20030806182055.A28562@bitwizard.nl> <20030806164852.GA14719@namesys.com> <20030806191806.A31496@bitwizard.nl> <20030806172834.GA15024@namesys.com> <3F3252A4.4010104@namesys.com> <20030807181227.GA23303@matchmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-15243-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030807181227.GA23303@matchmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mike Fedyk <mfedyk@matchmail.com>
Cc: Hans Reiser <reiser@namesys.com>, Rogier Wolff <R.E.Wolff@harddisk-recovery.nl>, reiserfs-list@namesys.com, copy@harddisk-recovery.nl

Hello!

On Thu, Aug 07, 2003 at 11:12:27AM -0700, Mike Fedyk wrote:
> > >Well. This is actually unfortunate, I agree. In such a case you'd better
> > >move your reiserfs images to some other place for the time of reiserfsck 
> > >--rebuild-tree run.
> > or compress them.
> But if there was at any time an uncompressed reiserfs image within the outer
> reiserfs filesystem you're fscking, won't that screw it up too?

Yes.
The fs in file will be completely destroyed.
Some stuff from it may appear in outer fs. (possibly in lost + found,
no actual file data, just the names and directory structure).

> So you can compress it, but if you uncompress it to work with it, it still
> fscks fsck...  Right? :-/

Yes.

Bye,
    Oleg
