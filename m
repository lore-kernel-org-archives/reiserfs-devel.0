From: Chris Mason <mason@suse.com>
Subject: Re: Data-logging and md as / fs bug
Date: 11 May 2003 08:58:30 -0400
Message-ID: <1052657909.31450.3.camel@tiny.suse.com>
References: <3EB30852.6090402@netscape.net>
	 <200305062134.42520.christian.mayrhuber@gmx.net>
	 <1052250298.14612.235.camel@tiny.suse.com>
	 <200305062156.27595.Dieter.Nuetzel@hamburg.de>
	 <1052400685.14617.489.camel@tiny.suse.com>  <3EBC0DBF.4050807@netscape.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14066-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3EBC0DBF.4050807@netscape.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Manuel Krause <manuelkrause@netscape.net>
Cc: reiserfs-list <reiserfs-list@namesys.com>

On Fri, 2003-05-09 at 16:21, Manuel Krause wrote:
> Thanks for your description below about what is really useful... :-))
> 
> On 02/23/03 you posted a kinoded-9.diff.gz to the list that solved a 
> "device busy" on here when umounting a partition directly after copying 
> some GB data to it.

kinoded-9 was fixing a symptom, the real problem  was the patch to allow
dirty inodes to hang around instead of logging them instantly.  With the
right workload you could reproduce the device busy on unmount problem
with kinoded-9 applied too.

> In those days you proposed to also use kinoded when not having the quota 
> patches applied. (That were the times when dirty-inodes-for-kinoded.diff
> was new.)
> 
> My questions:
> Is kinoded really useless without quota?

Right now, yes.

> Did you discontinue the kinoded-9 changes?

kinoded-9 changes are still good, I need to post an updated patch.  They
are not critical though.

> Does it conflict with the recent data-logging changes?

No

> And, I just read on the list that Kerin Millar wrote about 
> device/resource busy error messages and was wondering if that had 
> something to do with it.
> 

The software raid problems are different, that was a long standing bug
in the journal relocation code.

-chris


