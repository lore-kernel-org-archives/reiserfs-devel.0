From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: reiser4progs 0.5.4 for Debian
Date: Mon, 7 Jun 2004 23:02:04 +0300
Message-ID: <20040607200203.GL4990@nysv.org>
References: <20040603194120.GD4990@nysv.org> <20040607193305.GA4854@raptus.homelinux.org>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19070-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20040607193305.GA4854@raptus.homelinux.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Mon, Jun 07, 2004 at 09:33:05PM +0200, Domenico Andreoli wrote:

>> I know this is the wrong forum perhaps, but AFAIK the reiser4progs
>> maintainer(s) read this list..
>yes, i'm here listening in the darkness...

Some Debian developers are quite anal about these issues, indeed,
I got a bit flamed :)

But still, I didn't have your email and this seemed the proper, although
wrong from a debian point of view, channel to ask...

>reiser4progs 0.5.4 is from snapshot 2004.04.21-internal.testing.fixed,
>which doesn't look for common people, hence it is not in unstable.

Maybe Namesys should just "release it officially" then. Although it's
pretty much the de facto bug-fixed version. Should be enough to get
it into unstable, imo.

>indeed it is available in debian experimental.
>http://packages.debian.org/reiser4progs

I compiled it myself. It's not difficult to
cp -a ../reiser4progs-0.5.3/debian . and do the rest manually ;)

>really? i still have to finish reading the thread :/
>did Hans really move to GPL?!?

I think I mis-remembered a bit. Or wishful thinking ;)
http://lists.debian.org/debian-legal/2004/05/msg00443.html

"If Debian offers to provide credits in practice but not theory, and 
there is some possibility of getting into a debian installer in the near 
future, then I can probably lose a little and risk a little and put both 
progs and kernel code into GPL V2 for now despite it being a license with  
flaws that beg for fixing."

There is the if in the beginning. I don't know how official this must
be...

http://lists.debian.org/debian-legal/2004/05/msg00456.html
"FWIW, I would like to publicly thank Hans for his decision to release the
whole shebang under a GPLv2 license."

FWIW?
Anyway, I actually bothered to check the README.
"
Reiser4 is hereby licensed under the GNU General Public License version 2.
[...]
The portions of them owned by Hans
Reiser, or authorized to be licensed by him, have been in the past,
and likely will be in the future, licensed to other parties under
other licenses.
[...]
If you interpret
the GPL as not allowing those additional licensing options, you read
it wrongly, and Richard Stallman agrees with me, when carefully read
you can see that those restrictions on additional terms do not apply
to the owner of the copyright, and my interpretation of this shall
govern for this license.
"

But there is the single little catch:
"Finally, nothing in this license shall be interpreted to allow you to
fail to fairly credit me, or to remove my credits such as by creating
a front end that hides my credits from the user or renaming mkfs.reiser4"

I couldn't find any data on the licensing in the reiser4progs sources,
of which I just took a snapshot.

http://namesys.com/legalese.html

That does not take a stance for or against GPL, really...

-- 
mjt



