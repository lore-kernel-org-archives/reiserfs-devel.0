From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: A possible typo defining MAX_INT in reiserfs_fs.h ?
Date: Wed, 30 Jul 2008 12:37:14 +0400
Message-ID: <4890283A.5010306@gmail.com>
References: <1217402778.7065.23.camel@ubuntu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1217402778.7065.23.camel@ubuntu>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Colin Ian King <colin.king@ubuntu.com>
Cc: reiserfs-devel@vger.kernel.org, chris.mason@oracle.com

Colin Ian King wrote:
> Hi there,
>
> This is a very quick question about a possible typo:
>
> In include/linux/reiserfs_fs.h
>
> there are the lines:
>
> #define MAX_UL_INT 0xffffffff
> #define MAX_INT 0x7ffffff
>   
^^^^^^^^^^^^^^^^^^^^^^^^^^^
> Should MAX_INT should be "0x7fffffff" rather than "0x7ffffff"?
>
> Thanks for any clarification,
>   

I would suggest a version that this line is unused garbage.
Any opinions?

Thanks,
Edward.
