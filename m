From: lists@nerdbynature.de
Subject: Re: Here is a plain kernel based on 3.5.3x with the reiser4 patch
 enabled.
Date: Tue, 9 Oct 2012 15:59:28 -0700 (PDT)
Message-ID: <alpine.DEB.2.01.1210091549010.10880@trent.utfs.org>
References: <c028bdca48574d32efa93850d06130a4@mail.velocitynet.com.au> <alpine.DEB.2.01.1209241425450.10880@trent.utfs.org> <38aa20a44f76db20b4697970932254a1@mail.velocitynet.com.au>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <38aa20a44f76db20b4697970932254a1@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org

On Sun, 7 Oct 2012 at 22:44, doiggl@velocitynet.com.au wrote:
>> I chose "2" - why do you need mkinitrd-2.7.1 for this? openSUSE 12.2
>> comes with mkinitrd-2.7.0 and installation & booting of the kernel went fine
> 
> mkinitrd 2.7.1 available from:
> http://ftp5.gwdg.de/pub/opensuse/repositories/Kernel:/stable/standard/x86_64/mkinitrd-2.7.1-176.3.x86_64.rpm

Sure, I was just wondering why your package did _depend_ on 
mkinitrd-2.7.1, i.e. what features in mkinitrd are you relying on, that an 
older version of mkinitrd would not be sufficient?

Christian.
-- 
BOFH excuse #166:

/pub/lunch
