From: Antonie Nygma <darkenigma80@yahoo.com>
Subject: Re: running unpatched 2.2.19 on reiserFS-ed system
Date: Tue, 11 Jun 2002 18:58:20 -0700 (PDT)
Message-ID: <20020612015820.61083.qmail@web21405.mail.yahoo.com>
References: <20020611090459.A5294@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10719-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
In-Reply-To: <20020611090459.A5294@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

Oleg, 

it turned out that the partitions are of v.3.6...
anyway, i applied the patch and it won't even get past
compilation..

i guess that there's no way for me to 'downgrade' to
v.3.5 while preserving the current partitions and the
data in it?

Toni
--- Oleg Drokin <green@namesys.com> wrote:
> Hello!
> 
> On Mon, Jun 10, 2002 at 09:59:11PM -0700, Antonie
> Nygma wrote:
> 
> > stuffs on (fresh) kernel-2.2.19 and could not
> > succesfully boot after compilation and rebooting.
> > the error: Unable to mount root fs (kernel panic).
> > i suspect this is because all the partitions in
> the
> > current HDD are reiser-FS.
> 
> Yes.
> 
> > can anybody help me point out what i need to do to
> get
> > k-2.2.19 to run on the machine?
> 
> 
> If your reiserfs partitions are of v3.5 format (see
> dmesg output,
> 2.4 kernels will output warning in case of v3.5 fs
> being mounted),
> you must apply latest reiserfs patch (against
> 2.2.20, but should apply fine
> to 2.2.19) from
> ftp://ftp.namesys.com/pub/reiserfs-for-2.2
> then recompile kernel and it should boot.
> If you have v3.6 filesystem format, then you cannot
> use it from 2.2 kernel.


__________________________________________________
Do You Yahoo!?
Yahoo! - Official partner of 2002 FIFA World Cup
http://fifaworldcup.yahoo.com
