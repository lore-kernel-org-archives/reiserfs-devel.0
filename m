From: Christoph Hellwig <hch@lst.de>
Subject: Re: silent semantic changes with reiser4
Date: Thu, 26 Aug 2004 18:07:50 +0200
Message-ID: <20040826160750.GC4326@lst.de>
References: <Pine.LNX.4.44.0408261152340.27909-100000@chimarrao.boston.redhat.com> <1093536282.5482.6.camel@leto.cs.pocnet.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-20713-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1093536282.5482.6.camel@leto.cs.pocnet.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Christophe Saout <christophe@saout.de>
Cc: Rik van Riel <riel@redhat.com>, Jamie Lokier <jamie@shareable.org>, Denis Vlasenko <vda@port.imtp.ilyichevsk.odessa.ua>, Christer Weinigel <christer@weinigel.se>, Spam <spam@tnonline.net>, Andrew Morton <akpm@osdl.org>, wichert@wiggy.net, jra@samba.org, torvalds@osdl.org, reiser@namesys.com, hch@lst.de, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, flx@namesys.com, reiserfs-list@namesys.com

On Thu, Aug 26, 2004 at 06:04:42PM +0200, Christophe Saout wrote:
> It should be a simple format. Something simliar to tar. The worst thing
> that can happen is people start writing plugins for every existing
> compound format out there. It should be the other way around, agree on a
> simple compound format and encourage applications to use this one if the
> want to use this advantage.

or placing this into a userspace helper that the kernel can invoke
transparently.  If you're doing funny thing like that for your swap
device deadlocks are the last of your worries :)

