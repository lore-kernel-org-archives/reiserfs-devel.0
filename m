From: Artur Makowka <juice@ursynow.2a.pl>
Subject: Re: Trouble with 2.6.13.4-reiser4-4
Date: Wed, 02 Nov 2005 15:58:45 +0100
Message-ID: <4368D425.6060109@ursynow.2a.pl>
References: <20051101015551.GA1059@148.Red-217-126-33.pooles.rima-tde.net.> <43670F5E.9030108@namesys.com>
Reply-To: juice@ursynow.2a.pl
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-26765-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <43670F5E.9030108@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: reiserfs-list@namesys.com

Hans Reiser napisa=C5=82(a):

>rvalles wrote:
>
> =20
>
>>I've been using reiser4 for a while (since last december). Recently,
>>I've upgraded from 2.6.12 to 2.6.13.4 patched with the reiser4 -4 patch
>>available on the namesys ftp.
>>For some reason, since using this kernel, every now and then the
>>filesystem hits the disk really hard for 15 seconds or so blocking IO
>>for a program or two (I guess those that triggered the problem) and
>>slowing down IO seriously for others. It may be triggered by something
>>as easy as pasting some text from firefox to a xterm running vim, and
>>the text won't get pasted until the HD hitting ends.
>>Just in case, I've booted a recent knoppix and ran the most recent fsck
>>(thank you unionfs and apt-get) on the partition. It fixed some little
>>stuff extents-related that didn't look serious at all. It didn't fix
>>this, tho.
>>Maybe it's worth noting that there are no reiser4 related errors or
>>warnings, nor IO related, on syslog.
>>I can provide more debug-related information on request. I'm looking
>>forward for a patch against plain 2.6.14 (not -mm, that breaks stuff I
>>need and is by itself far too unstable for my taste) to see if it fixes
>>anything, too.
>>Cheers.
>>=20
>>
>>   =20
>>
>We have a patch coming out any day now that will be a lot more stable
>than what is currently the latest.
>
>Vitaly, please label our latest as not very stable in the meantime.
>
>hans
>
>.
>
> =20
>
I have to agree with rvalles, as i also noticed very high LA and im=20
using latest reiser4 patch with 2.6.13.4 kernel. this is becouse of high=20
the I/O usage. I didnt know its reiser4 fault, but it seems logical (=20
other process are waiting for I/O and thats why so high LA )

becouse my machine had already high load anyways, so together with this=20
bug it caused few crashes, so im just wondering - how soon there is=20
going to be new patch, and is this issue already solved or beign worked on ?

i know the patch will be ready when its ready ;) but i have free hosting=20
server and until its resolved i cant turn on all services.

Also, there is nothing strange in logs. Also i have to say one good=20
thing about reiser4 - i had many crashes, some becouse of this bug, some=20
becouse server has very high load anyways, and reiser didnt delete or=20
corrupted even one file durning that. And i had to run --build-fs only=20
once or twice.
