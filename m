From: Andrew Clausen <clausen@gnu.org>
Subject: Re: Reiser4 repackers
Date: Sat, 7 May 2005 20:25:14 +1000
Message-ID: <20050507102514.GH8179@gnu.org>
References: <427A0834.7080201@futuretg.com> <427A99C0.2000105@slaphack.com> <1115335902.24839.4.camel@localhost> <427ADAA4.8000407@slaphack.com> <20050506035921.GF8179@gnu.org> <427C46EC.6080009@slaphack.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24006-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <427C46EC.6080009@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Masover <ninja@slaphack.com>
Cc: Jonathan Briggs <jbriggs@esoft.com>, "Dr. Giovanni A. Orlando" <gorlando@futuretg.com>, Hans Reiser <reiser@namesys.com>, Reiserfs mail-list <Reiserfs-List@namesys.com>

On Fri, May 06, 2005 at 11:41:16PM -0500, David Masover wrote:
> > Are you familiar with convertfs?
> >
> > 	http://members.optusnet.com.au/clausen/ideas/convertfs.txt
> 
> How easy is it to get the blocklist needed?  It seems like Reiser4's
> packing doesn't help here...

The blocklist is only needed to find the blocks in the nested file,
which is huge.  (I don't know anything about reiser packing, but
things like tail-merging aren't a serious problem.)

> In both of these situations, convertfs seems workable, but overkill.  I
> mean, a proper resizer would leave the FS in a useable state no matter
> which way it went or when power was cut.  Convertfs means that if I lose
> power at any point during the process, I'm very likely hosed, especially
> with something doing lazy writes like Reiser4 as the original FS.  And
> this is all assuming it would work at all.

You could do journalling in this process.  (This would slow it down
considerablly, however!)  If you've got some nice gui like qtparted
on a knoppix live cd, it could be quite convenient.

> These are not situations where enterprise users would pay thousands of
> dollars to be able to do this -- they can afford to do a full
> backup/restore, just throw hardware at a problem and make it go away.
> These are the scenario where small users like me tend to give up, back
> up, reformat, and never touch such an inflexible FS again.

Small users are happy to leave their computer overnight.

Cheers,
Andrew

