From: Ivan Shapovalov <intelfx100@gmail.com>
Subject: Re: linux 3.4.2 fails to compile with patch
Date: Mon, 17 Sep 2012 11:24:01 +0400
Message-ID: <1652044.a0y6tGQRE0@intelfx-laptop>
References: <5052B073.4080506@gmail.com> <1502246.NqeFiNrX3o@intelfx-laptop> <5056AC26.2080608@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:to:cc:subject:date:message-id:user-agent:in-reply-to
         :references:mime-version:content-transfer-encoding:content-type;
        bh=Z5WlK08xOVZhzMApjnl3X0lr0C15dEC6DYvEPcwAVqw=;
        b=Z/5OHZjus7q0qQhcuflDCFEYdOG/jutKuoK8TVlXN9xx6R0UCeBBMcUpXKFLTbNOec
         S7ch/oIwzOio99A6JB5v4wusLY8oLUR44cD3mWuvil6+8BzB32thhnZ7afyoJ/0OvGVk
         8H2oeRDoD3xzkE0xHnVzjuCJS9wR7D2IcDpmgadziqA8PMQwdwwETI3kOM5aTCW8y1FJ
         Y4Y+A6042yyClFflcp5DUy3YsCTpZlMdC10NivlqUAOKS7uCEgVyU/8BLIltEpuXbHKl
         tjM7Kt6p1CStn7+SyF83TkuwiVndnxre/piSSphbdkaw12GOSyGguRKqm6bLlTI5VMhM
         Qmjg==
In-Reply-To: <5056AC26.2080608@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: "dE ." <de.techno@gmail.com>
Cc: reiserfs-devel@vger.kernel.org, edward.shishkin@gmail.com

On Monday 17 September 2012 10:20:46 dE . wrote:
> On 09/14/12 18:12, Ivan Shapovalov wrote:
> > On Friday 14 September 2012 09:50:03 dE . wrote:
> >> Hello again :)
> >> 
> >> I downloaded the recent patches for 3.2 to 3.5 kernels, and applied it
> >> to my 3.4.2 kernel. It results in the following --
> >> 
> >> CC      fs/fs-writeback.o
> >> fs/fs-writeback.c: In function 'generic_writeback_sb_inodes':
> >> fs/fs-writeback.c:560:6: error: request for member 'nr_to_write' in
> >> something not a structure or union
> >> fs/fs-writeback.c:561:6: error: request for member 'pages_skipped' in
> >> something not a structure or union
> >> fs/fs-writeback.c:563:3: warning: passing argument 3 of
> >> 'writeback_single_inode' from incompatible pointer type [enabled by
> >> default] fs/fs-writeback.c:344:1: note: expected 'struct
> >> writeback_control *' but argument is of type 'struct writeback_control
> >> **'
> >> fs/fs-writeback.c:565:38: error: request for member 'nr_to_write' in
> >> something not a structure or union
> >> fs/fs-writeback.c:566:29: error: request for member 'nr_to_write' in
> >> something not a structure or union
> >> fs/fs-writeback.c:569:10: error: request for member 'pages_skipped' in
> >> something not a structure or union
> >> make[1]: *** [fs/fs-writeback.o] Error 1
> >> make: *** [fs] Error 2
> > 
> > Hello,
> > 
> > The vfs layer had undergone some changes between versions 3.4 and 3.5, so
> > a
> > patch against 3.5 won't work when applied to 3.4 or earlier versions.
> > Instead, please, try the attached patch.
> > 
> > Regards,
> > Ivan Shapovalov.
> > 
> >> --
> >> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel"
> >> in the body of a message to majordomo@vger.kernel.org
> >> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> Thankyou! It works. This should be added to the SF project.

Yes; especially since 3.4 is a long-term support version...

// Edward, could you please add that patch to SF? It has your final changes 
applied.

> 
> I'll test reiser4 with my root partition (without compression).
