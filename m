From: mjt@nysv.org Markus =?unknown-8bit?q?T=F6rnqvist?=
Subject: Re: reiser acceptance (was Re: Atomic filesystem or not)
Date: Tue, 20 Jul 2004 11:03:57 +0300
Message-ID: <20040720080357.GX4990@nysv.org>
References: <200407151434.23082.marcel@hilzinger.hu> <200407151354.47063.ctpm@ist.utl.pt> <40F6DE4A.2070103@slaphack.com> <40F6E06B.1080505@namesys.com> <40F73370.2090600@slaphack.com> <40FB876E.1050200@namesys.com> <40FC3730.80908@slaphack.com> <20040720065253.GW4990@nysv.org> <40FCCC4F.6040709@slaphack.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-19702-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <40FCCC4F.6040709@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Masover <ninja@slaphack.com>
Cc: Hans Reiser <reiser@namesys.com>, Claudio Martins <ctpm@ist.utl.pt>, reiserfs-list@namesys.com, Marcel Hilzinger <marcel@hilzinger.hu>

On Tue, Jul 20, 2004 at 02:39:59AM -0500, David Masover wrote:
>
>Unless, that is, you've already made it so modular that people who call
>sys_reiser on reiser4 won't find it broken on reiser5.  If you can do
>that without cruft, you are amazing, and the number should go.

But if the syscalls get extended, we have the same situation in
sys_reiser4, right?

So it has to be somehow forward-compatible, I think. But if it's all
in libaal or some equivalent, it's just enough to upgrade the library?

>Possibly.  My point is Tesla was a genius who died poor and Edison was a
>hard worker who won.  My guess is that Edison understood business and
>people a bit better than Tesla, who understood electricity a bit better
>than Edison.

Yeah, but I'm pretty sure I don't mis-remember Edison using a few
very dirty tricks to prove his superiority...

>What about Gentoo?  (I just mentioned this in an email, probably sent
>exactly the same time as yours.)  Gentoo maintainers welcome new,
>unstable stuff, as long as it's well isolated -- use the ~x86 flag if
>it's a package, or a USE flag if it's a patch.  So we just add a reiser4
>USE flag.  As long as they can warn users away from it because of
>possible instability (as they did with the gtk2 flag), we're fine.

Sure. But it'll be a cold day in hell when I start using Gentoo.

Debian is basically flexible enough for me, and I abhor the notion
of compiling more than what I have to.

Anyway, getting the patches out there, I'd be more than happy to do
things with them in Debian :)

>What one distro does, others are more likely to do.

But still I think upstream penetration would be best.

>Not really.  Best thing?  A Gentoo SYNC mirror or a Debian source, or
>the Fedora equivalent (if there is one).  That is, the next best thing
>to a Gentoo USE flag.  A lot of work for us, but users who want the
>latest reiser4 can get it, using a package manager, not patch and make.

Sure, I could gladly maintain a Debian mirror with reiser4-patched
packages for woody, sarge and sid, but I probably wouldn't have time
to thoroughly test all these setups, which means someone may poison
their stable Debian with these. So maybe just testing in sid
would be enough for starters.

-- 
mjt

