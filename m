From: Jose R R <Jose.r.r@metztli-it.com>
Subject: Re: Integrate fully partman-reiser4 into d-i
Date: Sun, 20 Sep 2015 07:40:37 -0700
Message-ID: <CAM12Q5Q2GQSqE2ehj2dAmkq4ffP=x3__F76dH7KOey=vVAkQOA@mail.gmail.com>
References: <CAM12Q5QKdpHgMG_qGyhE-abO6R-uY6cKtv-5Qg36N-FTx_Z8Lw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <CAM12Q5QKdpHgMG_qGyhE-abO6R-uY6cKtv-5Qg36N-FTx_Z8Lw@mail.gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: debian-boot@lists.debian.org, ReiserFS Development List <reiserfs-devel@vger.kernel.org>
Cc: Cyril Brulebois <kibi@debian.org>, Ben Hutchings <ben@decadent.org.uk>

I have realized that although partman-reiser4 udeb enables Reiser4 to
be listed as an option during the Debian-Installer routine of a
netboot ISO image, the lack of support for reiser4 in GNU Parted
(Debian's libparted) prevents installation from the GUI interface.

Moreover, it is clear that although btrfs came *after* Reiser4, the
former had the support of the debian installer team -- which produced
a patch relatively quickly-- but the latter was scorned for whatever
reason and/or undeserved reputation.

Accordingly, although I have been able to generate *all* required
UDEBs to enable the Debian-Installer to format and install Debian into
a Reiser4 root partition, using the GUI interface which makes use of
libparte to accomplish the task is not possible.

On the other hand, using my Reiser4-enabled Debian-Installer netboot
ISO image and selecting "expert install", I successfully installed
Debian into a root partition. Using the menu driven interface, I
initially formated the root partition into JFS -- to satisfy the
installer routine. Then, prior to the "install the base system" menu
option, I opened a shell and tarred the /target/etc/fstab, umounted
the JFS root partition, reformatted: mkfs.reiser4 -o "create=reg40"
/dev/sdaX

Subsequently mounted newly created Reiser4 root partition into
/target; untarred /target/etc/fstab and used nano editor to modify
/etc/fstab -- changing jfs to reiser4 and went back to "install the
base system" interactive menu. Thus Debian routine interface does not
notice the change and the base system installation continues.

There are still some wrinkles to iron out but hopefully I will later
make available a more polished d-i derived Reiser4 Debian-Installer.

Thank you all for your help.


Best Professional Regards.



On Fri, Aug 28, 2015 at 3:56 AM, Jose R R <Jose.r.r@metztli-it.com> wrote:
> Niltze, all!>
> (picking up where I left off in previous thread: <
> http://marc.info/?l=reiserfs-devel&m=144040412406067&w=2 >
>
> Initiating a new thread since Debian-Installer's partman-reiser4 seems
> to be partially functioning. All the previous Reiser4 issues have been
> mostly resolved.
>
> So I cloned partman-jfs udeb source into partman-reiser4 udeb (seems
> reiserfs udeb has gotten old) and I modified relevant scripts.
>
> However, I need to fine tune those modified scripts specifically for
> reiser4 in d-i *and* there is where I need your insight.
>
> Basically, option to format device media into Reiser4 is now available
> during relevant d-i phase:
> < https://pbs.twimg.com/media/CNfOQw1VEAEYBUk.png:large >
>
> Nevertheless, I get this gibberish dialog when selecting and
> proceeding (by pressing enter):
> < https://pbs.twimg.com/media/CNfOQ4kUcAAK0Tx.png:large >
>
> If I select continue at the "??? ???" gibberish dialog, d-i is
> apparently able to go to the Partition Settings phase:
> < https://pbs.twimg.com/media/CNfOQpWUYAA8tqY.png:large >
>
> Selecting "Done setting up the partition", notwithstanding, d-i
> returns to initial phase where raw virtual device has not even been
> initiated (with MBR)
>
> Cool thing is partman-reiser4 now makes the Reiser4-patched kernel
> automatically modprobe reiser4-modules:
> < https://pbs.twimg.com/media/CNfOQwxUwAEHh68.png:large >
>
> I have at d-i build/localudebs:
> [...]
> localudebs/mkreiser4-udeb_1.0.9-2_amd64.udeb
> localudebs/reiser4-modules-4.1.0-2-amd64-di_4.1.6-1_amd64.udeb
> localudebs/reiser4progs-udeb_1.0.9-2_amd64.udeb
> localudebs/partman-reiser4_1_all.udeb
> [...]
>
> and added at d-i build/pkg-lists/netboot/amd64.cfg:
> [...]
> fat-modules-${kernel:Version}
> ext4-modules-${kernel:Version}
> jfs-modules-${kernel:Version}
> reiser4-modules-${kernel:Version}
> mkreiser4-udeb
> reiser4progs-udeb
> partman-reiser4
> [...]
>
> Note: without partman-reiser4 specified above, d-i will not show
> option to format in Reiser4 -- even if reiser4 UDEB is included under
> build/localudebs/
>
> Advice welcomed in advance to make the gibberish dialog go away and to
> effectively allow d-i routine to integrate reiser4 fully so as to
> complete the front-end formatting proceduere.
>
>
> Best Professional Regards.
>
>
> --
> Jose R R
> http://metztli.it
> ---------------------------------------------------------------------------------------------
> Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
> ---------------------------------------------------------------------------------------------
> from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
> ---------------------------------------------------------------------------------------------



-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
---------------------------------------------------------------------------------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
---------------------------------------------------------------------------------------------
