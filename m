From: Andrew Clausen <clausen@gnu.org>
Subject: Re: Reiser4 repackers
Date: Sun, 8 May 2005 11:05:25 +1000
Message-ID: <20050508010525.GL8179@gnu.org>
References: <427A0834.7080201@futuretg.com> <427A99C0.2000105@slaphack.com> <1115335902.24839.4.camel@localhost> <427ADAA4.8000407@slaphack.com> <20050506035921.GF8179@gnu.org> <427C46EC.6080009@slaphack.com> <20050507102514.GH8179@gnu.org> <427D66FA.8050803@slaphack.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24010-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <427D66FA.8050803@slaphack.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: David Masover <ninja@slaphack.com>
Cc: Jonathan Briggs <jbriggs@esoft.com>, "Dr. Giovanni A. Orlando" <gorlando@futuretg.com>, Hans Reiser <reiser@namesys.com>, Reiserfs mail-list <Reiserfs-List@namesys.com>

On Sat, May 07, 2005 at 08:10:18PM -0500, David Masover wrote:
> > The blocklist is only needed to find the blocks in the nested file,
> > which is huge.  (I don't know anything about reiser packing, but
> > things like tail-merging aren't a serious problem.)
> 
> Yet, it's still a problem.  You want a standardized way to map files to
> underlying blocks, and before Reiser4, I'd say this was easy.  But now,
> who knows what the FS does to bastardize the file on the way down?
> Crypto/compression?  Tail-packing?  Stenography?  The possibilities are
> endless...

Can't you disable these things for the special nested file?  You only
need the block list for one file!

> > Small users are happy to leave their computer overnight.
> 
> Maybe you are, but newbies aren't.  Maybe you got it wrong?  Maybe you
> got all your stuff moved around properly, but didn't leave room for a
> swap partition?  Looks like you have to start over!

Ideally, you'd have a tool where you plan the entire job first
(including creating the new swap partition), and then execute it in one
hit.

> Unless the newbies are following a VERY specific recipie or VERY good
> tools, this process could easily take a few weeks, instead of a few
> hours with the repacker.  And that repacker looks easier to implement
> than a noob-proof UI.  Of course, people who know tell me I'm naive on
> both counts...

Clearly, a repacker would be better for users.

> The current situation is not impossible, unless you want real users (not
> fanboys) to choose Reiser4 over ANYTHING else.  Why would I choose
> Reiser4+convertfs over ReiserFS 3 + resize_reiserfs?  Or even
> ntfs+ntfsresize?

Why do newbies ever choose reiserfs?  Crypto?

Cheers,
Andrew

