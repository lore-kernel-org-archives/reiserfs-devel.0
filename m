From: Nikita Danilov <Nikita@Namesys.COM>
Subject: Re: Reserved Blocks
Date: Mon, 16 Sep 2002 17:15:20 +0400
Message-ID: <15749.56464.253411.12957@laputa.namesys.com>
References: <20020916102742.6538D2926@hofmann.snowcra.sh>
	<15749.46844.233761.653142@laputa.namesys.com>
	<20020916125116.B8E96297C@hofmann.snowcra.sh>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11470-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20020916125116.B8E96297C@hofmann.snowcra.sh>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Sam Vilain writes:
 > Nikita Danilov <Nikita@Namesys.COM> wrote:
 > 
 > >  > How can I reserve space on a filesystem for the superuser?  There
 > >  > doesn't seem to be an option to mkreiserfs or reiserfstune for it.
 > > I am afraid, there is no support for this, currently. But implementation
 > > should be fairly trivial, through.
 > 
 > How trivial?  One new C source file?  One new function and a handful
 > of hooks?  Adding in hooks to already existing kernel functions?  Or
 > adding a new field to reserved space in the superblock of the
 > filesystem?

I guess, it doesn't worth breaking existing disk format, so adding new
field to the on-disk super-block is out of question.

What I thought about is adding new mount option -o root_blk=1000, and
adding one `if' statement to the

fs/reiserfs/bitmap.c:reiserfs_allocate_blocknrs().

Also, if there are not enough free blocks at the -mount- time---issue a
warning. What about this? Oleg?

 > 
 > >  > Is this essential UNIX filesystem feature implemented?
 > > Well, nobody asked for it yet. :)
 > 
 > Allow me to ask on behalf of all the SysAdmins out there.  This is an
 > extremely useful standard safeguard against users filling up /var (or,
 > for single filesystem machines, /).  The superuser not being able to
 > create temporary files in /tmp, /var/tmp, or even /etc/mtab can cause
 > the system to behave erratically on all but the most mature
 > distributions.

I am not questioning this feature usefulness, it is just that there are
always more features to add than resources available, so adding feature
that nobody asked for is not very likely.

 > 
 > Perhaps you should have a section in your FAQ that covers
 > standard/traditional filesystem features not present in ReiserFS, or
 > at what kernel version they were merged in - eg 2.4.19pre3 for inode
 > attributes, and not yet for Filesystem Quotas or SuperUser Reserved
 > Blocks percentage.
 > --
 >    Sam Vilain, sam@vilain.net     WWW: http://sam.vilain.net/
 >     7D74 2A09 B2D3 C30F F78E      GPG: http://sam.vilain.net/sam.asc
 >     278A A425 30A9 05B5 2F13
 > 
 > Real software engineers don't program in assembler.  They become
 > queasy at the very thought.

Nikita.
