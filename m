From: Jose R R <Jose.r.r@metztli-it.com>
Subject: Integrate fully partman-reiser4 into d-i
Date: Fri, 28 Aug 2015 03:56:55 -0700
Message-ID: <CAM12Q5QKdpHgMG_qGyhE-abO6R-uY6cKtv-5Qg36N-FTx_Z8Lw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: debian-boot@lists.debian.org, ReiserFS Development List <reiserfs-devel@vger.kernel.org>
Cc: Cyril Brulebois <kibi@debian.org>, Ben Hutchings <ben@decadent.org.uk>

Niltze, all!>
(picking up where I left off in previous thread: <
http://marc.info/?l=reiserfs-devel&m=144040412406067&w=2 >

Initiating a new thread since Debian-Installer's partman-reiser4 seems
to be partially functioning. All the previous Reiser4 issues have been
mostly resolved.

So I cloned partman-jfs udeb source into partman-reiser4 udeb (seems
reiserfs udeb has gotten old) and I modified relevant scripts.

However, I need to fine tune those modified scripts specifically for
reiser4 in d-i *and* there is where I need your insight.

Basically, option to format device media into Reiser4 is now available
during relevant d-i phase:
< https://pbs.twimg.com/media/CNfOQw1VEAEYBUk.png:large >

Nevertheless, I get this gibberish dialog when selecting and
proceeding (by pressing enter):
< https://pbs.twimg.com/media/CNfOQ4kUcAAK0Tx.png:large >

If I select continue at the "??? ???" gibberish dialog, d-i is
apparently able to go to the Partition Settings phase:
< https://pbs.twimg.com/media/CNfOQpWUYAA8tqY.png:large >

Selecting "Done setting up the partition", notwithstanding, d-i
returns to initial phase where raw virtual device has not even been
initiated (with MBR)

Cool thing is partman-reiser4 now makes the Reiser4-patched kernel
automatically modprobe reiser4-modules:
< https://pbs.twimg.com/media/CNfOQwxUwAEHh68.png:large >

I have at d-i build/localudebs:
[...]
localudebs/mkreiser4-udeb_1.0.9-2_amd64.udeb
localudebs/reiser4-modules-4.1.0-2-amd64-di_4.1.6-1_amd64.udeb
localudebs/reiser4progs-udeb_1.0.9-2_amd64.udeb
localudebs/partman-reiser4_1_all.udeb
[...]

and added at d-i build/pkg-lists/netboot/amd64.cfg:
[...]
fat-modules-${kernel:Version}
ext4-modules-${kernel:Version}
jfs-modules-${kernel:Version}
reiser4-modules-${kernel:Version}
mkreiser4-udeb
reiser4progs-udeb
partman-reiser4
[...]

Note: without partman-reiser4 specified above, d-i will not show
option to format in Reiser4 -- even if reiser4 UDEB is included under
build/localudebs/

Advice welcomed in advance to make the gibberish dialog go away and to
effectively allow d-i routine to integrate reiser4 fully so as to
complete the front-end formatting proceduere.


Best Professional Regards.


-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Try at no charge http://b2evolution.net for http://OpenShift.com PaaS
---------------------------------------------------------------------------------------------
from our GitHub http://Nepohualtzintzin.com repository. Cloud the easy way!
---------------------------------------------------------------------------------------------
