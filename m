From: Oleg Drokin <green@namesys.com>
Subject: Re: When is a defragmenting tool expected to be released?
Date: Sat, 26 Apr 2003 13:57:52 +0400
Message-ID: <20030426095752.GA2087@namesys.com>
References: <569438017.20030425213516@tnonline.net> <200304261414.00860._nasturtium@bigpond.com> <000e01c30bbb$23ca3470$0200a8c0@xpstation> <20030426073020.GA2283@namesys.com> <002c01c30bc9$4ac348b0$0200a8c0@xpstation>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13822-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <002c01c30bc9$4ac348b0$0200a8c0@xpstation>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fred -- Speed Up -- <speedup@free.fr>
Cc: reiserfs-list@namesys.com

Hello!

On Sat, Apr 26, 2003 at 09:56:05AM +0200, Fred -- Speed Up -- wrote:
> Why won't there be a 2.4 version of Reiser4 ? I knew Reiser4 would be

All the development is happen on 2.5 kernels.
Changes between 2.4 and 2.5 are big.
So while I cannot say there will never be 2.4 backport, I think it may be not
that easy, anyway. On the other hand, now that OS-dependent layer is clearly abstracted,
I well might be wrong ;)

> available for v2.5, but it is intended to be released on september (you know
> better than I, if you could tell me when Reiser4 would be released it would
> be nice :-D) and the 2.6 kernel should release at the end of 2003, maybe
> first quarter of 2004 : why would you release a stable Reiser4 code only on
> 2.5 kernels, as 2.4 versions may be used for at least one year before major
> distros include the 2.6 version.

The decision was made by Hans. Perhaps he did not want to be limited with 2.4
limitations at the beginning ;)

> Is Reiser4 intended to replace Reiser3 (I've read Reiser4 mounter may be

Yes, we hope that will happen eventually. (I mean the userbase will migrate
to reiser4, the reiserfs v3 will stay in kernel for a long time. It is stable
already, and reiser4 will take some time to stabilize).

> able to mount Reiser3 volumes), or will Reiser3 be kept in 2.2 and 2.4
> kernels, as Reiser4 would be 2.5 (and 2.6 ;)) dedicated ?

We think it is possible to make reiserfs v3 disk format plugin for reiser4,
but still this is not a reason to kill another piece of code from 2.5/2.6
kernels. Not in nearest 5 years, I'd say ;)

> There are probably necessary features issues (the new VFS maybe), and mostly
> performance issues to that would make you release Reiser4 for 2.5 kernels,
> but why did you choose to make Reiser4 2.5-only compliant ?

That's where our development is. Developing for two different kernels is
not very wise thing. Backport might happen later if we'd think this is necessary.

> Why aren't there news on the Namesys website ? Maybe cvs logs, or whatever

Because there no more exciting news for now.
We have a public bitkeeper repository and everyone may lookup the logs
( bk://namesys.com/bk/reiser4 )

> completion percentage, implemented features, stable ones, maybe some new
> performance tests (there are no tests comparing Reiser4, XFS and JFS anymore
> on your website) ?

We are playing with disk allocation algorithms, so if we'd publish benchmark
results now, they won't be of much value as the algorithm (and results) change
on a daily basis.

> You seem to be a bit late about the kernel experimental release : the latest
> one is 2.5.68, and your patches are only available up to 2.5.60. When do you
> decide to move on to a newer experimental kernel version ?

We track kernel releases very closely internally. We have not released any snapshots
recently because we have some stability problems that are not fixed yet.
But our repositories are publically available for those interested.

> May Reiser4 be included in the -ac series ?

It is not ready yet. But when it is ready, we well may submit it to Alan first, just
for testing purposes ;)

> While you're up, I've got some questions to ask you (you don't have to
> answer all of them ...), as I'm very interersted in your filesystem, and I'm
> writing a french doc about Reiser4 :

I think it is better to get key reiser4 developers to answer those questions.
That may happen on Monday (or if Hans will appear in Moscow, then may be even earlier).

Bye,
    Oleg
