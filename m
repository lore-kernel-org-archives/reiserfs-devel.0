From: Christian Mayrhuber <christian.mayrhuber@gmx.net>
Subject: Re: data logging and kernel 2.4.20
Date: Tue, 6 Jul 2004 13:36:39 +0200
Message-ID: <200407061336.39535.christian.mayrhuber@gmx.net>
References: <200407051213.05033.fjcabello@visual-tools.com> <200407061058.12918.christian.mayrhuber@gmx.net> <200407061256.38512.fjcabello@visual-tools.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <reiserfs-list-return-19528-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200407061256.38512.fjcabello@visual-tools.com>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-9"
To: Francisco Javier Cabello Torres <fjcabello@visual-tools.com>
Cc: reiserfs-list@namesys.com

On Tuesday 06 July 2004 12:56, you wrote:
> > I can confirm that these patches work reliable on 2.4.26.
> > (At least on the two intel servers it's used on.)
>
> what's the reason for use 2.4.26 instead of 2.4.25? I say it because suse
> patch (datalogging) has been made with 2.4.25.

Security exploits:
http://www.cve.mitre.org/cgi-bin/cvekey.cgi?keyword=3Dlinux+kernel
As you can see there are already new ones for 2.4.26, which are
only fixed in 2.4.27-rc3.

The patches do no harm on 2.4.26:
>From:=20
>Vladimir Saveliev <vs@namesys.com>
>Date:=20
>21.04.2004 11:22
>Hello
>
>On Wed, 2004-04-21 at 12:31, m.evers@norplex.net wrote:
>> Helo,
>> =A0
>> i would like to know where i can get those patches for Kernel 2.4.26.
>
>Patches from
>ftp://ftp.suse.com/pub/people/mason/patches/data-logging/2.4.25
>apply to 2.4.26 just fine
>
>> =A0
>> Thank You

=2D-=20
lg, Chris
