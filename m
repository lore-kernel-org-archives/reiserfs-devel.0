From: Vladimir Saveliev <vs@namesys.com>
Subject: Re: Reiser4 breaks (Debian's ?) module-init-tools
Date: Wed, 06 Oct 2004 11:39:35 +0400
Message-ID: <1097048374.1887.35.camel@tribesman.namesys.com>
References: <20041004235826.09ed7a00@rayanne>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22006-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20041004235826.09ed7a00@rayanne>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pierre Etchemaite <petchema@concept-micro.com>
Cc: reiserfs-list@namesys.com

Hello

On Tue, 2004-10-05 at 01:58, Pierre Etchemaite wrote:
>         Hi,
> 
> On an (almost) fully Reiser4 system, /etc/modprobe.d/ contents seem to
> be disregarded. When tracing modprobe, each file in this directory is
> opened as a directory, that looks a lot like the Apache
> compatibility bug.
> 
> open("/etc/modprobe.d/autofs", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = 4
> fstat64(4, {st_mode=S_IFREG|0644, st_size=64, ...}) = 0
> fcntl64(4, F_SETFD, FD_CLOEXEC)         = 0
> getdents64(4, 0x8063e3c, 65536)         = -1 ENOTDIR (Not a directory)
> close(4)                                = 0
> 
> Looking closer, it's not limited to that directory:
> 
> open("/lib/modules/2.6.8.1/modules.alias", O_RDONLY|O_NONBLOCK|O_LARGEFILE|O_DIRECTORY) = 3
> fstat64(3, {st_mode=S_IFREG|0644, st_size=27353, ...}) = 0
> fcntl64(3, F_SETFD, FD_CLOEXEC)         = 0
> getdents64(3, 0x804f0ac, 65536)         = -1 ENOTDIR (Not a directory)
> close(3)                                = 0
> 
> module-init-tools v. 3.1-pre5-7 (Debian testing)

Would you please try whether this patch fixes the problem?
ftp://ftp.ru.kernel.org/pub/linux/kernel/people/akpm/patches/2.6/2.6.9-rc3/2.6.9-rc3-mm2/broken-out/reiser4-disable-pseudo.patch

