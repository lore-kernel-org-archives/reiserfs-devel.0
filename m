From: Spam <spam@tnonline.net>
Subject: Re: nvram to protect fs during power loss?
Date: Fri, 31 Dec 2004 13:45:32 +0100
Message-ID: <273759260.20041231134532@tnonline.net>
References: <1062660450.20041231004008@tnonline.net>
 <20041231094126.GV1586@hvs.envisage.co.za>
Reply-To: Spam <spam@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-23002-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20041231094126.GV1586@hvs.envisage.co.za>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com


  Yes, I know that good hardware already do use battery backups and
  similar. But I was talking about normal consumer hardware; desktops,
  laptops, etc.

  I do not know how the internals of reiser4 works, but one of the
  problems said to be that it cannot be certain about the order and
  integrity of the data if a power failure occur. But if reiser4
  stored some kind of index number, key etc, on regular intervals then
  that could certainly help in recovering the filesystem to a working
  state.

  As it is now you can end up with a severely broken filesystem that
  doesn't even mount if you have a power failure. IMO a filesystem
  should do its best to protect the data on it. I thought that perhaps
  using NVRAM could aid in the recovery after the powerloss, instead
  of tossing a user "bad error, use --build-sb to fix" during next
  boot.

  ~S

 =20

> On Fri, Dec 31, 2004 at 12:40:08AM +0100, Spam wrote:
>>=20
>>   There have been some discussions about recovery abilities during
>>   power loss if write cache is enabled. Some recovery tool I saw once
>>   used NVRAM to store progress info so that if you had a power loss it
>>   would be able to resume.

> Typically specialized hardware, typically used for NFS (which is stateles=
s) doing
> "caching" of the writes to enhance performance.

>>   Perhaps it would be possible for Reiser4 to store some info, like
>>   time indexes etc in NVRAMwhen it send sync commands to the disk.
>>   This way it might be possible to avoid corruptions by simply
>>   verifying (fsck) the data stored after that time index etc?

> The way the journals/logs does??
=B4

--=20

