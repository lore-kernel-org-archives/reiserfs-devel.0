From: Hans Reiser <reiser@namesys.com>
Subject: Re: Results of "bk clone" tests with 2.6.2,  reiser4, reiserfs,	ext3,
 xfs and jfs
Date: Wed, 11 Feb 2004 23:12:33 -0800
Message-ID: <402B2761.20500@namesys.com>
References: <1076456354.1585.36.camel@spc.esa.lanl.gov>	 <402A5468.3000609@namesys.com>  <200402110232.54727.elenstev@mesatop.com> <1076525319.1683.44.camel@spc.esa.lanl.gov> <402AB632.9080006@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-16770-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <402AB632.9080006@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Hans Reiser <reiser@namesys.com>
Cc: Steven Cole <elenstev@mesatop.com>, reiserfs-list@namesys.com, nikita@namesys.com

Hans Reiser wrote:

>
> Hmmm, we need to look into that.  Thanks Steven.  Zam, please analyze 
> just what fs operations this benchmark performs, report it, and then 
> analyze why we are slow.

Zam, ignore this, I forgot that we already figured out that it was due 
to it being an sync intensive workload, and that bk would need to use 
sys_reiser4 instead of fsync if it wants to go fast with reiser4.

