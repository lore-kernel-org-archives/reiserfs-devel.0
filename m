From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: rebuildfs
Date: Tue, 5 Aug 2003 19:51:38 +0400
Message-ID: <200308051951.38602.vitaly@namesys.com>
References: <E5A63F34D141D111A6F4080009D70ACA346D64@imkedv_pdc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15153-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <E5A63F34D141D111A6F4080009D70ACA346D64@imkedv_pdc>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thorsten Mauch <mauch@imkenberg.de>
Cc: "'reiserfs-list@namesys.com'" <reiserfs-list@namesys.com>

On Tuesday 05 August 2003 19:30, Thorsten Mauch wrote:
> Now i finised with the version 2.6.11.
> I find now files that have exectly the creation time of thoose files i
> seek. And at least
> in one case the size is aslo resonalble. But the content is not like
> expectet.
> Is there a way to controll how the files are rebuild ? or is there
> something that i
> could do better ?

If dd without conv=noerror fails for you -- you have problems with 
reading some blocks -- you should use dd_rescue instead as dd 
forgets to create holes in the target image when cannot read some 
block. This explains garbage in files in your case.

-- 
Thanks,
Vitaly Fertman
