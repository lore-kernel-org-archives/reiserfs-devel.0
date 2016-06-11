From: Mathieu Belanger <admin@korinar.com>
Subject: Re: Has anyone successfully repaired a reiser4 file-system , if so
 how was it done ?
Date: Sat, 11 Jun 2016 14:19:47 -0500
Message-ID: <20160611141947.773c236380a8be226307bfdb@korinar.com>
References: <f3ac2baeec3d6e132ffddb4a36faff6f@mail.velocitynet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=korinar.com; h=
	content-transfer-encoding:content-type:content-type:mime-version
	:x-mailer:references:in-reply-to:message-id:subject:subject:from
	:from:date:date:received:received; s=korinar; t=1465672863; bh=w
	1VizAk5zGPBcXlTCsOjL+qQvLM6v9xlBUtebPf8ZRw=; b=26NXFzSYhX+QbCnLv
	+tkntjYXItslnut+EjPjPZnhN/fKjPQEz9OEkW7t8UsPWBvlrHedYBnmnt0Ks+fJ
	FyP1RFbfguMyKARUqXMrLVYeji9UOu+AWVXsVfQDyyaZi6uq779mKJbUvnB+TAxK
	2yjMY9Kcqkb4x4nd4nG3PCpFZQ=
In-Reply-To: <f3ac2baeec3d6e132ffddb4a36faff6f@mail.velocitynet.com.au>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: doiggl@velocitynet.com.au
Cc: reiserfs-devel@vger.kernel.org

fsck.reiser4 --fix first and then usually I have to do fsck.reiser4 --rebuild-fs.

And after a rebuild-fs, on my system, for some reason, I have to reboot on systemrescuecd to mount the fixed filesystem in R/W mode and then unmount it and reboot normally. If I mount a --reduilded-fs on my main installation, in R/W without first do a mount in systemrescuecd, I get weird corruption (recoverable after another rebuild-fs if I do the rw mount in systemrescuecd first).

Mathieu

On Sat, 11 Jun 2016 19:58:28 +1000
<doiggl@velocitynet.com.au> wrote:

> Hello,
> Has anyone successfully repaired a reiser4 file-system , if so how was it
> done ?
> 
> I use:
> 
> # fsck.reiser4 -V
> fsck.reiser4 1.1.0
> Format release: 4.0.1
> Copyright (C) 2001-2005 by Hans Reiser, licensing governed by
> reiser4progs/COPYING. 
> 
> # rpm -qa | grep -i reiser4progs
> reiser4progs-1.1.0-35.1.x86_64
> 
> # rpm -qf /usr/sbin/fsck.reiser4
> reiser4progs-1.1.0-35.1.x86_64
> 
> Thanks
> --Glenn
> 
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


-- 
Mathieu Belanger <admin@korinar.com>
