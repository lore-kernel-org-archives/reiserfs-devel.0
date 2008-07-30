From: Chris Mason <chris.mason@oracle.com>
Subject: Re: A possible typo defining MAX_INT in reiserfs_fs.h ?
Date: Wed, 30 Jul 2008 08:39:58 -0400
Message-ID: <1217421598.7572.156.camel@think.oraclecorp.com>
References: <1217402778.7065.23.camel@ubuntu>  <4890283A.5010306@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4890283A.5010306@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: Colin Ian King <colin.king@ubuntu.com>, reiserfs-devel@vger.kernel.org

On Wed, 2008-07-30 at 12:37 +0400, Edward Shishkin wrote:
> Colin Ian King wrote:
> > Hi there,
> >
> > This is a very quick question about a possible typo:
> >
> > In include/linux/reiserfs_fs.h
> >
> > there are the lines:
> >
> > #define MAX_UL_INT 0xffffffff
> > #define MAX_INT 0x7ffffff
> >   
> ^^^^^^^^^^^^^^^^^^^^^^^^^^^
> > Should MAX_INT should be "0x7fffffff" rather than "0x7ffffff"?
> >
> > Thanks for any clarification,
> >   
> 
> I would suggest a version that this line is unused garbage.
> Any opinions?

Seems unused in fs/reiserfs/* and include/linux/reiserfs*

-chris


