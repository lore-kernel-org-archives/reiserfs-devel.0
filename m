From: Oleg Drokin <green@namesys.com>
Subject: Re: reiserfsck infinite loop at pass2 (built by Debian).
Date: Fri, 18 Apr 2003 19:27:15 +0400
Message-ID: <20030418192715.A10324@namesys.com>
References: <200304181604.28955.vitaly@namesys.com> <200304181710.23731.Dieter.Nuetzel@hamburg.de> <20030418191144.A10228@namesys.com> <200304181726.28793.Dieter.Nuetzel@hamburg.de>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13712-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <200304181726.28793.Dieter.Nuetzel@hamburg.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Dieter N?tzel <Dieter.Nuetzel@hamburg.de>
Cc: Vitaly Fertman <vitaly@namesys.com>, reiserfs-list@namesys.com

Hello!

On Fri, Apr 18, 2003 at 05:26:28PM +0200, Dieter N?tzel wrote:

> > The quote below lists kernel messages that are printed during mount.
> Yes, you are right.
> But two (one useless) journal replay rounds.
> Could this be avoided?

It is avoided.
if fsck replayed the journal, then kernel _checks_ the log,
and found it is empty, then does nothing ;)

Bye,
    Oleg
