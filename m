From: Chris Mason <mason@suse.com>
Subject: Re: "no space left" but df -k shows plenty of free space
Date: 19 May 2003 13:38:38 -0400
Message-ID: <1053365917.6207.105.camel@tiny.suse.com>
References: <3EC65671.DA1CB780@gmx.de>  <20030519160208.GA14048@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14165-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20030519160208.GA14048@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: D_i_F_i@gmx.de, reiserfs-list@namesys.com

On Mon, 2003-05-19 at 12:02, Oleg Drokin wrote:
> Hello!
> 
> On Sat, May 17, 2003 at 05:34:09PM +0200, D_i_F_i@gmx.de wrote:
> > while copying some data into a logical volume with reiserfs as
> > filesystem, I've got an error message, that there isn't enough
> > space left on the device. Even just creating a new empty file
> > isn't possible anymore:
> > sammy:/opt/kgm/data/log # touch abc
> > touch: creating `abc': No space left on device
> > But the df-command has still reported quite a lot of free capacity:
> > sammy:/opt/kgm/data/log # df -k /opt/kgm/data
> > Filesystem        1k-blocks     Used Available Use% Mounted on
> > /dev/kgmvg/datalv  10485436  7987364   2498072  77% /opt/kgm/data
> 
> Hm, this is pretty strange.

Could you please run debugreiserfs -p /dev/xxx | gzip -c >
df-error-fs.gz, and make it available somewhere for us to download.  If
you are using reiserfsprogs 3.x.0j or so the output can contain actual
file data, so you probably want to put the image onto a password
protected page.

This will take a metadata dump of the filesystem, I'd like to check it.

-chris


