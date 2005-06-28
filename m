From: Hubert Chan <hubert@uhoreg.ca>
Subject: Re: How to user reiser4 and crypt plugin ??
Date: Tue, 28 Jun 2005 15:42:46 -0400
Message-ID: <87r7emnu89.fsf@evinrude.uhoreg.ca>
References: <Pine.GSO.4.58.0506281054200.2602@sysss01h> <42C16B43.7060706@namesys.com>
 <Pine.GSO.4.58.0506281133260.2602@sysss01h>
 <878y0updla.fsf@evinrude.uhoreg.ca> <42C1A3FD.6020207@slaphack.com>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-24773-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
Sender: news <news@sea.gmane.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-list@namesys.com

On Tue, 28 Jun 2005 14:24:45 -0500, David Masover <ninja@slaphack.com> said:

> Hubert Chan wrote:
>> But using a journaled filesystem on a device-based loopback should be
>> fine.

> Isn't dm-crypt the new way of doing this?

Yes and no.  dm-crypt is recommended over cryptoloop.  But there is also
loop-AES, which is more secure (in some modes) than dm-crypt (currently).

> Doesn't that actually prevent you from using a file as the backend?

Yes, I think so.

-- 
Hubert Chan <hubert@uhoreg.ca> - http://www.uhoreg.ca/
PGP/GnuPG key: 1024D/124B61FA
Fingerprint: 96C5 012F 5F74 A5F7 1FF7  5291 AF29 C719 124B 61FA
Key available at wwwkeys.pgp.net.   Encrypted e-mail preferred.

