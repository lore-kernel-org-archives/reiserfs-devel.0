From: Oleg Drokin <green@namesys.com>
Subject: Re: umount --force fails
Date: Thu, 10 Apr 2003 12:12:04 +0400
Message-ID: <20030410121204.A21845@namesys.com>
References: <715903125.20030409223847@tnonline.net>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-13630-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <715903125.20030409223847@tnonline.net>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Anders Widman <andewid@tnonline.net>
Cc: reiserfs-list@namesys.com

Hello!

On Wed, Apr 09, 2003 at 10:38:47PM +0200, Anders Widman wrote:

>    Why can't I use "umount /mnt/disk --force"?

It is only implemented for NFS. At least that's what my man page says.

>    Is there a way that I can get around this? I thought that "--force"
>    would  force  an umount of the filesystem even if some program were
>    using it?

I think it is possible to do that for any fs, but some decisions should be made like
what to do with processes having open filehandles/cwd to the mounted filesystem and so on.
Please consult lkml archives for more info on that topic.

Bye,
    Oleg
