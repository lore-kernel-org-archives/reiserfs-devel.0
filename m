From: Carl-Daniel Hailfinger <c-d.hailfinger.kernel.2003@gmx.net>
Subject: [Fwd: Re: rootfs and /dev/root]
Date: Wed, 21 May 2003 14:36:04 +0200
Message-ID: <3ECB72B4.1030302@gmx.net>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="------------050506020202020306060907"
Return-path: <reiserfs-list-return-14187-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
List-Id: <reiserfs-devel.vger.kernel.org>
To: ReiserFS List <reiserfs-list@namesys.com>

--------------050506020202020306060907
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

This seems to be a possible solution for reiserfsck of root partition.

Regards,
Carl-Daniel

--------------050506020202020306060907
Content-Type: message/rfc822;
 name="Re: rootfs and /dev/root"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline;
 filename="Re: rootfs and /dev/root"

Return-Path: <linux-kernel-owner+c-d.hailfinger.kernel.2003=40gmx.net@vger.kernel.org>
X-Flags: 0000
Delivered-To: GMX delivery to c-d.hailfinger.kernel.2003@gmx.net
Received: (qmail 12763 invoked by uid 65534); 21 May 2003 11:33:29 -0000
Received: from vger.kernel.org (EHLO vger.kernel.org) (209.116.70.75)
  by mx0.gmx.net (mx033-rz3) with SMTP; 21 May 2003 13:33:29 +0200
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
	id S262033AbTEULSn (ORCPT
	<rfc822;c-d.hailfinger.kernel.2003@gmx.net>);
	Wed, 21 May 2003 07:18:43 -0400
Received: (majordomo@vger.kernel.org) by vger.kernel.org id S262042AbTEULSn
	(ORCPT <rfc822;linux-kernel-outgoing>);
	Wed, 21 May 2003 07:18:43 -0400
Received: from 169.imtp.Ilyichevsk.Odessa.UA ([195.66.192.169]:64783 "EHLO
	Port.imtp.ilyichevsk.odessa.ua") by vger.kernel.org with ESMTP
	id S262033AbTEULSm (ORCPT <rfc822;linux-kernel@vger.kernel.org>);
	Wed, 21 May 2003 07:18:42 -0400
Received: from there ([172.16.42.177])
	by Port.imtp.ilyichevsk.odessa.ua (8.10.2/8.10.2) with SMTP id h4LBMsu10591;
	Wed, 21 May 2003 14:22:54 +0300
Message-Id: <200305211122.h4LBMsu10591@Port.imtp.ilyichevsk.odessa.ua>
Content-Type: text/plain; charset=US-ASCII
From: Denis Vlasenko <vda@port.imtp.ilyichevsk.odessa.ua>
Reply-To: vda@port.imtp.ilyichevsk.odessa.ua
To: Mark Dascher <strogian@yahoo.com>, linux-kernel@vger.kernel.org
Subject: Re: rootfs and /dev/root
Date: Wed, 21 May 2003 14:29:10 +0300
X-Mailer: KMail [version 1.3.2]
References: <20030521011420.57175.qmail@web40805.mail.yahoo.com>
In-Reply-To: <20030521011420.57175.qmail@web40805.mail.yahoo.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7BIT
Sender: linux-kernel-owner@vger.kernel.org
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
X-GMX-Antivirus: -1 (not scanned, may not use virus scanner)
X-GMX-Antispam: 0 (Sender is in whitelist)

On 21 May 2003 04:14, Mark Dascher wrote:
> I'm curious about the two entries in /proc/mounts:
> rootfs and /dev/root.  Although I don't have much
> experience with this, I've looked through some of the
> kernel source code (e.g. fs/namespace.c or
> init/do_mounts.c).  All I can come up with (actually,
> this is pretty much what I thought before I looked at
> any code) is that rootfs is purely a kernel-generated
> filesystem.  The kernel creates the /dev/root device
> there, and then mounts /dev/root at / (replacing
> rootfs).

Yes that's what happens. Guys are planning to be able to
*really* umount real (disk-based) root fs someday
and continue halt/reboot sequence using files (scripts etc)
on this virtual rootfs.

So there will be both 'early userspace' and 'late userspace' ;)

IMHO.
--
vda
-
To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
Please read the FAQ at  http://www.tux.org/lkml/



--------------050506020202020306060907--

