From: Oleg Drokin <green@namesys.com>
Subject: Re: Data-logging and md as / fs bug
Date: Tue, 13 May 2003 18:59:23 +0400
Message-ID: <20030513145923.GJ12963@namesys.com>
References: <3EB30852.6090402@netscape.net> <200305062134.42520.christian.mayrhuber@gmx.net> <1052250298.14612.235.camel@tiny.suse.com> <200305062156.27595.Dieter.Nuetzel@hamburg.de> <1052400685.14617.489.camel@tiny.suse.com> <20030512072943.GA21604@namesys.com> <3EC0FE02.9030007@netscape.net> <20030513142501.GI12963@namesys.com> <3EC10879.1040902@netscape.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14092-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <3EC10879.1040902@netscape.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Manuel Krause <manuelkrause@netscape.net>
Cc: reiserfs-list <reiserfs-list@namesys.com>

Hello!

On Tue, May 13, 2003 at 05:00:09PM +0200, Manuel Krause wrote:

> >No. I have old patch instead that applies to 2.4.20 and basically every 
> >other kernel
> >and that I am pushing to Marchelo as this iget5_locked is too intrusive at 
> >current 2.4
> >development stage.
> In what kind? Or: What kind of intrusion do you mean then (see below)?!

It touches too much code, the code vfs code, nfs and coda (and reiserfs of course).

> >This old patch is attached.
> >>Always appreciated are less intrusive ones regarding i/o speed ;-))
> >I/O speed should be the same with all the aproaches.
> >The patch below is a bit more cpu hungry as it introduces one more 
> >spinlock.
> But, errhm, why should I use a patch that uses more cpu and doesn't 
> speed up disk i/o (see above)???

Well, you are free to use that iget5_locked backport, but I cannot feed it to Marcelo now,
and I need the bug to be fixed, so I am sending this old patch now and will revert to
proper fix asfter 2.4.22 is out.
(when it is out, you can revert the patch I sent in previous mail and apply the iget5_locked backport).
And the more testing is better as always ;)

> I only did a very little testing when the discussions on 
> iget5_locked_for-2.4.21-pre5-datalogging.diff, kinoded-? + 
> inode-dirty-for-kinoded began. And it seemed that kinoded + inode-dirty 
> doesn't make a difference without quota (as Chris already pointed out) 
> but that I loose 2s on OpenOffice- and 1s on Netscape7-startup time 
> without your -pre5 patch. Is that possible or should I improve my 
> looking-at-the-clock or re-verify that?

Hm. Loose as in startup now takes XX sec more ? Or XX sec less?

Thank you.

Bye,
    Oleg
