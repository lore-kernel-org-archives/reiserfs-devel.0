From: Clemens Schwaighofer <cs@tequila.co.jp>
Subject: Re: Desktop Filesystem Benchmarks in 2.6.3
Date: Fri, 05 Mar 2004 12:48:04 +0900
Message-ID: <4047F874.3000901@tequila.co.jp>
References: <3DF9165145FACB4C96977FF650C1E904096337AE@its-mail1.its.corp.gwl.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17088-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3DF9165145FACB4C96977FF650C1E904096337AE@its-mail1.its.corp.gwl.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Burnes, James" <james.burnes@gwl.com>
Cc: reiserfs-list@namesys.com, Felipe Alfaro Solana <felipe_alfaro@linuxmail.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Burnes, James wrote:
| I smell a troll, but oh well.  If you are happy with mediocre
| performance on substandard hardware, perhaps you don't need reiser after
| all.  In fact, I doubt you need ext3.

well, its not about speed here. Its about reliable home systems. If I
get all the speed, but its not reliable on a bad black (eg that I can't
mount the partition after a reboot), then it's just horrible. In a
normal company you have a RAID, and as I said, you don't care about bad
blocks here.

| Some people are happy with poor performing hardware at home.  "Pearls
| before swine", I always say.  I suppose they would also be happy eating
| Wonderbread that fell on a dirty kitchen floor.

Again its not about performance. Its abour reliability of the File
System. That Raiser FS kicks ext3 ass (literaly) when compared to manage
a lot of small files (maildir), then I know that, because I used
raiserFS in my old companies mailserver. But at home I don't use
maildir, I use mailbox (from mozilla) and I have crappy old hardware,
therefore I need not a sofisticated file system, but one that can
withstand a bumpy country road.

| Five second rule!
|
| (jeez talk about cross-posting.  Lemme cut some of those out before I
| cross post to the world)

perhaps cut alos the TOFU ... ;)

btw, I am not a troll, seriously not, not even close. I don't even like
red hering ...

- --
Clemens Schwaighofer - IT Engineer & System Administration
==========================================================
Tequila Japan, 6-17-2 Ginza Chuo-ku, Tokyo 104-8167, JAPAN
Tel: +81-(0)3-3545-7703            Fax: +81-(0)3-3545-7343
http://www.tequila.jp
==========================================================
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.4 (GNU/Linux)

iD8DBQFAR/hzjBz/yQjBxz8RAl72AJ9/hC5fGjBA3WiTsp/b8uEHonyuqwCfYavO
hIljfV6u61DRpdjohWwp3FA=
=nqsS
-----END PGP SIGNATURE-----
