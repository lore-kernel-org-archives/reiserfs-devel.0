From: Oleg Drokin <green@namesys.com>
Subject: Re: reiser4 and 2.5.60
Date: Tue, 18 Feb 2003 12:42:36 +0300
Message-ID: <20030218124236.A31148@namesys.com>
References: <20030215160033.A3570@humilis> <20030218121257.A27125@namesys.com> <20030218103151.B19634@humilis>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12804-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <20030218103151.B19634@humilis>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ookhoi <ookhoi@humilis.net>
Cc: reiserfs-list@namesys.com

Hello!

On Tue, Feb 18, 2003 at 10:31:51AM +0100, Ookhoi wrote:
> > Kind of.
> > It seems that inode_file_plugin(inode)->key_by_inode pointer is zero
> > for one of inodes. But I do not see how that can happen at all.
> > I personally untarred (and then compiled) kernel on this reiser4
> > snapshot without any problems more than once (in fact this is on of my
> > basic tests). I tried bot UP and SMP,
> > block device and loop device with file. Can you describe your system
> > in more details?
> Sure. It is a P-MMX, 200MHz, with 512MB ram, and a 4GB scsi disk.

Hm. That must be real slow, is it? (just because not all of the RAM is covered
by L2 cache, I mean. Or do you have some sensible chipset in there?).

> As said before, I do reiser4 on a loop fs. I did the same with reiser3,
> and that worked ok. Could the loop fs be a problem for reiser4?

Well, it should not, but if you can test it not on loop device just to
be sure, that would be nice.

> I attach dmesg, cpuinfo, lspci and .config

Thank you.

> Do you need more info, or want me to test things?

I need to experiment a bit more locallywith info I got from you, I think.

> It seems that reiser4 in BK is not updated for a few days now.

<joke>Because it is already perfect, nothing to improve</joke> ;)

Bye,
    Oleg
