From: Jose R R <Jose.r.r@metztli-it.com>
Subject: Re: Reiser4-enabled Debian Unstable (Sid) netboot iso
Date: Mon, 11 Jan 2016 02:39:14 -0800
Message-ID: <CAM12Q5QD1eutt96jPcYAfuMc4+TyvwWQpUi0JBpB2ozG=HKwGA@mail.gmail.com>
References: <CAM12Q5QLgEgzb6uh_JPDMv69ZK18N5uceZOTaqx_dh1n1qXXag@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metztli-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:sender:in-reply-to:references:date:message-id:subject
         :from:to:content-type;
        bh=CmKr10mLsgghvxHRVFcOj24cg/5whTyi5WKKXY1h+HA=;
        b=tCS6eWsHBJ/NyA/iBM8QRXu20b43pCLm8yTYqOjJ8lK2iciUNhZ+BHSu2Vswoj1aOK
         TE3Stwln/2Usq9wF5yW+S/IUi6GlTnDKP/rhBPVSIXXu8hJCIZJLkWgBx43lFXQTm+pJ
         zpnLFYaELqAVMbslT4RMkbqZTVP0YvcPbnRyOgPWKBLUhYzGD2PwIwaU66Xk4HcEMmIn
         fTQSOGXgZsalXRc3eT3ZkCXzWrSZ5BKJCvTSkmIBqzob4+eftbUXa28e1WbgSemtzAE2
         0FgKdDM3r0KN0d0C1jXuMtFiujsyAI424E2lB4LDksink/odnpwdioDM5FXp8KujnPOq
         EahA==
In-Reply-To: <CAM12Q5QLgEgzb6uh_JPDMv69ZK18N5uceZOTaqx_dh1n1qXXag@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>, debian-boot@lists.debian.org, debian-cloud <debian-cloud@lists.debian.org>

(2/3) Reiser4 version 4.0.1 -enabled patches for Debian Installer
components and/or userland utilities:

On Wed, Jan 6, 2016 at 2:19 AM, Jose R R <Jose.r.r@metztli-it.com> wrote:
> Niltze, all-
>
> I have been building iterations of Debian-Installer (d-i) enhanced
> with Reiser4 4.0.1 kernel, disk and filesystem utilities. Thus far I
> have used a local build on Debian Sid of VirtualBox 5.0.10 environment
> to test multiple Reiser4 installations.
>
> For flexibility, especially if you are testing in a VM, the following
> d-i options may help:
>
> -Network-console: continue installation remotely using SSH
> -Openssh-client-udeb: secure shell client for the Debian installer
>
> Now:
>
> d-i offers three(3) choices:
>
> Jessie (stable)
> Stretch (testing)
> Sid (unstable)
>
> I have verified that *all* can be installed from my custom Reiser4
> d-i; Nevertheless Jessie (stable) needs access to testing and/or
> unstable repositories added at /etc/apt/sources.list in order to
> fulfill dependencies of the unstable kernel in my d-i. Jessie (stable)
> also needs to have newer Reiser4 4.0.1 packages because d-i downloads
> the older (stable) version. I have covered *all* of Jessie conditions
> by building newer unstable versions of its requirements. The downside
> of it is that a user needs to manually intervene at the shell,
> possibly at the expert level.
>
> As for Stretch and Sid, manual intervention is required only to modify
> /etc/initramfs-tools/modules file by adding at the end:
>
> crc32c_intel
> reiser4
>
> *before* installing the custom Reiser4 kernel, thus:
> dpkg -i linux-image-4.3.0-1-amd64_4.3.3-5_amd64.deb
>
> so that initramfs can be appropriately updated *before* rebooting the
> new Reiser4 installation.
>
> Note that GRUBX does not support booting from /boot Reiser4
> filesystem; accordingly, a small partition must be provisioned for
> booting into a Reiser4 -formatted root (/) partition. The d-i
> partman-reiser4 will format Reiser4 partitions thus:
>
> mkfs.reiser4 -yo "create=reg40" <your selected partition>
>
> Additionally, user may want to provision a /tmp in a non-Reiser4
> partition if the intention is to run MariaDB (MySQL) because -- at the
> very least -- the DB will complain about /tmp issues if it is
> formatted in Reiser4 --personal experience ;-)
>
> With the above said and warning that this is an alpha effort *without*
> any explicit and/or implied guarantee that will be risk-free, here is
> the current yield of of Reiser4 effort:
>
> Reiser4 -enabled Debian-Installer (d-i) netboot mini.iso renamed as:
> http://metztli.it/readOnlyEphemeral//metztli_it-reiser4_d-i.iso
>
> Reiser4 -enabled kernel & modules.README_1st:
> http://metztli.it/readOnlyEphemeral/linux-image-4.3.0-1-amd64_4.3.3-5_amd64.tar
>
> Reiser4 -enabled Debian GNU Parted packages (install at the end of
> installation procedure); please note that those packages under
> reiser4-parted_3.2-12/misc are optional):
> http://metztli.it/readOnlyEphemeral/reiser4-parted_3.2-12.tar
> (after untarring above referenced, install as)
> cd reiser4-parted_3.2-12
> dpkg -i parted_3.2-12_amd64.deb libparted2_3.2-12_amd64.deb
>
> Next resource is only needed if Jessie was installed. Package below
> will replace the older Reiser4 file utilities:
> http://metztli.it/readOnlyEphemeral/reiser4progs-4.0.1.tar
>
> Although I have created patches for most (or all ;-) of the above at
> GitHub, I realize Debian Unstable (Sid) is a fast moving development
> effort and within a couple of weeks the kernel referenced above will
> be outdated and d-i will refuse to install.
>
> With the previous statement said, and if anyone is willing, try the
> above Debian-Installer (d-i) resources while the kernel is fresh...
>
> Feedback and/or suggestions welcome.
>
>
> Best Professional Regards
>
>
> P.S I am already preparing some images for Google Compute Engine (GCE)
> < https://cloud.google.com/compute/ > to add to currently testing
> Reiser4 images created last year.

Reiser4 4.0.1 -patched partman-reiser4 component integrates Reiser4
support into menu-driven Debian-Installer (d-i) -- requires
reiser4-debian-parted

Included in repo:
https://github.com/Metztli/debian-partman-reiser4

This component source is hacked (literally) and does not exist
currently in Debian. It generates a UDEB that adds the Reiser4 option
to the Debian-Installer (d-i) menu. Please make sure to *also include*
in your d-i UDEBs generated from Reiser4 4.0.1 -enabled Debian.ized
GNU Parted; otherwise, d-i menu driven installation will fail.

-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
---------------------------------------------------------------------------------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
---------------------------------------------------------------------------------------------
