From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: linux-2.6.0 + reiser4 oops
Date: Mon, 19 Jan 2004 20:35:38 +0300
Message-ID: <16396.5482.158701.28221@laputa.namesys.com>
References: <16395.42887.514077.642497@laputa.namesys.com>
	<200401191729.i0JHTJo24262@mail.osdl.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16573-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200401191729.i0JHTJo24262@mail.osdl.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: markw@osdl.org
Cc: reiserfs-list@Namesys.COM, linux-lvm@sistina.com

markw@osdl.org writes:
 > On 19 Jan, Nikita Danilov wrote:
 > > markw@osdl.org writes:
 > >  > I was testing our DBT-2 workload on linux-2.6.0 with LVM2 and reiser4
 > >  > and got the following oops when I attempted to create a database with
 > >  > PostgreSQL.  Let me know if I can provide any additional information:
 > >  > 
 > >  > Unable to handle kernel NULL pointer dereference at virtual address 00000000
 > >  >  printing eip:                                                       
 > >  > c014c607      
 > >  > *pde = 00104001
 > >  > *pte = 00000000
 > >  > Oops: 0000 [#1]
 > > 
 > > This looks much like another bug report we had for
 > > reiser4-on-top-of-raid0. A fix (tentative) for that was to use
 > > bio_add_page() while constructing bios, and it will be included into
 > > next reiser4 snapshot (that, I hope, will be released
 > > to-day---2004.01.19).
 > 
 > Hi Nikita,
 > 
 > I ran the 2004.01.19 snapshot against 2.6.1 and now I get the following
 > error when I attempt to mount the reiser4 parition:
 > 
 > reiser4[mount(17176)]: _init_read_super (fs/reiser4/init_super.c:166)[nikita-2608]:
 > WARNING: Wrong master super block magic.

I am afraid, you have to re-create reiser4 file systems with new
progs. It was decided that we should change super block magic to be more
"descriptive".

By the way, it turned out, that 2004.01.19 snapshot contained a bug, so
new snapshot will be released to-night.

 > Thanks,
 > Mark

Nikita.
