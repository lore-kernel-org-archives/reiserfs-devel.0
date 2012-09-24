From: Christian Kujau <lists@nerdbynature.de>
Subject: Re: Here is a plain kernel based on 3.5.3x with the reiser4 patch
 enabled.
Date: Mon, 24 Sep 2012 16:26:17 -0700 (PDT)
Message-ID: <alpine.DEB.2.01.1209241425450.10880@trent.utfs.org>
References: <c028bdca48574d32efa93850d06130a4@mail.velocitynet.com.au>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <c028bdca48574d32efa93850d06130a4@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org

On Tue, 11 Sep 2012 at 21:12, doiggl@velocitynet.com.au wrote:
> Here is a plain kernel based on 3.5.3x with the reiser4 enabled, its built
> with the open build service [obs] system.
> Report any problems to the list.

Finally got around to give it a try:

-----
$ zypper addrepo http://download.opensuse.org/repositories/home:/doiggl/openSUSE_12.2/home:doiggl.repo
$ zypper install kernel-reiser4
Problem: nothing provides mkinitrd >= 2.7.1 needed by kernel-reiser4-3.5.4-4.1.x86_64
 Solution 1: do not install kernel-reiser4-3.5.4-4.1.x86_64
 Solution 2: break kernel-reiser4-3.5.4-4.1.x86_64 by ignoring some of its dependencies
-----

I chose "2" - why do you need mkinitrd-2.7.1 for this? openSUSE 12.2 comes 
with mkinitrd-2.7.0 and installation & booting of the kernel went fine so 
far. Even mounting reiser4 partition succeeded, yay :)

Christian.
-- 
BOFH excuse #147:

Party-bug in the Aloha protocol.
