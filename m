From: Oleg Drokin <green@namesys.com>
Subject: Re: Reserved Blocks
Date: Mon, 16 Sep 2002 17:41:09 +0400
Message-ID: <20020916174109.A21027@namesys.com>
References: <20020916102742.6538D2926@hofmann.snowcra.sh> <15749.46844.233761.653142@laputa.namesys.com> <20020916125116.B8E96297C@hofmann.snowcra.sh> <15749.56464.253411.12957@laputa.namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-11471-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <15749.56464.253411.12957@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: Reiserfs mail-list <Reiserfs-List@Namesys.COM>

Hello!

On Mon, Sep 16, 2002 at 05:15:20PM +0400, Nikita Danilov wrote:

> What I thought about is adding new mount option -o root_blk=1000, and
> adding one `if' statement to the
> fs/reiserfs/bitmap.c:reiserfs_allocate_blocknrs().

Actually two mount options. Or even three.
One option is to specify uid for whom to reserve. Or may be not uid but gid,
too.

> Also, if there are not enough free blocks at the -mount- time---issue a
> warning. What about this? Oleg?

Sounds easy enough.

But is easily defeated, unfortunatelly.
Since the spans across already allocated blocks without any control,
the only moment root-owned process makes tree to occupy one more block to
create some directory, for example, malicious process immediately writes
file tail into that free space...

>  > >  > Is this essential UNIX filesystem feature implemented?
>  > > Well, nobody asked for it yet. :)
>  > Allow me to ask on behalf of all the SysAdmins out there.  This is an
>  > extremely useful standard safeguard against users filling up /var (or,

No. It does not work, I think. Well, it works, but can be easily defeated.

E.g. if I need to overflow your partition where logs are stored, I'd do someting
like that:
while :; do cat /etc/passwd | logger -t nobody ; done
Repeat with different -p swithces if you have several filesystems for different
logs.

Also consider there is set uid application that outputs data.
I just do setuid_app >>/fs_to_fill/somefile
and repeat it that much times to fill the fs.

So this protection you are asking for is mostly imagenary.

>  > Perhaps you should have a section in your FAQ that covers
>  > standard/traditional filesystem features not present in ReiserFS, or
>  > at what kernel version they were merged in - eg 2.4.19pre3 for inode
>  > attributes, and not yet for Filesystem Quotas or SuperUser Reserved
>  > Blocks percentage.

FS quotas are implemented. Link to URL is in our FAQ.

Bye,
    Oleg
