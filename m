From: Mira =?iso-8859-2?Q?Temp=EDr?= <mira@cekit.cz>
Subject: Re: reiserfsck --rebuild-tree on a big filesystem
Date: Mon, 25 Nov 2002 16:38:43 +0100
Message-ID: <20021125153843.GC19254@mail.cekit.cz>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-12041-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: reiserfs-list@namesys.com


(sorry, i forgot to post it back to list)

Hello and thanks for quick replies.

Oleg Drokin - 25/11/02 17:48 wrote:
| > But after 16 hours of running it, it is still on 0% and whole process=20
| > would take about 1 month to complete (started at 2000 blocks/sec,=20
| > but now running at 26b/s).
|=20
| This is very strange, We've seen reports of reiserfsck --rebuild-tree
| of 500Gb volume (filled to 170Gb) finished in 8 hours.

Can be the speed affected with high usage of FS (about 99%)?

One point that I've missed in previous e-mail: during rebuild-tree,
there is a lot of messages in log like this:
pass0: vpf-10700: block 1615323, item 6: The item with wrong offset or
length found [9532827 9534032 0x3001 DRCT (2)], len 1000 - deleted

I have no idea what to think about this.

| Can you please verify that the read speed of your RAID5 is constant in all
| the areas of disk, that it is not opearting in some kind of degraded mode
| and is generally in good state?

raid is reporting to be ok, data read speed are almost the same at
various places:
0:03.80elapsed 18%CPU
0:02.97elapsed 19%CPU
0:01.76elapsed 24%CPU
0:01.51elapsed 36%CPU
... (dd reading 40MBytes)

| What is the ARID5 hardware you are using?

3ware 7410 RAID5 of 4 IDE drives

| Data is recoverable for sure, but the speed degradation you are seeing=20
| is strange and I do not yet think it should be attributed to reiserfsck.

Yes, I'm affraid, I have to agree ... at least, I don't see any other
option.

Thanks anyway

--=20
   mira temp=EDr <mira@cekit.cz> -- =E8ekit s.r.o.
   bratislavsk=E1 2, 602 00 brno, czech republic
