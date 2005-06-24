From: Lincoln Dale <ltd@cisco.com>
Subject: Re: reiser4 plugins
Date: Fri, 24 Jun 2005 12:31:31 +1000
Message-ID: <42BB7083.2070107@cisco.com>
References: <200506231924.j5NJOvLA031008@laptop11.inf.utfsm.cl>	 <42BB31E9.50805@slaphack.com> <1119570225.18655.75.camel@localhost.localdomain> <42BB5E1A.70903@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-24530-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42BB5E1A.70903@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, David Masover <ninja@slaphack.com>, Horst von Brand <vonbrand@inf.utfsm.cl>, Jeff Garzik <jgarzik@pobox.com>, Christoph Hellwig <hch@infradead.org>, Andrew Morton <akpm@osdl.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, ReiserFS List <reiserfs-list@namesys.com>

Hans Reiser wrote:

>So you fundamentally reject the prototype it in one fs and then abstract
>it to others development model?
>  
>

Hans,
after many years here now, one would have thought you would have "got" 
this part of Linux: kernel development & code that gets into the kernel 
only does so by getting past the benevolent dictators.
instead, it seems that every time there is ReiserFS to be merged (and we 
can go back in history a number of years here..), it always seems to 
come as a great shock that your code won't be merged 'as-is' without 
peer review & comment.

don't feel that you're being singled out here.  you aren't.  there isn't 
any anti-Hans-and-his-filesystem conspiracy here.
there are plenty of examples on where this has happened in Linux 
previously in other parts of the tree.
EVMS is a great example of similar things - a proposal to include kernel 
code to do various volume-mgmt functions - which was basically 
accomplishing the same goal as that of LVM/LVM2 and MD drivers (& DM 
framework).
the EVMS team are a great act to follow -  see 
http://lwn.net/Articles/14714/ - they showed high levels of professional 
conduct and made what was essentially a 'hard' but 'correct' decision in 
reworking EVMS to use the same DM infrastructure as LVM2.
there are countless other examples at various times - various 
'competing' IPv6 projects, IPSec, various "hardware" (software) RAID 
controllers, various IP offload schemes et al.

why does Reiserfs have to be any different?

you know that VFS is the mechanism in Linux.  you know (i hope..) how it 
works.  it isn't so hard to see how many of the Reiser4 "plug-ins" could 
be tied into VFS calls.
OR, if they cannot TODAY, propose how VFS _COULD_ be made to do this.

the key here is trust.  and trust is a two-way street.

the irony of this whole thread is that history is repeating itself.  see 
http://www.ussg.iu.edu/hypermail/linux/kernel/0112.1/0519.html
kernel developers pushed back on you 3 years ago - in 2001 - what has 
really changed?

*an observation*

cheers,

lincoln.
