From: Chris Mason <mason@suse.com>
Subject: Re: Corruption: --fix-fixable results in all nlink
	values = 0
Date: 20 Aug 2002 16:24:13 -0400
Message-ID: <1029875053.12387.521.camel@tiny>
References: <200208161205.00550.vitaly@namesys.com>
	<200208170254.48383.degerrit@web.de> <m3k7mpreij.fsf@merlin.emma.line.org>
	<3D5E9D69.1030109@namesys.com> <20020819092023.B1815@namesys.com>
	<3D60AF63.6040809@namesys.com> <20020819124649.A2585@namesys.com>
	<3D60B6E2.7050006@namesys.com> <20020819132252.A4346@namesys.com>
	<3D60C35E.7000903@namesys.com>  <20020819142035.A5741@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11257-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20020819142035.A5741@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: Hans Reiser <reiser@namesys.com>, Matthias Andree <ma+rfs@dt.e-technik.uni-dortmund.de>, reiserfs-list@namesys.com, god@namesys.com, mason <mason@namesys.com>

On Mon, 2002-08-19 at 06:20, Oleg Drokin wrote:
> Hello!
> 
> On Mon, Aug 19, 2002 at 02:07:26PM +0400, Hans Reiser wrote:
> 
> > >He suggests that user should specify list of bad blocks each time user runs
> > >reiserfsck.
> > This sounds reasonable.  You can probably even have a default location 
> 
> Not for me.
> 
> > to check for the list somewhere in /etc if you want.  Remind the user 
> 
> File can get corrupted too.

You'd have to include some kind of checksum of the bad blocks lists to
make sure it was valid, regardless of where you stored it.  The problem
is that if you store it in the tree somehow, you've got a chicken and
egg problem that you can't read the list until the tree is good and you
can read the tree without knowing which blocks are bad.

It needs to be stored outside the btree, in its own data structure.

This could be a file on a different filesystem, or on a floppy, or in
something special you put into the FS.

-chris


