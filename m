From: jose@huitzilopochtli.metztli-it.com (Metztli Information Technology)
Subject: Blog: Reiser4 hacking upstream linux.org 4.13.7 into a Debian packaging for Linux 4.13.4-2
Date: Wed, 18 Oct 2017 06:26:57 -0700 (PDT)
Message-ID: <20171018132657.CD02CCE4EC2@huitzilopochtli.metztli-it.com>
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mixtli.metztli.it; q=dns/txt;
 s=mx; t=1508333219; h=From: Date: Message-Id: To: Subject: Sender;
 bh=30B/5qZxT4PPU7EJjdlbvo07x3aJO/pUsblq2okDahs=; b=ZLu+PIoBNhm7Ru664LhDU81mbOqurFIt2s8F6YPBbHXMexg5gMVbXqifz7Zc04kaeqAzvagW
 5YYE+IWc2mOVnbLwF9BVAYc8bIrWbTdXB5eutJepiNbGD8odAwYZIU7qwc6ZKVUkr+pf2jwm
 VIYAPu2oZYbjhHZJweEYkSAdJCc=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: reiserfs-devel@vger.kernel.org

 

Niltze all,

Posted a blog entry yesterday as proof-of-concept (PoC)
"Coyolxauhqui: Build Reiser4 -patched Linux Kernel, Headers, and Modules, for Stretch-Backports the 'Debian Way'."
< https://metztli.it/blog/index.php/coyolxauhqui-build-reiser4-patched-linux >

showing how to apply reiser4 patch to Linux kernel the 'Debian way'. Detailed procedure notions may be generalized to keep up with subsequent reiser4 on Debian AMD64; and perhaps other architectures.

This is specially true since as debian debian packaging kernel maintainers modify their code and/or patches I have experienced lapses where I have to figure out why something broke my build.

For instance it happened during the debian linux 4.11 to 4.12 minor increment -- even debian official builds were missing linux-headers-[]-common-* DEB package.
< https://lists.debian.org/debian-kernel/2017/08/msg00146.html >

To that end, I just hope creative, open/curiosity-minded hackers and/or developers may find the PoC useful so as to increase the pool of developers who may later contribute to a reiser4 community.

As a matter of fact, the source that I used to illustrate the reiser4 hacking procedure the 'debian way' generated DEBs that were subsequently uploaded to source forge.
< https://sourceforge.net/projects/metztli-reiser4/files/Reiser4-Linux-4.13.7-2_for-Stretch/ >
Currently I am using the reiser4 enabled kernel 4.13.7-2 that I built by the procedure described in the blog.

Additionally, as I decommissioned an earlier Reiser4 Debian Jessie (old stable) small cloud instance web server -- which had been operating for approximately 2 years on Google Compute Engine (GCE) and only rebooted for kernel upgrade
< https://pbs.twimg.com/media/DMFzxPwVQAAApHt.jpg:large >
-- I migrated the data to a Metztli-Reiser4 image cloud instance on GCE, too; on both I built PHP [5/6/7].x and HTTPD 2.4.[20/27] No data loss.


Best Professional Regards.

-- 
Jose R R
http://metztli.it
---------------------------------------------------------------------------------------------
Download Metztli Reiser4: Debian Stretch with Linux 4.12
---------------------------------------------------------------------------------------------
for AMD64 https://sf.net/projects/metztli-reiser4/
