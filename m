From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: 2.6.0-test6 crash while reading files in /proc/fs/reiserfs/sda1
Date: Thu, 2 Oct 2003 19:40:51 +0400
Message-ID: <16252.18179.242071.708771@laputa.namesys.com>
References: <1064936688.4222.14.camel@localhost.localdomain>
	<200309302006.32584.vitaly@namesys.com>
	<1065019441.4226.1.camel@localhost.localdomain>
	<16251.5348.570797.101912@laputa.namesys.com>
	<20031001184338.GW7665@parcelfarce.linux.theplanet.co.uk>
	<16251.63770.622805.143036@laputa.namesys.com>
	<20031002103550.GB7665@parcelfarce.linux.theplanet.co.uk>
	<16252.798.375208.261677@laputa.namesys.com>
	<20031002120133.GC7665@parcelfarce.linux.theplanet.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15772-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20031002120133.GC7665@parcelfarce.linux.theplanet.co.uk>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: viro@parcelfarce.linux.theplanet.co.uk
Cc: Zan Lynx <zlynx@acm.org>, linux-kernel@vger.kernel.org, reiserfs-list@namesys.com, Linus Torvalds <torvalds@osdl.org>

viro@parcelfarce.linux.theplanet.co.uk writes:
 > [Linus, please wait with applying the patch below until ACK from Nikita, OK?]
 > 

[...]

 > 
 > 
 > If you are OK with the patch below - please ACK it.  AFAICS it's the minimal
 > fix and combined with optimistic sget() patch it should address all objections.

Yes, it works (cum optimistic sget()).

 > 
 > diff -urN B6-rest/fs/reiserfs/procfs.c B6-current/fs/reiserfs/procfs.c
 > --- B6-rest/fs/reiserfs/procfs.c	Sat Sep 27 22:04:57 2003
 > +++ B6-current/fs/reiserfs/procfs.c	Thu Oct  2 07:57:31 2003
 > @@ -478,14 +478,15 @@
 >  static void *r_next(struct seq_file *m, void *v, loff_t *pos)
 >  {
 >  	++*pos;
 > +	if (v)
 > +		deactivate_super(v);
 >  	return NULL;
 >  }
 >  
 >  static void r_stop(struct seq_file *m, void *v)
 >  {
 > -	struct proc_dir_entry *de = m->private;
 > -	struct super_block *s = de->data;
 > -	deactivate_super(s);
 > +	if (v)
 > +		deactivate_super(v);
 >  }
 >  
 >  static int r_show(struct seq_file *m, void *v)

Nikita.
