From: Jamie Lokier <jamie@shareable.org>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 17:06:38 +0100
Message-ID: <20040826160638.GJ5733@mail.shareable.org>
References: <20040824202521.GA26705@lst.de> <412CEE38.1080707@namesys.com> <20040825200859.GA16345@lst.de> <20040825203516.GB4688@backtop.namesys.com> <20040825205149.GA17654@lst.de> <412DA2CF.2030204@namesys.com> <20040826124119.GA431@lst.de> <20040826134812.GB5733@mail.shareable.org> <20040826155744.GA4250@lst.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20711-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040826155744.GA4250@lst.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christoph Hellwig <hch@lst.de>, Hans Reiser <reiser@namesys.com>, Alex Zarochentsev <zam@namesys.com>, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Alexander Lyamin aka FLX <flx@namesys.com>, Linus Torvalds <torvalds@osdl.org>, ReiserFS List <reiserfs-list@namesys.com>

Christoph Hellwig wrote:
> > There's bound to be some security issue, but I'm not sure what you're
> > getting at with /tmp.  What sort of sort of security problem arises
> > with a world-writeable directory such as /tmp, that cannot arise with
> > the standard fs semantics?
> 
> Actually you are right on that issue because it would open the
> device/fifo as directory and not device/fifo (in fact I'd had to look at
> the code again to see whether they actually do this only for files or
> also for special files)

Are you saying that with reiser4, you can open a device or fifo with
O_DIRECTORY?

-- Jamie
