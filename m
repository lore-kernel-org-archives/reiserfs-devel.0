From: Andrea Arcangeli <andrea@suse.de>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 00:59:33 +0200
Message-ID: <20040825225933.GD5618@nocona.random>
References: <20040824202521.GA26705@lst.de> <412CEE38.1080707@namesys.com> <20040825200859.GA16345@lst.de> <Pine.LNX.4.58.0408251314260.17766@ppc970.osdl.org> <20040825204240.GI21964@parcelfarce.linux.theplanet.co.uk> <1093467601.9749.14.camel@leto.cs.pocnet.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20537-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1093467601.9749.14.camel@leto.cs.pocnet.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe Saout <christophe@saout.de>
Cc: viro@parcelfarce.linux.theplanet.co.uk, Linus Torvalds <torvalds@osdl.org>, Christoph Hellwig <hch@lst.de>, Hans Reiser <reiser@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, ReiserFS List <reiserfs-list@namesys.com>

On Wed, Aug 25, 2004 at 11:00:00PM +0200, Christophe Saout wrote:
> It should be completely forbidden to link into a meta-directory or out
> of such a directory. [..]

agreed.

> Yes, I don't think it was a good idea either. Probably someone should

I personally would like plugins only if the API they use wouldn't allow
them to corrupt the underlying fs, I'm not sure if this is the case with
reiserfs4.

About the backwards compatibility, another option is to add a O_FILEDIR
and have bash learn about it when you cd into a file. No magic with the
slashes then.
