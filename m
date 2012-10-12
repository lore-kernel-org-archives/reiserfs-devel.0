From: <doiggl@velocitynet.com.au>
Subject: Re: Here is a plain kernel based on 3.5.3x with the reiser4 patch enabled.
Date: Fri, 12 Oct 2012 17:13:43 +1100
Message-ID: <e394bc8b39677b6d54ac58f3ca3f9031@mail.velocitynet.com.au>
References: <c028bdca48574d32efa93850d06130a4@mail.velocitynet.com.au> <alpine.DEB.2.01.1209241425450.10880@trent.utfs.org> <38aa20a44f76db20b4697970932254a1@mail.velocitynet.com.au> <alpine.DEB.2.01.1210091549010.10880@trent.utfs.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.01.1210091549010.10880@trent.utfs.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

On Tue, 9 Oct 2012 15:59:28 -0700 (PDT), lists@nerdbynature.de wrote:
> On Sun, 7 Oct 2012 at 22:44, doiggl@velocitynet.com.au wrote:
>>> I chose "2" - why do you need mkinitrd-2.7.1 for this? openSUSE 12.2
>>> comes with mkinitrd-2.7.0 and installation & booting of the kernel
went
>>> fine
>> 
>> mkinitrd 2.7.1 available from:
>>
http://ftp5.gwdg.de/pub/opensuse/repositories/Kernel:/stable/standard/x86_64/mkinitrd-2.7.1-176.3.x86_64.rpm
> 
> Sure, I was just wondering why your package did _depend_ on 
> mkinitrd-2.7.1, i.e. what features in mkinitrd are you relying on, that
an 
> older version of mkinitrd would not be sufficient?
> 
> Christian.

Hello,
I suspect it comes from this section in the spec file,
Cheers Glenn

source:https://build.opensuse.org/package/view_file?file=kernel-reiser4.spec&package=kernel-reiser4&project=home%3Adoiggl&srcmd5=c1f7ad8470fed45a842cabedd7589c2c

BuildRequires:  coreutils module-init-tools sparse
BuildRequires:  fdupes
Provides:       multiversion(kernel)
Provides:       %{name}_%_target_cpu = %version-%release
Provides:       %name = %version-%source_rel
%if %split_base
Provides:       kernel-base = %version-%source_rel
# Obsolete the -base subpackage from 11.1 and 11.2 development phase
Obsoletes:      %name-base <= 2.6.31
%endif
Requires(pre):  coreutils awk
# Need a module-init-tools with /usr/lib/module-init-tools/weak-modules2
Requires(post): module-init-tools >= 3.4
# This Requires is wrong, because the post/postun scripts have a
# test -x update-bootloader, having perl-Bootloader is not a hard
requirement.
# But, there is no way to tell rpm or yast to schedule the installation
# of perl-Bootloader before kernel-binary.rpm if both are in the list of
# packages to install/update. Likewise, this is true for mkinitrd.
# Need a perl-Bootloader with /usr/lib/bootloader/bootloader_entry
Requires(post): perl-Bootloader >= 0.4.15
Requires(post): mkinitrd >= 2.7.1

