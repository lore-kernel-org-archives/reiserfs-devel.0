From: Vitaly Fertman <vitaly@namesys.com>
Subject: Re: AW: rebuildfs
Date: Tue, 5 Aug 2003 20:26:33 +0400
Message-ID: <200308052026.33709.vitaly@namesys.com>
References: <E5A63F34D141D111A6F4080009D70ACA346D65@imkedv_pdc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-15155-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <E5A63F34D141D111A6F4080009D70ACA346D65@imkedv_pdc>
Content-Disposition: inline
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Thorsten Mauch <mauch@imkenberg.de>, "'reiserfs-list@namesys.com'" <reiserfs-list@namesys.com>

On Tuesday 05 August 2003 19:55, Thorsten Mauch wrote:
> my failed HDD is a raid member. Is it possible to use
> dd_rescure also to copy the raw hhd ?

yes, you can dd_rescue your /dev/rd/c0d0 to /dev/hda.

-- 
Thanks,
Vitaly Fertman
