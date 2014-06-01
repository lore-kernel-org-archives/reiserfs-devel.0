From: Richard Cochran <richardcochran@gmail.com>
Subject: Re: [RFC 00/32] making inode time stamps y2038 ready
Date: Sun, 1 Jun 2014 06:46:09 +0200
Message-ID: <20140601044609.GD3722@localhost.localdomain>
References: <1401480116-1973111-1-git-send-email-arnd@arndb.de>
 <20140531145114.GA3721@localhost.localdomain>
 <6347520.8jMPlVsFjM@wuerfel>
 <20140531182237.GA5382@localhost.localdomain>
 <57071155-5a08-4579-9189-92d442cd65e7@email.android.com>
Mime-Version: 1.0
Return-path: <linux-arch-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-type:content-disposition:in-reply-to:user-agent;
        bh=yV1sqBiUTth5pubGvlu+YDYFfK3jNlMJWhzA6+nKkQU=;
        b=cFx+L+qN5cx3q87HfgaRR7M7JDxljzARCu0WaX29AmFCHRn3/SCA0RRK/Du4mRwpug
         ThQDFhWRSQnaKp0Xb+8Hm0gCann+2xQtug8gIVIZzgghmtBGHGQSVJRMKhyahpCoCyCv
         Er2WZ/DInQEjqOlmq4cc0K5mQiYYvDBurDQpLR1gWIIJwVHw+EGe9iANsceFmIi3/+IX
         FPX12EHgy051HzN4hvkDQdQzerGEHV0SxN08KjE8BfnwDl0XiBNEs1W3oF/WT0Eljtz7
         w7+VrSaeGlsGERwioqJBG5PJRTbQNOUStf5i0ChenuooZZT0jDrttbGrbjpkmaSahouR
         9DGQ==
Content-Disposition: inline
In-Reply-To: <57071155-5a08-4579-9189-92d442cd65e7@email.android.com>
Sender: linux-arch-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "H. Peter Anvin" <hpa@zytor.com>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-kernel@vger.kernel.org, hch@infradead.org, linux-mtd@lists.infradead.org, logfs@logfs.org, linux-afs@lists.infradead.org, joseph@codesourcery.com, linux-arch@vger.kernel.org, linux-cifs@vger.kernel.org, linux-scsi@vger.kernel.org, ceph-devel@vger.kernel.org, codalist@TELEMANN.coda.cs.cmu.edu, cluster-devel@redhat.com, coda@cs.cmu.edu, geert@linux-m68k.org, linux-ext4@vger.kernel.org, fuse-devel@lists.sourceforge.net, reiserfs-devel@vger.kernel.org, xfs@oss.sgi.com, john.stultz@linaro.org, tglx@linutronix.de, linux-nfs@vger.kernel.org, linux-ntfs-dev@lists.sourceforge.net, samba-technical@lists.samba.org, linux-f2fs-devel@lists.sourceforge.net, ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org, lftan@altera.com, linux-btrfs@vger.kernel.org

On Sat, May 31, 2014 at 12:34:12PM -0700, H. Peter Anvin wrote:
> Typically they are using 64-bit signed seconds.

Okay, that is what I wanted to know.

Thanks,
Richard
