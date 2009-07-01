From: Arend Freije <afreije@inn.nl>
Subject: Re: Query on booting reiser4 and grub or grub2.
Date: Wed, 01 Jul 2009 23:12:58 +0200
Message-ID: <4A4BD15A.7030701@inn.nl>
References: <fffbfbb2db7d46de46d07d2717243de3@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <fffbfbb2db7d46de46d07d2717243de3@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: doiggl@velocitynet.com.au
Cc: Reiserfs devel <reiserfs-devel@vger.kernel.org>

doiggl@velocitynet.com.au wrote:
> Hello,
> Has anyone got information on, written anything or knows where to locate
> information on booting a reiser4 partition with grub or grub2 ?
> Thanks Glenn
>   
Hi Glenn,

If you mean installing grub on a Reiser4 partion: used it a few years
ago on my Gentoo based systems. Stopped using it because it was not
entirely stable, and apart from that it is nice to have a boot partition
that can be accessed with a rescue disk that doesn't have Reiser4
support, so I now use ext2 for /boot.

See:
http://sys-admin.org/Reiser4-Gentoo-Sources.html
    for instructions, on the bottom of the page there are some notes on
Grub.
http://gentoo-overlays.zugaina.org/zen-overlay/portage/sys-boot/grub-reiser4/grub-reiser4-0.97.20050808.ebuild
    for an ebuild
http://ftp.icm.edu.pl/packages/linux-reiserfs/reiser4progs/
    for a patch on grub 0.97 (original location was
ftp://ftp.namesys.com/pub/reiser4progs/ )

Cheers,

Arend
