From: Hans Reiser <reiser@namesys.com>
Subject: Re: Results of "bk clone" tests with 2.6.2,  reiser4, reiserfs, ext3,
 xfs and jfs
Date: Wed, 11 Feb 2004 08:12:24 -0800
Message-ID: <402A5468.3000609@namesys.com>
References: <1076456354.1585.36.camel@spc.esa.lanl.gov>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16758-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1076456354.1585.36.camel@spc.esa.lanl.gov>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Steven Cole <elenstev@mesatop.com>
Cc: reiserfs-list@namesys.com, nikita@namesys.com

Steven Cole wrote:

>I used the "-o key=key_short" option when creating the
>reiser4 file system due to getting this message:
>"kernel: WARNING: Key format mismatch. Only small keys are supported."
>  
>
This might have hurt our performance substantially.  Did you 
intentionally choose small keys?  If not, Nikita, why did this happen?
