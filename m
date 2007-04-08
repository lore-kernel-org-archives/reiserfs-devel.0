From: johnrobertbanks@fastmail.fm
Subject: Re: COMPILING AND CONFIGURING A NEW KERNEL.
Date: Sat, 07 Apr 2007 18:02:37 -0700
Message-ID: <1175994157.1894.1183513166@webmail.messagingengine.com>
References: <46157B5B.5000602@gmail.com>
   <1175817921.18400.1183285196@webmail.messagingengine.com>
   <1175909205.905.1183425104@webmail.messagingengine.com>
   <12252.1175964174@turing-police.cc.vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner+glk-linux-kernel-3=40m.gmane.org-S966033AbXDHBCh@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <12252.1175964174@turing-police.cc.vt.edu>
Sender: linux-kernel-owner@vger.kernel.org
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Valdis.Kletnieks@vt.edu
Cc: Ignatich <ignatich@gmail.com>, reiserfs-list@namesys.com, linux-kernel@vger.kernel.org


> It is quite possible to build a kernel that has all the drivers built-in,
> but still require an initrd file.  For instance, if you have a recent
> RedHat or Fedora system, '/' may very well be on an LVM partition, which
> means you need an initrd to do a 'lvm varyonvg' before mounting your real
> root filesystem will work....

Thanks Valdis,

Thats interesting, I didn't know that. 

Do you know if deb-pkg and rpm-pkg take care of creating the initrd
automatically.

I seriously doubt they do.

Actually, I guess I only need to compile another kernel to find out.

John.
-- 
  
  johnrobertbanks@fastmail.fm

-- 
http://www.fastmail.fm - Choose from over 50 domains or use your own
