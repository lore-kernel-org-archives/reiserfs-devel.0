From: "bmoon" <bo@anthologysolutions.com>
Subject: Re: Mount and file system size issue
Date: Thu, 7 Nov 2002 16:30:17 -0800
Message-ID: <031301c286be$0384ac90$6a01a8c0@bmoon>
References: <8287102CFE5C31418556A13A4E5BEE91E95A77@sphynx.git.compgen.com> <3CFFB2CA.6020300@namesys.com> <001201c20d9e$73e5d070$5701a8c0@bomoon> <20020607112121.C12869@namesys.com> <000801c20e3a$df840b20$5701a8c0@bomoon> <20020607200220.A1657@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-11947-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Oleg Drokin <green@namesys.com>
Cc: reiserfs-list@namesys.com

Reisers,

I have three questions related with this 4 months old issue.

- Still reiser2 or reiser4 do not support "on demand" bitmap read?
- What is the supporting block size on reiser2, and reiser4?
- I am going to build one big volume(LVM) out of 8 IDE disks and make
reiserfs on it.
  Where does the system write the meta data(super block, bitmap,..) into?
Will it copy the same meta data on each disk?

Thanks,

Bo
----- Original Message -----
From: "Oleg Drokin" <green@namesys.com>
Subject: Re: [reiserfs-list] Mount and file system size issue


> Hello!
>
>    reiserfs reading all of the bitmaps immediately and stick bitmaps in
the RAM.
>    So if reading all of the bitmaps on 120G volume, that means
>    reading 960 4k sectors off the media (each 32M there is bitmap on
disk).
>    That would eat at least 4 megabytes of RAM.
>    Actually if you can do a profiling to see what reiserfs does during
mounting,
>    that would be interesting.
>    Also you have not answered what kind of media you are using.
>
>    ext2/3 read bitmap blocks on demand on the other side.
>
>

