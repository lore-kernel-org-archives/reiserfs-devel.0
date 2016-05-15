From: Mathieu Belanger <admin@korinar.com>
Subject: Reiser4 patch bumped to kernel 4.7-next20160513
Date: Sat, 14 May 2016 20:17:15 -0500
Message-ID: <20160514201715.309f7c2859cc5cd9a7d13f6e@korinar.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=korinar.com; h=
	content-transfer-encoding:content-type:content-type:mime-version
	:x-mailer:message-id:subject:subject:from:from:date:date
	:received:received; s=korinar; t=1463275093; bh=HQkMR1Bis0/EMRhH
	Z9MSJ6GdmEkdELUmzWHB5RAtTdQ=; b=NrKUPsPqku0usmo/PKNYDfbMkhSSG4bG
	PgN5EhQ0w7Xf1PGrACRB1bpTM+SvmYM5ZFpnkQljj/dOuVhgcfskZzrN/ozGcgsr
	f73g/x05U494hJwUsBZsK5Vz8xRFqZJShoME1ns08q2si7Mt5sizdCIcgrQzdzz4
	JKl7HhEuQXI=
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-devel@vger.kernel.org

Hi, I just ported Reiser4 to the current next version.

Change : 
- A small change occured in vmscan.c that broke the patch
- no more i_mutex in the inode struct. mutex_{lock,unlock}(&inode->i_mutex) replaced by inode_{lock,unlock}(inode).

I'm testing it tonight and will provide patchs by this night.

Note : I got the first power outrage since the barrier patch, about 2 minutes after compiling that new kernel while writing this message and no problem / nothing lost.

-- 
Mathieu Belanger <admin@korinar.com>
