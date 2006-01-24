From: Roman I Khimov <rik@osrc.info>
Subject: Re: Reiser4 corruption (fsck.reiser4 broken?)
Date: Tue, 24 Jan 2006 23:48:22 +0300
Message-ID: <200601242348.25909.rik@osrc.info>
References: <200601242257.43836.rik@osrc.info> <43D68CB1.1050809@namesys.com>
Mime-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1380800.KayMTeAp45";
  protocol="application/pgp-signature";
  micalg=pgp-sha1
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-27853-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43D68CB1.1050809@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
To: reiserfs-list@namesys.com
Cc: Hans Reiser <reiser@namesys.com>, vitaly@thebsh.namesys.com

--nextPart1380800.KayMTeAp45
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

24 =D1=8F=D0=BD=D0=B2=D0=B0=D1=80=D1=8F 2006 23:23 | Hans Reiser:
> Our fsck guy (vitaly) is on vacation, I am really sorry to tell you
> this.  Can you keep the drive around until he gets back?

OK, I've just turned it off, so I won't touch it until that.

> Roman I Khimov wrote:
>
>> Well, quite an interesting feeling when you lost 80G of music and 100G
>> of other great stuff... Refreshing, I should say.
>>
>> OK, let me explain in detail what's happening here. I have a 250Gb HDD
>> in external IEEE1394 aka Firewire enclosure. It's encrypted via
>> dm-crypt (no partitions, from block #0 to the end) and, you can guess
>> it, I've placed a Reiser4 partition on it.
>>
>> I'm using -mm tree kernels and right now I have two of them for my
>> system - 2.6.15-rc5-mm3 and 2.6.15-mm4. The first one worked just fine
>> for me, but with second I've been experiencing some strange "Badness"
>> from kernel block level, which at that moment I had no time to
>> save/report/analyse. That was several times when using that external
>> HDD. I have no logs for it, sorry (I'm a bad user, I know...)
>>
>> So, despite of that "Badness" everything worked fine, I was using one
>> or another kernel depending on my mood. Until today, when I thought
>> "man, are you sure that everything is OK? Maybe it's time to make fsck
>> on that drive, you know, there is something you don't want to lose
>> there..."
>>
>> So, I've ran fsck.reiser4 on dm-mapped drive (with kernel
>> 2.6.15-rc5-mm3) and it said that there is 1 inconsistency found. Not
>> that bad for kernel "Badness", it recommended to run itself with
>> "--build-fs" parameter, I did so and... Lots of output on the screen,
>> some ~38000 files found and ~36000 files lost&found. Mounting my
>> drive, what's here?
>>
>> rik@pu-erh:/media/ext-250/lost+found> ls | wc -l
>> 34799
>>
>> And, of course, lots of files just disappeared. I see some of them in
>> "lost+found" directory, but some of them are corrupted - I've tried to
>> play one with "suspicious" size and mplayer just quit seconds later
>> with lots of "[mpeg4 @ 0x84b4e88]marker does not match f_code" errors.
>> That one was just fine week or so ago.
>>
>> As I've said, I'm a bad user with no logs for any of that actions
>> (didn't expected that one inconsistency can be source of such
>> badness). I'm not asking for help with data restoring (although I
>> would try anything to do that), it's all my fault, but the question is
>> - how can I help debugging the situation (if there is something to
>> debug at all), what info may I provide (I'm very useful without logs,
>> I know...)?
>>
>> Seems to me fsck.reiser4 is not that good at restoring file systems,
>>  because in those fragments in "lost+found" I clearly see parts of
>> files that were just fine yesterday.
>>
>> Reiser4progs version 1.0.4.
>>
>> [ searching a bit... ]
>>
>> Cool, newest version is 1.0.5. My fault... again. So, just tell me that
>> it's fixed in this version - I'll laugh at myself a little... ;-)

=2D-=20
                            Roman
 ,---------------------------. ,--------------------------.
/     http://www.3os.ru/      V    http://www.osrc.info/   \         .o.
\    mailto: rik@3os.ru       ^   mailto: rik@osrc.info    /         ..o
 `---------------------------' `--------------------------'          ooo
gpg --recv-keys 0xE5E055C3 --keyserver hkp://subkeys.pgp.net

--nextPart1380800.KayMTeAp45
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQBD1pKZXJ70z+XgVcMRAgU2AKC238jCB6sIj+Kt0v5BoEeLpqwhXACguRuN
HiNBkCGcvxlqzzQB2qvK9Gk=
=rfSD
-----END PGP SIGNATURE-----

--nextPart1380800.KayMTeAp45--
