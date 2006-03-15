From: Alain Knaff <alain@knaff.lu>
Subject: Re: fatal "not directory found" error at pass 3a of reiserfsck
Date: Wed, 15 Mar 2006 15:11:05 +0100
Message-ID: <44182079.5030702@knaff.lu>
References: <4416E66D.4020500@knaff.lu> <200603142220.39344.vitaly@namesys.com> <44171B1F.5070809@knaff.lu> <200603142239.01686.vitaly@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28268-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200603142239.01686.vitaly@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: vitaly@namesys.com
Cc: reiserfs-list@namesys.com

Vitaly Fertman wrote:
> if rebuilding the tree has been finished, you do not need to rebuild 
> it again, you can merely double check the fs consistency with --check
> (default) option.
> 

Even though 3.6.19 apparently "succeeded" with its rebuild-tree, 3.6.20 with 
--check still found errors, so we had to run this with rebuild-tree as well.

But that run finished all right, and succeeded in retrieving one additional 
file, which 3.6.19 hadn't.

Many thanks,

Alain
