From: Soeren Sonnenburg <sonne@first.gmd.de>
Subject: Re: possible bug - fsck shows perfect results, linux refuses to
 mount
Date: Mon, 31 Mar 2003 10:34:30 +0200 (MET DST)
Message-ID: <Pine.GSO.4.21.0303311028450.4102-100000@pille>
References: <20030331120014.C25533@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13459-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030331120014.C25533@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Oleg Drokin <green@namesys.com>
Cc: "Robin H. Johnson" <robbat2@orbis-terrarum.net>, reiserfs-list@namesys.com



On Mon, 31 Mar 2003, Oleg Drokin wrote:

> Hello!
> 
> On Sun, Mar 30, 2003 at 11:49:57PM -0800, Robin H. Johnson wrote:
> > > Can you please make a metadata dump for us?
> > > "debugreiserfs -p /dev/hdb1 | bzip2 -9c >metadata.bz2" and make this file
> > > available for us to download.
> > Stderr output of debugreiserfs here:
> > http://www.orbis-terrarum.net/~robbat2/reiserfs/debugreiserfs.run
> 
> "bread: Cannot read the block (18)."
> Well, now this is something.
> Do you have I/O errors messages in kernel logs, or do you know another reason for
> it to fail reading 18th block?
> Perhaps try to run "badblocks -b 4096" to find out if there are more blocks
> that cannot be read?
> 
> > > Thank you.
> > No, most definitely thank you. Now I have more ammunition against my boss
> > as to why Open Source is better. You guys really rock. I'd never get a
> > response from any other vendor this quickly (even though we pay some of
> > them a fair sum).
> 
> We accept money too ;)
> 
> > A question for you, so I can support things. Is there a list somewhere
> > of features requested, and how much you money you want to be paid to add
> > them in? Especially the smaller features (hint hint).
> 
> Well, there is http://namesys.com/support.html , as of features, usually
> we expect customers to come up with features they need. If you lack something
> in reiserfs and you are willing to pay, we can implement it.
> If you are happy with the current features-set, why to pay for features that
> would be never used?
> 
> Bye,
>     Oleg
> 

Today a raid0 (stripe set) crashed here (there is a bug in western
digital disks - they sometimes need a power cycle to accept commands
again) and I ran the latest reiserfsck on /dev/md0 with --rebuild-sb
--rebuild-tree.

It successfully finished rebuilding the tree but now I observe the same
thing robin observes: I cannot mount the device... so I ran reiserfsck
/dev/md0 again and it complained that there is no superblock on the
drive. So I tried to create one with reiserfstune --make-standard-journal
/dev/md0 but that one just segfaults (unfortunately I have gcc on that
machine as /usr /var are on the stripeset :-( ).
Also I tried to to reiserfsck --rebuild-tree -rebuild-sb again, but that
only segfault too ...

This is really strange since reiserfsck was really enumerating over all
the files and everything seemed to be fine after the first rebuild-tree.

So robin, you are not alone :-)

Hmm, I am running kernel 2.4.21pre6

Soeren.

