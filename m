From: Oleg Drokin <green@namesys.com>
Subject: Re: access beyond end of device again
Date: Tue, 25 Jun 2002 09:11:50 +0400
Message-ID: <20020625091150.B4240@namesys.com>
References: <1951319530634.20020624073524@redefine.org> <20020624183557.A2171@namesys.com> <20020624144501.GA28013@matrix.wg> <20020624184948.B896@namesys.com> <3D174CD6.5000407@namesys.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10826-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <3D174CD6.5000407@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hans Reiser <reiser@namesys.com>
Cc: Dirk Mueller <dmuell@gmx.net>, reiserfs-list@namesys.com

Hello!

On Mon, Jun 24, 2002 at 08:46:14PM +0400, Hans Reiser wrote:
> >reiserfs does not allocates any blocks past the partition size,
> >so I cannot even imagine what are you speaking about ;)
> This can be caused by fdisk followed by mkreiserfs without a reboot 
> between fdisk and mkreiserfs, yes?

Similar problem, but not this exact one, I'd say.
But sequence of events should be this:
have a hdd with several partitions. Have some of the partitions mounted.
(or at least one).
Destroy one of the partitions and create smaller one instead.
(or just resize partition down).
mkfs the partition without rebooting.
But if resizing have removed more than 132 Mb of space,
then such a partition won't mount on next reboot just because not of all
bitmaps can be readed. (and messages indicated that requested sector is far
away from partition end).

The main thins there is for HDD to be mounted (at least one partition).
If nothing were mounted off the HDD, then kernel is able to correctly
re-read partition table.

Bye,
    Oleg
