From: Frederic Weisbecker <fweisbec@gmail.com>
Subject: Re: [PATCH 0/6] kill-the-BKL/reiserfs3: performance improvements,
	faster than Bkl based scheme
Date: Sat, 2 May 2009 03:39:07 +0200
Message-ID: <20090502013906.GA5331@nowhere>
References: <1241145862-21700-1-git-send-email-fweisbec@gmail.com>
Mime-Version: 1.0
Return-path: <reiserfs-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:received:date:from:to:cc
         :subject:message-id:references:mime-version:content-type
         :content-disposition:in-reply-to:user-agent;
        bh=xFCu0JNyKDoMs1wRsk+GHzqqTboTvrKXKtRizR5Lfws=;
        b=oYTLIYCmjOH8KFoFxPy4hWgnnBADjB1/AI9j9rG9h9XR+P6846ZwDsyVSjDK3waoJP
         1XZo+8E+2WFMqD5HHlvRPGvH3xWH0Mia764Fuj1TpyWuBsFrdyQq1dMZzxpl4onPCY+t
         w3nVzwHHZ0uBlWtzDTac5PP6vrWFss3XESif8=
Content-Disposition: inline
In-Reply-To: <1241145862-21700-1-git-send-email-fweisbec@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ingo Molnar <mingo@elte.hu>
Cc: LKML <linux-kernel@vger.kernel.org>, Jeff Mahoney <jeffm@suse.com>, ReiserFS Development List <reiserfs-devel@vger.kernel.org>, Chris Mason <chris.mason@oracle.com>, Alexander Beregalov <a.beregalov@gmail.com>, Alessio Igor Bogani <abogani@texware.it>, Jonathan Corbet <corbet@lwn.net>, Alexander Viro <viro@zeniv.linux.org.uk>

On Fri, May 01, 2009 at 04:44:16AM +0200, Frederic Weisbecker wrote:
> Hi,
> 
> This reiserfs patchset applies against latest tip:core/kill-the-BKL
> It adds various explicit write lock releases on specific sleeping sections.
> 
> A performance test with dbench on UP with 100 processus during 100 seconds
> gives the following results:
> 
> Locking		  Throughput 
> 
> Bkl:              11.2587 MB/s
> Write lock/Mutex: 12.5713 MB/s


I just tested on SMP with two CPU:

Write Lock/Mutex: Throughput 66.9269 MB/sec 100 procs
Bkl:              Throughput 71.9998 MB/sec 100 procs

So:

UP:  11% faster
SMP:  8% slower


I guess there is still some work to do :)

