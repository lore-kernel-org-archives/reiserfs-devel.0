From: Oleg Drokin <green@namesys.com>
Subject: Re: Data-logging and md as / fs bug
Date: Wed, 14 May 2003 09:40:51 +0400
Message-ID: <20030514054051.GA27656@namesys.com>
References: <3EB30852.6090402@netscape.net> <200305062134.42520.christian.mayrhuber@gmx.net> <1052250298.14612.235.camel@tiny.suse.com> <200305062156.27595.Dieter.Nuetzel@hamburg.de> <1052400685.14617.489.camel@tiny.suse.com> <20030512072943.GA21604@namesys.com> <5.2.0.9.2.20030513224724.01cc3d10@pop.tvnet.hu>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14103-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <5.2.0.9.2.20030513224724.01cc3d10@pop.tvnet.hu>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Newsmail <newsmail@satimex.tvnet.hu>
Cc: Manuel Krause <manuelkrause@netscape.net>, reiserfs-list@namesys.com

Hello!

On Tue, May 13, 2003 at 10:52:40PM +0100, Newsmail wrote:

> ps: what about iget5_locked? is it safe to use?

I've got not a single bugreport on it, it passed our tester's load too.
And it works for me. So I assume it is reasonably safe to use.

(alll of this is only true for 2.4.21-pre5+ stuff, the iget5_locked backport to 2.4.20
seems to be broken).

Bye,
    Oleg
