From: Oleg Drokin <green@namesys.com>
Subject: Re: Corruption: --fix-fixable results in all nlink values = 0
Date: Mon, 19 Aug 2002 14:20:35 +0400
Message-ID: <20020819142035.A5741@namesys.com>
References: <200208161205.00550.vitaly@namesys.com> <200208170254.48383.degerrit@web.de> <m3k7mpreij.fsf@merlin.emma.line.org> <3D5E9D69.1030109@namesys.com> <20020819092023.B1815@namesys.com> <3D60AF63.6040809@namesys.com> <20020819124649.A2585@namesys.com> <3D60B6E2.7050006@namesys.com> <20020819132252.A4346@namesys.com> <3D60C35E.7000903@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11232-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3D60C35E.7000903@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Matthias Andree <ma+rfs@dt.e-technik.uni-dortmund.de>, reiserfs-list@namesys.com, god@namesys.com, mason <mason@namesys.com>

Hello!

On Mon, Aug 19, 2002 at 02:07:26PM +0400, Hans Reiser wrote:

> >He suggests that user should specify list of bad blocks each time user runs
> >reiserfsck.
> This sounds reasonable.  You can probably even have a default location 

Not for me.

> to check for the list somewhere in /etc if you want.  Remind the user 

File can get corrupted too.

> that you are using it everytime you find it though, that way if a 
> different sysadmin is running fsck, they can know why not all the blocks 
> they expect to be there are accessible.

Having some config files for this purpose is not good.
What if I have booted from rescue disk?

Bye,
    Oleg
