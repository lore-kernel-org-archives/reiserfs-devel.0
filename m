From: Oleg Drokin <green@namesys.com>
Subject: Re: Corruption: --fix-fixable results in all nlink values = 0
Date: Wed, 21 Aug 2002 10:04:52 +0400
Message-ID: <20020821100452.A10765@namesys.com>
References: <m3k7mpreij.fsf@merlin.emma.line.org> <3D5E9D69.1030109@namesys.com> <20020819092023.B1815@namesys.com> <3D60AF63.6040809@namesys.com> <20020819124649.A2585@namesys.com> <3D60B6E2.7050006@namesys.com> <20020819132252.A4346@namesys.com> <3D60C35E.7000903@namesys.com> <20020819142035.A5741@namesys.com> <1029875053.12387.521.camel@tiny>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11261-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <1029875053.12387.521.camel@tiny>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Chris Mason <mason@suse.com>
Cc: Hans Reiser <reiser@namesys.com>, Matthias Andree <ma+rfs@dt.e-technik.uni-dortmund.de>, reiserfs-list@namesys.com, god@namesys.com, mason <mason@namesys.com>

Hello!

On Tue, Aug 20, 2002 at 04:24:13PM -0400, Chris Mason wrote:

> make sure it was valid, regardless of where you stored it.  The problem
> is that if you store it in the tree somehow, you've got a chicken and
> egg problem that you can't read the list until the tree is good and you
> can read the tree without knowing which blocks are bad.

With carefully choosen key, it will be in fixed tree position.
But well, if Hans decided it should not be stored in a tree - so be it.

Bye,
    Oleg
