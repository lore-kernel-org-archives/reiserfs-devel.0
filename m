From: Hans Reiser <reiser@namesys.com>
Subject: Re: Reiser4 and linux 2.6.0
Date: Sat, 09 Aug 2003 19:45:38 +0400
Message-ID: <3F351722.2000108@namesys.com>
References: <3F1EF7DB.2010805@namesys.com>	<3F1F6005.4060307@tupshin.com>	<1059021113.7911.13.camel@localhost>	<3F1F66F0.1050406@tupshin.com>	<1059024090.9728.22.camel@localhost>	<16159.48809.812634.455756@laputa.namesys.com>	<3F1FF6DB.2090104@tupshin.com>	<20030724152649.GB12647@work.bitmover.com>	<3F1FFBF9.2050308@tupshin.com>	<20030724155432.GE12647@work.bitmover.com>	<20030801161520.GA17083@pillars.net>	<3F2A94F1.2010502@tupshin.com> <16170.38409.267629.396781@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15263-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16170.38409.267629.396781@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: reiserfs mailing list <reiserfs-list@Namesys.COM>

Nikita Danilov wrote:

>Tupshin Harper writes:
> > Robert August Vincent II wrote:
> > 
> > >Could you explain, in simple terms, to somebody who is unfamiliar with
> > >bitkeeper, how to pull the latest 2.6.0 and reiser4 code and do
> > >whatever you did to merge them?
> > >
> > >I'm not working on any SCM, and therefore downloaded bitkeeper using
> > >the "free" license.
> > >
> > >But I'm unclear (even after perusing the FAQ and docs) on how to do
> > >what you just described.
> > >
> > >Perhaps it would be as simple as:
> > >
> > >bk clone http://linux.bkbits.net/linux-2.5
> > >bk clone bk://bk.namesys.com/bk/reiser4-linux-2.5 linux-2.5
> > >cd linux-2.5/fs
> > >bk clone bk://bk.namesys.com/bk/reiser4
> > >
> > >But I doubt it...
> > >
> > Larry was kind enough to send me the patch of his results of this merge, 
> > but unfortunately it suffered from the same incompleteness problems that 
> > the recent diffs on the namesys ftp site do. They apply cleanly, but 
> > they completely omit the contents of the fs/reiser4 directory which has 
> > the bulk of the code. It seem that the problem resides with the reiser 
> > folks. Maybe they have some more complicated structure involving two 
> > trees. Not sure, but a correct patch looks like it has to come from the 
> > reiser4 team.
>
>This is because Larry only made a diff against
>bk://bk.namesys.com/bk/reiser4-linux-2.5 which is a repository
>containing changes needed by the reiser4 in the core kernel code.
>
>Bulk of reiser4 code (content of fs/reiser4) is in
>bk://bk.namesys.com/bk/reiser4 repository.
>
> > 
> > -Tupshin
> > 
>
>Nikita.
>
>
>  
>
make more effort to make this well documented for users.  If they are 
asking these questions, it means that you failed to document.

-- 
Hans


