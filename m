From: Sander <sander@humilis.net>
Subject: Re: Erased start of voulme...
Date: Sat, 15 Jan 2005 12:51:44 +0100
Message-ID: <20050115115144.GC25781@favonius>
References: <Pine.LNX.4.61.0501140818350.24028@holly.rdwarf.net>
Reply-To: sander@humilis.net
Mime-Version: 1.0
Return-path: <reiserfs-list-return-23150-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.61.0501140818350.24028@holly.rdwarf.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Louis Erickson <lerickson@rdwarf.net>
Cc: reiserfs-list@namesys.com

Louis Erickson wrote (ao):
> On Fri, 14 Jan 2005, Sander <sander@humilis.net> wrote:
> > What arguments did you use?
> 
> reiserfsck --check /dev/md2

Good. Then the options Lena suggested will most likely make your data
appear.

> > What version of reiserfsck?
> 
> How do I find that out? It isn't in the help or visible as an option.
> If I ask mkfs.reiserfs it tells me it's 3.x.1b (2002). I suspect it's
> quite old.

Normally with -V, but 3.x.1b is the version and it indeed is very old.
Newest is 3.6.19.

Is this because you use an old distribution, and do you have such an old
kernel too? (sorry if I missed the kernel/distribution).

> Should I build new tools (on another similar machine) and use those
> instead?

Yes. Reiserfsck has seen a _lot_ improvement since then.

> > And what filesystem?
> 
> It's /dev/md2, mounting on /var.

...

> All of this is running on software raid, but the volumes are all up
> and good, and the raid component isn't complaining at all.
> 
> Or is that not the question you're asking?

Well, I meant Reiser3 of Reiser4, but it is Reiser3 most likely.


> On Fri, 14 Jan 2005, Alex Zarochentsev <zam@namesys.com> wrote:
> > reiserfsck --rebuild-sb can re-create the super block.
> 
> I saw that, but it looked dangerous, and I didn't want to try it until
> my copy had finished.

Of course :-)  Perform al your reiserfsck commands on the copy, not on
the original. If somehow the copy action failed you still have the
original, while if you perform all your actions on the original and have
a broken copy, you are lost.

> On Fri, 14 Jan 2005, E.Gryaznova <grev@namesys.com> wrote:
> > I would prefer to do the following :
> > dd if=/dev/problem_partition of=/dev/sparedevice
> > sparedevice can be usual disk partition
> 
> I don't have a spare partition large enough in this system. I have
> done:
> 
> dd if=/dev/problem_partition of=/home/scratch/rescue.dat
> 
> I'll then use the loopback file system to create a device entry for
> that file, and work on that. It was a suggestion made earlier on this
> very mailing list, and it sounded like a wise one to me. If the
> loopback doesn't work, I'll fiddle around with hardware to make a
> spare partition large enough available.

It should be oke.

The rest is answered by Lena :-)


-- 
Humilis IT Services and Solutions
http://www.humilis.net
