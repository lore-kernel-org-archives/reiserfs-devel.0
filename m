From: David Masover <ninja@slaphack.com>
Subject: Re: Congratulations! we have got hash function screwed up
Date: Thu, 30 Dec 2004 23:59:16 -0600
Message-ID: <41D4EAB4.9040301@slaphack.com>
References: <77912E9FD42896419D1CEF15E1C397A58AFCF1@london.jaguarfreightservices.local>	<m38y7gx8kq.fsf@merlin.emma.line.org>	<20041230235911.4911a20c.hihone@bigpond.net.au>	<m3sm5nj2ef.fsf@merlin.emma.line.org> <87is6jpvdu.fsf@quasar.esben-stien.name> <41D4602D.2050609@namesys.com> <41D4CFEF.609@slaphack.com> <41D4D4ED.9010603@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-22997-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <41D4D4ED.9010603@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: Esben Stien <b0ef@esben-stien.name>, Matthias Andree <ma@dt.e-technik.uni-dortmund.de>, hihone@bigpond.net.au, reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Hans Reiser wrote:
| David Masover wrote:
|
|> Hans Reiser wrote:
|>
|>> Esben Stien wrote:
|>>
|>>>
|>>> I really don't like that there is no undelete feature in reiserfs -
|>>> it's not planned for reiserfs-4 either.
|>>>
|>> Blame Linus for that.  I would put it in, but he thinks it belongs in
|>> userspace.  I may still put it in someday and just not tell him.;-)
|>> I'll just let the users know about it and not him.;-)
|>
|>
|>
|> He has some good points, though.  If you're going to have a kernel,
|> you want to keep it small, put stuff in only if it needs to be there.
|> And how much speed do we lose by putting stuff in userspace, if we do
|> it right?  C'mon, if Doom 3 can run in userspace, surely some sort of
|> trash can / recycle bin can, right?
|>
|> Oh wait... Gnome/KDE already do that.
|>
|>
|>
| the problem being that everyone uses rm not the gnome/kde trashcan....
| literal copying of Apple doesn't work for unix because we use shells
| most of the time.

"we" being people who should be able to back things up and avoid really
stupid mistakes, and people who care about performance.

But you are right, this has to be lower down -- maybe glibc, maybe vfs,
maybe fs views -- because there's no standardization once you get to
things like gnome.

My point about Doom 3 is that I like the idea of a microkernel, if it
could be done fast enough.  Games talk to kernel space and hardware very
quickly, but it seems kernel-userspace communication isn't fast enough
for things like filesystems.

Maybe someone can engineer a way around that?
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.2.6 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQdTqswisZLIF6uqOAQKczQ/8DeKVlFL5cS+KXnBaq9+w+rBkpak/LRld
1gyIyp4s0mVdpRNTGa5W2YPB0McOZj5TDUVZivAKScbd1srsV1QxlhUxzY6QMUwo
7Y9k+yJbm0J89Tnrap2DJmE/teN40Rw4thY5VyQ5cfugNFZtdrwgRsKqvsxV4cOQ
lIOci7SJuLUdgdtfLWORyEdYSe180P9XJMaGTxoVYSnwnBMbXX5C33OOVmJjEvU7
Pevro6GcfOvALj+ciI3AtvhdCbyasrevgfc1K/iZk3MwQFZKXRUtW5LcT1Lwax08
acn4n6f5ZhEQJWarv93EOn0T6KfXuD0uY9GbNRJS/ldPUg4tCaw3RfzVgdvpUVlw
uI+hPXsVpEGDyBm1aK3TQ30brUzBx/ILgblQvCe4QuHH5NWb63I0xPKbmqqmCdCR
cx06b3cbBCgO6QK3gqURHdyeQjlpJL92EXARmYLFjAnAicnKG95N4QiZsHIIuGvn
9iQcAS0bfU+elPbnfeiJnRTfEU6i1eLwSmsYo0i1m80U58TW604Dcfv2RcQrtluw
96eO9VB++8QWpl2Tv4G7u9yFrmOcx4Vo1tVkbFoPZvsP5sMqY6XhKowX5uWLjkwQ
hiAWb57HKxUTaPcW6CyGh+zr8g+Z8Po7TRA1GcdNMZZBfgNcAlZvlSDmOw7BHlMj
ixpwaj2lWYU=
=Z6t0
-----END PGP SIGNATURE-----
