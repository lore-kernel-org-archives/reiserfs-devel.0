From: Oleg Drokin <green@namesys.com>
Subject: Re: Corruption: --fix-fixable results in all nlink values = 0
Date: Mon, 19 Aug 2002 13:22:52 +0400
Message-ID: <20020819132252.A4346@namesys.com>
References: <200208152007.42370.degerrit@web.de> <200208152329.40707.degerrit@web.de> <200208161205.00550.vitaly@namesys.com> <200208170254.48383.degerrit@web.de> <m3k7mpreij.fsf@merlin.emma.line.org> <3D5E9D69.1030109@namesys.com> <20020819092023.B1815@namesys.com> <3D60AF63.6040809@namesys.com> <20020819124649.A2585@namesys.com> <3D60B6E2.7050006@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11230-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3D60B6E2.7050006@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Matthias Andree <ma+rfs@dt.e-technik.uni-dortmund.de>, reiserfs-list@namesys.com, god@namesys.com, mason <mason@namesys.com>

Hello!

On Mon, Aug 19, 2002 at 01:14:10PM +0400, Hans Reiser wrote:
> >He argues that if we'd had corrupted tree, how would we know that the 
> >bablocks
> >list is corrupted or not. Or something like that.
> And he suggests doing what instead?

He suggests that user should specify list of bad blocks each time user runs
reiserfsck.

Bye,
    Oleg
