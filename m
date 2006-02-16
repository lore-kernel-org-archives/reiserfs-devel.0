From: Alexander Lyamin <flx@msu.ru>
Subject: Re: Fwd: New reiser4 install
Date: Thu, 16 Feb 2006 12:58:22 +0300
Message-ID: <20060216095822.GA14385@alias.nmd.msu.ru>
References: <20060215180900.GA7431@cm.nu> <bea6b3260602160143t4b9252f6ra34b53c341483b97@mail.gmail.com>
Reply-To: flx@msu.ru
Mime-Version: 1.0
Return-path: <reiserfs-list-return-28078-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <bea6b3260602160143t4b9252f6ra34b53c341483b97@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfslist@gmail.com
Cc: flx@namesys.com, edward@namesys.com, reiserfs-list@namesys.com

Hi Shane,

I'm sorry we had  a list malfunction today and your message got chewed a bit,
but its got recovered and reposted here.

While on it, i'll try and share my own expirience with reiser4 usage.


First i suggest heading for  2.6.12 kernel, at moment it looks like most
stable, and i use it as filesystem on 4 boxes with couple of them being
pretty busy ones. all of them are SMP's.


Thu, Feb 16, 2006 at 12:43:45PM +0300, ReiserFS Users Mailing List wrote:
> ---------- Forwarded message ----------
> From: Shane <shane-reiserfs@cm.nu>
> Date: Feb 15, 2006 9:09 PM
> Subject: New reiser4 install
> To: reiserfs-list@namesys.com
> 
> Hello folks,
> 
> I am moving a database to a new FS and am looking as
> reiser4 for the filesystem.  However, I am a bit unsure of
> the plugins to use on filesystem creation.  If these are
> documented, I appologise for asking here.

go for vanilla flavor. that would do fine.

> 
> The FS will hold approximately 9 millian small files of on
> average 4k in size growing by around 500k files per month.
> Reads on the FS are random and there are usually around 10
> processes accessing the fs at any given time.  I am
> currently using ext3 but with so many files, space usage is
> starting to become an issue as each file is rounded to the
> block size of the FS so I'd like to get tail packing going.
yeah, thats exactly the case where r4 does good.
and in my expirience its more stable then 3.6 in SMP environment,
altough you should expect that  it'd spend some more cpu
cycles on that packing.

> I noticed the default plugin profile in debugfs.reiser4
> sets tail to plain.  Does this pack tails or should I be
> using ctail40 or the smart tails support?  Also, I noticed
> a transparent compression plugin is available in the kernel
> tree, is that something which is automatically enabled or
> do I need to do something at FS creation or mount time.

I CC'ed this message to Edward Shukshin (cryptoplugin author) cause
he's the preson you want to talk about compression stuff and if its
ready for prime time.

> 
> Finally, we use chattr to set the noatime flag on our
> files, is that supported in reiser4?  Come to think of it,
> chattr has a compress flag as well.

noatime would be good idea for any FS out there if you dont need
this feature and want to have some edge for what its costs.


-- 
"the liberation loophole will make it clear.."
lex lyamin
