From: Ronni Nielsen <ronni_nielsen@adslhome.dk>
Subject: Re: Reiser4
Date: Wed, 30 Jun 2004 17:21:51 +0200
Message-ID: <1088608911.23375.0.camel@ronni.subtil.dk>
References: <1088604993.6610.5.camel@ronni.subtil.dk>
	 <3117.68.126.187.236.1088605480.squirrel@gaia.csus.edu>
	 <40E2CFEE.3000701@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-19467-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <40E2CFEE.3000701@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

ons, 2004-06-30 kl. 16:36 skrev Vladimir V. Saveliev: 

> Thanks for report
> next auto-snapshot will fix it
> for now you can add
> EXPORT_SYMBOL(__get);
> EXPORT_SYMBOL(__pagevec_release);
> EXPORT_SYMBOL(pagevec_lookup_tag);

Added 
EXPORT_SYMBOL(__iget);
in fs/inode.c
and
EXPORT_SYMBOL(__pagevec_release);
EXPORT_SYMBOL(pagevec_lookup_tag);
in mm/swap.c

And now it works - thanx :-)
Now the testing begins....

/ronni

