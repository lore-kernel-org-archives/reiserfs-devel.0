From: Oleg Drokin <green@namesys.com>
Subject: Re: How not to liquidate a company... (Upgrading from 2.2.x kernel (patched) to 2.4.x. [and testimonial])
Date: Thu, 20 Jun 2002 09:09:06 +0400
Message-ID: <20020620090906.A4279@namesys.com>
References: <IOELIGOBLCIAGKOJFKMBAECDCAAA.jsbragg@pacific.net.au>
Mime-Version: 1.0
Return-path: <reiserfs-list-return-10765-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Content-Disposition: inline
In-Reply-To: <IOELIGOBLCIAGKOJFKMBAECDCAAA.jsbragg@pacific.net.au>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Scott Bragg <jsbragg@pacific.net.au>
Cc: ReiserFS Mailing List <reiserfs-list@namesys.com>

Hello!

On Wed, Jun 19, 2002 at 11:58:14PM -0700, Scott Bragg wrote:

> I'd like to install a newer distribution on the system, but am not sure if
> there is an issue when switching from a system using a 2.2.16 kernel patched
> with ReiserFS to a 2.4.18 kernel.

Read Documentation/Changes from your 2.4.18 linux kernel source tree
to find out what utils should be upgraded to what versions, if you
are upgrading from 2.2.16 kernel.

> So, I have to install Linux on a new system disk, and would like to use
> Mandrake 8.1 (as I run this version on 12 systems I currently manage). So..
> can I just install Mandrake 8.1 and set up the 750Gb volume in fstab with
> reiserfs, or will it not be that simple?

If you are installing new system, then you have nothing to worry about.
Just make sure you run 2.4.18+ kernel (needed for reisergfs stability)
and also have reiserfsprogs-3.x.1b version of reiserfsprogs (Mandrake
seems to ship somewhat outdated version of these, so you'd need to upgrade this
component)

Bye,
    Oleg
