From: Jose R R <Jose.r.r@metztli-it.com>
Subject: Re: Reiser4-enabled Debian Unstable (Sid) netboot iso
Date: Wed, 6 Jan 2016 05:42:10 -0800
Message-ID: <CAM12Q5Q_pdr27TEr4ZRY+2ZVG_VYfhZ6AeEHQyPatOL7UVXUXQ@mail.gmail.com>
References: <CAM12Q5QLgEgzb6uh_JPDMv69ZK18N5uceZOTaqx_dh1n1qXXag@mail.gmail.com>
	<20160106152102.21774e48@Ulf.tvoe.tv>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metztli-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:content-type;
        bh=MFEgTfwfJ5yYeN2esaeRoJ0wESnuZc1pC394Y5JxAO4=;
        b=C0qGpjZjEvzh8k0e+8mYA5qeBcfirOIahmp1iFBEjyPdc+xNDOqbKlzhVEAXEZiYjP
         CqNDhthPWS0sGujnQOhIVsnBUaJ3D6zBDgYlpDLA2rBp4XeYsNM4/1qz9IiwLMg55usM
         T9pn42jf6XHFdmv0rD51R4PgftV9u2c7u3Oj4RT/fRmLKHpMaz5oDbO+v5vWTAZXQM9L
         7a7Lbu4L1ixsCOwL6ujPwYdlYzJXCXrdARGudLbsOu7hf0FT/VCeJ/ZEDj66Q321TJSS
         cw/W3iSsk0bsoiylj8MADvGxIy7xUtxUch5dcLzpHNjiyvDaXT2lzAtFdeawbvBmxn6D
         CTmQ==
In-Reply-To: <20160106152102.21774e48@Ulf.tvoe.tv>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel <reiserfs-devel@vger.kernel.org>, debian-boot@lists.debian.org

On Wed, Jan 6, 2016 at 4:21 AM, dimas <dimas000@ya.ru> wrote:
> great job, man!
Appreciated.

>
>> As for Stretch and Sid, manual intervention is required only to modify
>> /etc/initramfs-tools/modules file by adding at the end:
>> crc32c_intel
>> reiser4
>> *before* installing the custom Reiser4 kernel, thus:
>> dpkg -i linux-image-4.3.0-1-amd64_4.3.3-5_amd64.deb
> why dion't you do that by postinst trigger, before update-initramfs one? or
> modify upd-initrmfs trigger, adding couple of lines...
I have built a modified version of initramfs-tools package that has as
default those Reiser4 -specific settings
but wanted to allow d-i to select most of its packages from regular
Debian repositories.

I will keep in mind your suggestion while I think about improving the
user experience, though. Thanks.
>
>> dpkg -i parted_3.2-12_amd64.deb libparted2_3.2-12_amd64.deb
> would be much more comfortable, if you add "reiser4" to the package version.
> like "x.y.z-n+reiser4". or maybe even name a package "parted-reiser4", with
> smth like "provides: parted" and "conflicts: parted", so that it won't be
> overwritten by original version on upgrade, but satisfy dependencies on "parted"

That suggestion is probably fine for the reiser4-parted DEBs but the
kernel included in d-i is 'picky' and I have not had luck changing its
name to something other than *official* Debian because d-i then
refuses to install from the Debian repositories.

Notwithstanding, one way that I have prevented overwriting
Reiser4-enabled Debian packages is by placing a *hold* on them, thus:

For the kernel, for instance:
echo "linux-image-4.3.0-1-amd64 hold" | dpkg --set-selections

And for Debian Parted:
echo "parted hold" | dpkg --set-selections
echo "libparted2 hold" | dpkg --set-selections

And we can check for those packages effectively being on *hold* and
not replaced by Debian package manager, thus:

dpkg --get-selections | grep linux-image
dpkg --get-selections | grep parted

>
>> Although I have created patches for most (or all ;-) of the above at
>> GitHub, I realize Debian Unstable (Sid) is a fast moving development
>> effort and within a couple of weeks the kernel referenced above will
>> be outdated and d-i will refuse to install.
> hmm, not sure about d-i logic, but what's the problem with slightly older
> kernel? i'm running on 3.x (custom-setup r4 patched) on testing with no
> problems so far

After Debian is installed, a custom kernel version/name will survive
-- as well as an official kernel on *hold* ; however, during a *new*
Debian installation d-i seems *very* picky about matching
kernel/changelog version(s) with packages in repositories.

-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
---------------------------------------------------------------------------------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
---------------------------------------------------------------------------------------------
