From: "=?utf-8?B?SW5nbyBSw7bDn2xlcg==?=" <roessler@gmx.de>
Subject: Re: cannot mount /dev/hdc1
Date: Tue, 25 Feb 2003 20:14:14 +0100
Message-ID: <00bb01c2dd02$165cf8a0$5e01a8c0@roessler.dnsalias.net>
References: <001701c2dcdf$6cc60650$5e01a8c0@roessler.dnsalias.net> <200302251848.05924.vitaly@namesys.com> <008501c2dcfb$ffcc0d20$5e01a8c0@roessler.dnsalias.net> <200302252154.40034.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-list-return-12923-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: reiserfs-list@namesys.com

Hi Vitaly,

> On Tuesday 25 February 2003 21:30, Ingo Rößler wrote:

> Do you mean that you get the partition mounted somehow? Or it could be
mounted
> for some time after the reset, and smth happened again and it cannot be
mounted
> anymore? Could you tell about it in more details please.

The hardreset was a few days ago.
The partition could be mounted.

But yesterday night I have the crash. Yet I cannot mount the partition.

> Could you also send what does fdisk -l /dev/hdc say?

Platte /dev/hdc: 80.0 GByte, 80026361856 Byte
255 Köpfe, 63 Sektoren/Spuren, 9729 Zylinder
Einheiten = Zylinder von 16065 * 512 = 8225280 Bytes
Gerät    boot.    Anfang    Ende    Blöcke        ld    Dateisystemtyp
/dev/hdc1            1            9729    78148161    83    Linux

Is it a problem?

Ciao Ingo

