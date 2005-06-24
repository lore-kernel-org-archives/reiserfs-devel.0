From: Al Viro <viro@parcelfarce.linux.theplanet.co.uk>
Subject: Re: reiser4 plugins
Date: Fri, 24 Jun 2005 08:11:59 +0100
Message-ID: <20050624071159.GQ29811@parcelfarce.linux.theplanet.co.uk>
References: <200506231924.j5NJOvLA031008@laptop11.inf.utfsm.cl> <42BB31E9.50805@slaphack.com> <1119570225.18655.75.camel@localhost.localdomain> <42BB5E1A.70903@namesys.com> <42BB7083.2070107@cisco.com> <42BBAD0F.2040802@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24536-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <42BBAD0F.2040802@namesys.com>
Sender: Al Viro <viro@www.linux.org.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Lincoln Dale <ltd@cisco.com>, Alan Cox <alan@lxorguk.ukuu.org.uk>, David Masover <ninja@slaphack.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

On Thu, Jun 23, 2005 at 11:49:51PM -0700, Hans Reiser wrote:
> Regarding trust, Christophe comes out the gate using the words "useless
> abstraction layer" that happens to be a core feature of our design,
> demanding we cut it out, and not really understanding it or recognizing
> any functionality it provides, and you can't really expect me to respect
> this, can you?
> 
> Now, if his target is reduced to whether we can eliminate a function
> indirection, and whether we can review the code together and see if it
> is easy to extend plugins and pluginids to other filesystems by finding
> places to make it more generic and accepting of per filesystem plugins,
> especially if it is not tied to going into 2.6.13, well, that is the
> conversation I would have liked to have had.

Have I missed the posting with analysis of changes in locking scheme
and update of proof of correctness?  If so, please give the message ID.

_That_ had been the major showstopper for any merges, IIRC.
