From: "Gregory Maxwell" <gmaxwell@gmail.com>
Subject: Re: the " 'official' point of view" expressed by kernelnewbies.org regarding reiser4 inclusion
Date: Tue, 1 Aug 2006 13:04:56 -0400
Message-ID: <e692861c0608011004x2ac1d9fcu353cd8e0d72eaac4@mail.gmail.com>
References: <200607312314.37863.bernd-schubert@gmx.de>
	 <200608011428.k71ESIuv007094@laptop13.inf.utfsm.cl>
	 <20060801165234.9448cb6f.reiser4@blinkenlights.ch>
	 <1154446189.15540.43.camel@localhost.localdomain>
	 <44CF84F0.8080303@slaphack.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S1750866AbWHARFL@vger.kernel.org>
In-Reply-To: <44CF84F0.8080303@slaphack.com>
Content-Disposition: inline
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: David Masover <ninja@slaphack.com>
Cc: Alan Cox <alan@lxorguk.ukuu.org.uk>, Adrian Ulrich <reiser4@blinkenlights.ch>, "Horst H. von Brand" <vonbrand@inf.utfsm.cl>, bernd-schubert@gmx.de, reiserfs-list@namesys.com, jbglaw@lug-owl.de, clay.barnes@gmail.com, rudy@edsons.demon.nl, ipso@snappymail.ca, reiser@namesys.com, lkml@lpbproductions.com, jeff@garzik.org, tytso@mit.edu, linux-kernel@vger.kernel.org

On 8/1/06, David Masover <ninja@slaphack.com> wrote:
> Yikes.  Undetected.
>
> Wait, what?  Disks, at least, would be protected by RAID.  Are you
> telling me RAID won't detect such an error?

Unless the disk ECC catches it raid won't know anything is wrong.

This is why ZFS offers block checksums... it can then try all the
permutations of raid regens to find a solution which gives the right
checksum.

Every level of the system must be paranoid and take measure to avoid
corruption if the system is to avoid it... it's a tough problem. It
seems that the ZFS folks have addressed this challenge by building as
much of what is classically separate layers into one part.
