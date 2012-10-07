From: <doiggl@velocitynet.com.au>
Subject: Re: Here is a plain kernel based on 3.5.3x with the reiser4 patch enabled.
Date: Sun, 07 Oct 2012 22:44:44 +1100
Message-ID: <38aa20a44f76db20b4697970932254a1@mail.velocitynet.com.au>
References: <c028bdca48574d32efa93850d06130a4@mail.velocitynet.com.au> <alpine.DEB.2.01.1209241425450.10880@trent.utfs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.01.1209241425450.10880@trent.utfs.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

On Mon, 24 Sep 2012 16:26:17 -0700 (PDT), Christian Kujau
<lists@nerdbynature.de> wrote:
> On Tue, 11 Sep 2012 at 21:12, doiggl@velocitynet.com.au wrote:
>> Here is a plain kernel based on 3.5.3x with the reiser4 enabled, its
>> built
>> with the open build service [obs] system.
>> Report any problems to the list.
> 
> Finally got around to give it a try:
> 
> -----
> $ zypper addrepo
>
http://download.opensuse.org/repositories/home:/doiggl/openSUSE_12.2/home:doiggl.repo
> $ zypper install kernel-reiser4
> Problem: nothing provides mkinitrd >= 2.7.1 needed by
> kernel-reiser4-3.5.4-4.1.x86_64
>  Solution 1: do not install kernel-reiser4-3.5.4-4.1.x86_64
>  Solution 2: break kernel-reiser4-3.5.4-4.1.x86_64 by ignoring some of
its
>  dependencies
> -----
> 
> I chose "2" - why do you need mkinitrd-2.7.1 for this? openSUSE 12.2
comes 
> with mkinitrd-2.7.0 and installation & booting of the kernel went fine
so 
> far. Even mounting reiser4 partition succeeded, yay :)
> 
> Christian.
Hello,

mkinitrd 2.7.1 available from:
http://ftp5.gwdg.de/pub/opensuse/repositories/Kernel:/stable/standard/x86_64/mkinitrd-2.7.1-176.3.x86_64.rpm
Cheers Glenn

