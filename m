From: Oleg Drokin <green@namesys.com>
Subject: Re: [Fwd: Re: How to build a big file server]
Date: Thu, 5 Jun 2003 12:48:01 +0400
Message-ID: <20030605084801.GB5869@namesys.com>
References: <1054802685.1997.29.camel@wusel.schnulli.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14412-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1054802685.1997.29.camel@wusel.schnulli.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Heinz-Josef Claes <hjclaes@web.de>
Cc: ReiserFS List <reiserfs-list@namesys.com>

Hello!

On Thu, Jun 05, 2003 at 10:44:47AM +0200, Heinz-Josef Claes wrote:
> > > - BTW: I'm using a ZIP drive on the parallel port with reiserfs. Does it
> > > make sense to put the journal for the ZIP drive on the hard disk of the
> > > laptop?
> > NO. If you ever plan to use a zip disk with external journal on another
> > PC, you are completely out of luck.
> I do not want to use it on another PC, that would be ok. But if I would
> do this, is only the journal lost or the whole disk?

Journal will be lost (and if it was not empty, then some metadat corruption might
be present too).
Also you will need to create another journal on another PC.

Bye,
    Olege
