From: David Masover <ninja@slaphack.com>
Subject: Re: online fsck
Date: Fri, 27 May 2005 17:50:36 -0500
Message-ID: <4297A43C.1010608@slaphack.com>
References: <263a8b350505231124758be936@mail.gmail.com>	<42930542.1000407@namesys.com>	<4293B817.5030906@accessplus.com.au>	<263a8b35050524200220eff78b@mail.gmail.com> <20050527091725.E7CC5BF6@philou.gramoulle.local> <4296E91E.5050505@darthvader.us>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-24179-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <4296E91E.5050505@darthvader.us>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Yiannis Mavroukakis <jander@darthvader.us>
Cc: reiserfs-list@namesys.com

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Yiannis Mavroukakis wrote:
> Philippe Gramoull=E9 wrote:
>=20
>> Hello,
>>
>> On Tue, 24 May 2005 22:02:20 -0500
>> btinsley <btinsley@gmail.com> wrote:
>>
>>  | What i'm looking for is a check on a reiserfs filesystem that is
>>  | mounted read-write. Many modern filesystems, especially those on NAS
>>  | devices, can run periodic background consistency checks on filesystems
>>  | with almost zero impact on performance. Some devices are reportedly
>>  | running these checks constantly, possibly correcting errors without
>>  | user intervention... even a notification to a sysadmin would be a good
>>  | feature.
>>
>> Last time i asked Hans about the possibility to have a --rebuild-tree
>> (for reiserfs) while the fs is online and mounted rw,
>> he told me to send 30.000 US Dollars in, and that it could eventually
>> be done ;)
>>
>> Sure lots of people would find this a killer feature, but someone will
>> definitely have to pay get such a feature implemented.
>>
>> Thanks,
>>
>> Philippe
>> =20
>>
> Then Hans should setup a paypal account for donations. I'd gladly give
> what I can spare, and I think so would a lot of people here.

I'd rather donate for a reiser4 online repacker.  By the time
something's fsck'd, so to speak, I'd rather take it offline and possibly
pull in backups.  But a repacker (even an offine one) and a resizer
(even an offline one) are two things that we even have in the Linux
ntfs-tools, and it's also something that people would have an immediate
use for.

Another killer feature would be to bring back metadata, or at least a
way to create special (plugin) files, and the ability to write certain
kinds of userland plugins, thus giving us FS-level support for things
like zipfiles.  Yet another killer feature would be stable crypto and
compression, and the ability to enable it only for certain directories.

And finally, there's the Windows port.  A full, stable Windows port,
using the ReactOS libs, under a licence which requires blatant
attribution, so that the user knows that they are using a third-party
filesystem.  This would certainly ease the migration to Linux, because
Reiser4 beats NTFS, and Linux doesn't really have reliable NTFS support
(captive is slow and crash-prone).

Think of the first feature and the last one together.  You shrink the
NTFS partition, create a new Reiser4 partition, copy your Windows files
over, nuke the NTFS partition, resize the r4 partition (backwards), and
your Windows is on Reiser4.  Next, you install Linux to a directory in
that r4 partition.  Now all your Windows files are accessible from Linux
and vice versa, until you stop dual-booting, in which case you don't
have to repartition or reinstall.

These are all good features, and they are all something I would rather
donate money towards than an online fsck.



-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (GNU/Linux)
Comment: Using GnuPG with Thunderbird - http://enigmail.mozdev.org

iQIVAwUBQpekPHgHNmZLgCUhAQK5pxAAkmVS/NzA2xDMuiNH2LCBSaUpGl/nbMzP
gV5XZgyBJOhmEEJR1EoOe+cftygooqwY+FuQZJ2HVqI12mm2BTpG9zxTwUmcqGw9
3wNBqHII1/VWthxTchChwvY+NppH9IKyvWOXSHvTOlce97WDsMu0wBBIxA+VbcfP
cNop/MiDFs37fjWNqXBVpl8WO6vNg+RPHjG4j0n8ljziPDJUY/9A3vBfLgXYzUQN
dXcw+xkPI4vN5W4HoNrnfJhwzHTyEd34sWpC6MdQO2uzxAmAlP8paruMpslozFP/
mqr24zMcOgWlisglyn5Zoc43098QqhvX0mJSoj4Z6C++bJWUn+FdCKxbUDfe3cCK
jtRhDJUPRA2kutT5VrcOQbuYuDrOtCbfeXHPnnfxI2DNjbj+wz5pEyMflJvskoyn
Arfb6z/zMDeblQFE2xYCE9GjbdaVzh0237G1RlukurvyDlitrejDSGEFCsoMv3Fn
9ljYTm5DXEkoBNS76SXmHR6/ZXSxor+Hyy6lhz0V762MWdZntmW9/7f8n4s60rcR
Kq0Q9ujJdllNBYTBwyIDriRJbXdL9FP6qhdPf9fD7shFGKbAk2uHoO6yoJ6bLjfm
jTUKWPeEgzRbZg8GSPnltJQnp5BZrPMNdpPcxNo/o68VprXppnKtZlTqXwbqREYr
BJa9XhP0Tdk=3D
=3D//7g
-----END PGP SIGNATURE-----
