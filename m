From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: How to user reiser4 and crypt plugin ??
Date: Tue, 28 Jun 2005 21:19:44 -0400
Message-ID: <878y0uez7z.fsf@evinrude.uhoreg.ca>
References: <Pine.GSO.4.58.0506281054200.2602@sysss01h> <42C16B43.7060706@namesys.com>
 <Pine.GSO.4.58.0506281133260.2602@sysss01h>
 <878y0updla.fsf@evinrude.uhoreg.ca> <42C1A3FD.6020207@slaphack.com>
 <87r7emnu89.fsf@evinrude.uhoreg.ca>
 <e692861c05062813152eff996a@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24783-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Tue, 28 Jun 2005 16:15:38 -0400, Gregory Maxwell <gmaxwell@gmail.com> said:

> On 6/28/05, Hubert Chan <hubert@uhoreg.ca> wrote:
>> > Isn't dm-crypt the new way of doing this?  Yes and no.  dm-crypt is
>> recommended over cryptoloop.  But there is also loop-AES, which is
>> more secure (in some modes) than dm-crypt (currently).

> There is now support for both LRW-AES and ESSIV in the mainstream
> kernel.  With ESSIV the security should be the same as loop-aes and
> with LRW-AES potentially better.

Thanks for the info.  I haven't look into the kernel for a little
while -- I'm still using a slightly older version.

> For the highest security you should also use the LUKS cryptosetup
> because it provides hardening for passwords.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

