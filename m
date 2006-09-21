From: David Masover <ninja@slaphack.com>
Subject: Re: reiser4 resize
Date: Thu, 21 Sep 2006 02:30:09 -0500
Message-ID: <45123F81.4040909@slaphack.com>
References: <eeng4b$i68$1@sea.gmane.org> <200609191723.01936.vs@namesys.com>	 <45102ED6.6080209@slaphack.com>	 <b5d90b2a0609200039g70c40f5bvb374b5f15b42988d@mail.gmail.com>	 <op.tf52pansd4os1z@localhost> <b5d90b2a0609200200s5838456bm618093395356390a@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-29952-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <b5d90b2a0609200200s5838456bm618093395356390a@mail.gmail.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Alexey Polyakov <alexey.polyakov@gmail.com>
Cc: =?ISO-8859-2?Q?=A3ukasz_Mierzwa?= <prymitive@pcserwis.net>, "reiserfs-list@namesys.com" <reiserfs-list@namesys.com>

Alexey Polyakov wrote:
> On 9/20/06, =A3ukasz Mierzwa <prymitive@pcserwis.net> wrote:
>=20
>> It's been proven that flushes are doing much more job then they should.
>> Not so long ago someone send a trace of block device io accesess during
>> reiser4 work and someone anylized it and said that some files or parts of
>> file where written over and over 200 times or so.

Wow.  I should go back and read that -- I assume this is being worked on?

>> a few months old filesystem that had been used often just shows a week
>> spot in reiser4, while downloading files with azureus with only 64KB of
>> data per second I got disk lid on almost all the time, swithcing to
>> rtorrent helped as it does not seem to call fsync ( I think I disabled
>> fsync in azureus).

Hmm, strange.  I am using Azureus, but I don't think it's fsync.  I can=20
try rtorrent, but there are several things I like about Azureus that=20
nothing else seems to do yet.

But also, Azureus didn't always do this.  In fact, I used it for several=20
months before I started having this problem.

> Ah, I see, if bittorrent calls fsync often, it's no wonder that
> reiser4 behaves badly. I had to preload libnosync for some of my
> programs that do fsync to avoid this.

Way ahead of you.  I noticed how much fsync performance sucked when=20
using vim, and I was sick of waiting 10 seconds every time I hit :w -- a=20
LOT of stuff can pile up in 2 gigs of disk buffer, and at the time,=20
Reiser4 fsync effectively just called sync.

I didn't know about libnosync (or it didn't exist yet, or didn't work,=20
I'm not entirely sure), so I was faced with either patching vim, which=20
had just been patched to _add_ fsync'ing, not to mention all the other=20
programs that might fsync too much;  patching glibc (huge, I don't=20
update it often, and I'd have no idea where to start);  or patching the=20
kernel.

I now keep backups, and I maintain and apply the following (STUPID,=20
DON'T TRY THIS AT HOME) patch to my kernel:

--- linux/fs/buffer.c   2006-08-15 20:40:36.504608696 -0500
+++ linux/fs/buffer.c.new       2006-08-15 20:42:35.877461264 -0500
@@ -366,12 +366,12 @@

  asmlinkage long sys_fsync(unsigned int fd)
  {
-       return __do_fsync(fd, 0);
+       return 0;
  }

  asmlinkage long sys_fdatasync(unsigned int fd)
  {
-       return __do_fsync(fd, 1);
+       return 0;
  }

  /*
