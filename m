From: Vince <fuzzy77@free.fr>
Subject: Re: Snapshot against 2.6.1 released.
Date: Tue, 20 Jan 2004 23:32:18 +0100
Message-ID: <400DAC72.1060502@free.fr>
References: <16396.11375.115895.934750@laputa.namesys.com>	<20040120080223.2921.qmail@web21505.mail.yahoo.com> <16396.64924.478222.923131@laputa.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16591-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <16396.64924.478222.923131@laputa.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Nikita Danilov <Nikita@Namesys.COM>
Cc: reiserfs-list@namesys.com

Nikita Danilov wrote:
> Paolo Correnti writes:
>  > I have the same "Domenico's problem":
>  >  - downloaded Kernel 2.6.1
>  >  - applied SNAPSHOT 2004.01.19 FIXED
>  >  
>  > Trying to mount Reiser4 partition all I obtain is:
>  > 
>  > Wrong Master Super Block Magic
>  > fs/reiser4/init_siper.c line 166
> 
> My apology for everyone for missing this bit in the READ.ME:
> 
> you have to re-create your file-systems with mkfs supplied with this
> snapshot.
> 

Is it really mandatory to re-create or will a "fsck.reiser4 --build-fs" 
be able to fix the filesystem to the new format ? (the data on my 
reiser4 partition is not important at all, but i'd like to avoid erase 
it if possible).

By the way, a small complaint: it would be nice to update the version 
numbers the next time there are changes, as e.g. for libaal-0.4.15, a 
diffstat with libaal-0.4.15 from the previous snapshot gives something like:

[...]
  src/bitops.c            |    2
  src/block.c             |    2
  src/debug.c             |    2
  src/device.c            |   12 -
  src/exception.c         |    2
  src/file.c              |    2
  src/gauge.c             |    2
  src/hash.c              |    2
  src/libaal.c            |    4
  src/list.c              |    2
  src/malloc.c            |    2
  src/print.c             |    2
  src/stream.c            |    2
  src/string.c            |   21 --
  src/ui.c                |    2

And the diff for reiser4progs-0.4.20 looks huge...  8-o

Vince
