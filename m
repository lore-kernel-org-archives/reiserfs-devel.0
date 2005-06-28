From: Gregory Maxwell <gmaxwell@gmail.com>
Subject: Re: How to user reiser4 and crypt plugin ??
Date: Tue, 28 Jun 2005 16:15:38 -0400
Message-ID: <e692861c05062813152eff996a@mail.gmail.com>
References: <Pine.GSO.4.58.0506281054200.2602@sysss01h>
	 <42C16B43.7060706@namesys.com>
	 <Pine.GSO.4.58.0506281133260.2602@sysss01h>
	 <878y0updla.fsf@evinrude.uhoreg.ca> <42C1A3FD.6020207@slaphack.com>
	 <87r7emnu89.fsf@evinrude.uhoreg.ca>
Reply-To: Gregory Maxwell <gmaxwell@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-24777-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <87r7emnu89.fsf@evinrude.uhoreg.ca>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Hubert Chan <hubert@uhoreg.ca>
Cc: reiserfs-list@namesys.com

On 6/28/05, Hubert Chan <hubert@uhoreg.ca> wrote:
> > Isn't dm-crypt the new way of doing this?
> Yes and no.  dm-crypt is recommended over cryptoloop.  But there is also
> loop-AES, which is more secure (in some modes) than dm-crypt (currently).

There is now support for both LRW-AES and ESSIV in the mainstream kernel.
With ESSIV the security should be the same as loop-aes and with
LRW-AES potentially better.

For the highest security you should also use the LUKS cryptosetup
because it provides hardening for passwords.
