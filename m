From: Oleg Drokin <green@namesys.com>
Subject: Re: Write-once file system
Date: Fri, 27 Jun 2003 20:20:16 +0400
Message-ID: <20030627162016.GB13908@namesys.com>
References: <12C7D768CC8ED4118A9200508BEEC6FB033776C9@zanexch.zantaz.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-14740-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <12C7D768CC8ED4118A9200508BEEC6FB033776C9@zanexch.zantaz.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Fong Vang <FVang@Zantaz.com>
Cc: 'Hans Reiser' <reiser@namesys.com>, "'reiserfs-list@namesys.com'" <reiserfs-list@namesys.com>

Hello!

On Fri, Jun 27, 2003 at 09:07:05AM -0700, Fong Vang wrote:
> Once the write to the file is CLOSED the file should not be modifiable in
> any way.  It should not be writeable by root.  Ideally, this should be
> across reboot and across kernel.  The current requirement is that as long as
> the modified kernel/reisefs is being used then it should NOT be modifiable
> (if a kernel allowing modification is used then it could allow
> modifications).

So basically do you think it would be better for you to have "write-once flag" in superblock
that will make all files to be unwritable (except newly created ones) as opposed to a simple
mount option that you'd use for filesystems with non-changeable files?
(you need to mark filesystems that are in write-once mode somehow, because I think
you do not need all reiserfs filesystems to be run in this mode, right?)
Also concerning the "root should not be able to change the files", root
will be able to overwrite files by using block devices if he'd want to.

Bye,
    Oleg
