From: lsorense@csclub.uwaterloo.ca (Lennart Sorensen)
Subject: Re: COMPILING AND CONFIGURING A NEW KERNEL.
Date: Sat, 7 Apr 2007 21:42:50 -0400
Message-ID: <20070408014250.GH3510@csclub.uwaterloo.ca>
References: <46157B5B.5000602@gmail.com> <1175817921.18400.1183285196@webmail.messagingengine.com> <1175909205.905.1183425104@webmail.messagingengine.com> <12252.1175964174@turing-police.cc.vt.edu> <1175994157.1894.1183513166@webmail.messagingengine.com>
Mime-Version: 1.0
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S966020AbXDHBmx@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <1175994157.1894.1183513166@webmail.messagingengine.com>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: johnrobertbanks@fastmail.fm
Cc: Valdis.Kletnieks@vt.edu, Ignatich <ignatich@gmail.com>, reiserfs-list@namesys.com, linux-kernel@vger.kernel.org

On Sat, Apr 07, 2007 at 06:02:37PM -0700, johnrobertbanks@fastmail.fm wrote:
> Thats interesting, I didn't know that. 
> 
> Do you know if deb-pkg and rpm-pkg take care of creating the initrd
> automatically.
> 
> I seriously doubt they do.
> 
> Actually, I guess I only need to compile another kernel to find out.

Certainly on debian make-kpkg actually does have options for initrd
(--initrd) and will call mkinitrd/update-initramfs/yaird at package
install time to generate an initrd for the kernel to deal with raid,
lvm, etc.  It works quite well in general.

I would be surprised if redhat didn't do something similar.

--
Len Sorensen
