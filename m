From: Jose R R <Jose.r.r@metztli-it.com>
Subject: Reiser4-enabled Debian Unstable (Sid) netboot iso
Date: Wed, 6 Jan 2016 02:19:26 -0800
Message-ID: <CAM12Q5QLgEgzb6uh_JPDMv69ZK18N5uceZOTaqx_dh1n1qXXag@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metztli-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:date:message-id:subject:from:to:content-type;
        bh=vHzybXwTIoF9r3Hw3YMz1YnSQn0cHiONM2diyTCaBSw=;
        b=OvIAjyENC5M3itzB4xl5y5fYZEYjJLBNS+ItfTAyXzc0nMWVdfi1kpbI3QY6k0MpeC
         ya9memZ4KWK+AZN366dJbjWtItPoEyPdjsd4QkT/owgOo2NvjK5liNBf1GrgZHqyqSXT
         DeZN+zr5d9sWpeQYbJiycSuL5OKMuyIMin0t1keTgGBIzyAoeDnzW2klDJ+XKtRdAQ4i
         fLOAPkqwbK5UkCl++chqCdc+ZW+wlNAdMv5PibIExF1PCrCjZSbG8oLbht1Mp3VZ+NL7
         062ypR80WtnNV39OhPaygOgAUvCWCkbxQKZZuPNosw2s1gm8ZSN3ZJ0WuZnkEjnTOQPc
         o4Nw==
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>, debian-boot@lists.debian.org, debian-cloud <debian-cloud@lists.debian.org>

Niltze, all-

I have been building iterations of Debian-Installer (d-i) enhanced
with Reiser4 4.0.1 kernel, disk and filesystem utilities. Thus far I
have used a local build on Debian Sid of VirtualBox 5.0.10 environment
to test multiple Reiser4 installations.

For flexibility, especially if you are testing in a VM, the following
d-i options may help:

-Network-console: continue installation remotely using SSH
-Openssh-client-udeb: secure shell client for the Debian installer

Now:

d-i offers three(3) choices:

Jessie (stable)
Stretch (testing)
Sid (unstable)

I have verified that *all* can be installed from my custom Reiser4
d-i; Nevertheless Jessie (stable) needs access to testing and/or
unstable repositories added at /etc/apt/sources.list in order to
fulfill dependencies of the unstable kernel in my d-i. Jessie (stable)
also needs to have newer Reiser4 4.0.1 packages because d-i downloads
the older (stable) version. I have covered *all* of Jessie conditions
by building newer unstable versions of its requirements. The downside
of it is that a user needs to manually intervene at the shell,
possibly at the expert level.

As for Stretch and Sid, manual intervention is required only to modify
/etc/initramfs-tools/modules file by adding at the end:

crc32c_intel
reiser4

*before* installing the custom Reiser4 kernel, thus:
dpkg -i linux-image-4.3.0-1-amd64_4.3.3-5_amd64.deb

so that initramfs can be appropriately updated *before* rebooting the
new Reiser4 installation.

Note that GRUBX does not support booting from /boot Reiser4
filesystem; accordingly, a small partition must be provisioned for
booting into a Reiser4 -formatted root (/) partition. The d-i
partman-reiser4 will format Reiser4 partitions thus:

mkfs.reiser4 -yo "create=reg40" <your selected partition>

Additionally, user may want to provision a /tmp in a non-Reiser4
partition if the intention is to run MariaDB (MySQL) because -- at the
very least -- the DB will complain about /tmp issues if it is
formatted in Reiser4 --personal experience ;-)

With the above said and warning that this is an alpha effort *without*
any explicit and/or implied guarantee that will be risk-free, here is
the current yield of of Reiser4 effort:

Reiser4 -enabled Debian-Installer (d-i) netboot mini.iso renamed as:
http://metztli.it/readOnlyEphemeral//metztli_it-reiser4_d-i.iso

Reiser4 -enabled kernel & modules.README_1st:
http://metztli.it/readOnlyEphemeral/linux-image-4.3.0-1-amd64_4.3.3-5_amd64.tar

Reiser4 -enabled Debian GNU Parted packages (install at the end of
installation procedure); please note that those packages under
reiser4-parted_3.2-12/misc are optional):
http://metztli.it/readOnlyEphemeral/reiser4-parted_3.2-12.tar
(after untarring above referenced, install as)
cd reiser4-parted_3.2-12
dpkg -i parted_3.2-12_amd64.deb libparted2_3.2-12_amd64.deb

Next resource is only needed if Jessie was installed. Package below
will replace the older Reiser4 file utilities:
http://metztli.it/readOnlyEphemeral/reiser4progs-4.0.1.tar

Although I have created patches for most (or all ;-) of the above at
GitHub, I realize Debian Unstable (Sid) is a fast moving development
effort and within a couple of weeks the kernel referenced above will
be outdated and d-i will refuse to install.

With the previous statement said, and if anyone is willing, try the
above Debian-Installer (d-i) resources while the kernel is fresh...

Feedback and/or suggestions welcome.


Best Professional Regards


P.S I am already preparing some images for Google Compute Engine (GCE)
< https://cloud.google.com/compute/ > to add to currently testing
Reiser4 images created last year.
-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
---------------------------------------------------------------------------------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
---------------------------------------------------------------------------------------------
