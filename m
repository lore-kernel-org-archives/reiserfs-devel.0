From: Oleg Drokin <green@namesys.com>
Subject: Re: Mount and file system size issue
Date: Mon, 18 Nov 2002 09:30:54 +0300
Message-ID: <20021118093054.A964@namesys.com>
References: <8287102CFE5C31418556A13A4E5BEE91E95A77@sphynx.git.compgen.com> <3CFFB2CA.6020300@namesys.com> <001201c20d9e$73e5d070$5701a8c0@bomoon> <20020607112121.C12869@namesys.com> <000801c20e3a$df840b20$5701a8c0@bomoon> <20020607200220.A1657@namesys.com> <031301c286be$0384ac90$6a01a8c0@bmoon>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-12005-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
In-Reply-To: <031301c286be$0384ac90$6a01a8c0@bmoon>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bmoon <bo@anthologysolutions.com>
Cc: reiserfs-list@namesys.com

Hello!

On Thu, Nov 07, 2002 at 04:30:17PM -0800, bmoon wrote:

> I have three questions related with this 4 months old issue.
> - Still reiser2 or reiser4 do not support "on demand" bitmap read?

That's true for reiser3. reiser4 have on-demand bitmap reading,
but not unloading until umount as I remember.

> - What is the supporting block size on reiser2, and reiser4?

Right now due for simplicity reiser4 blocksize should be equal to
PAGE_CACHE_SIZE on underlying architecture.
reiser3 have 4096 bytes blocksize by default (this is the only supportted
blocksize for 2.4 kernel series). Other possible values are 1024, 2048, ...
and so on until you hit PAGE_CACHE_SIZE limit (Linux limit 4096 for x86,
8128 for Alpha, variable for ia64)

> - I am going to build one big volume(LVM) out of 8 IDE disks and make
> reiserfs on it.
>   Where does the system write the meta data(super block, bitmap,..) into?

Superblock will be at the beginning of volume and will probably be mapped to
first disk. Bitmaps are spread over the disk (the ferquency of bitmaps
on disk depends on blocksize).

> Will it copy the same meta data on each disk?

No, unless you use RAID1 stuff, and even then this copying will be done
not by reiserfs itself.

Bye,
    Oleg
