From: "Vladimir V. Saveliev" <vs@namesys.com>
Subject: Re: reiser4 for 2.6.16 (version 3)
Date: Wed, 31 May 2006 20:30:00 +0400
Message-ID: <1149093000.6409.57.camel@tribesman.namesys.com>
References: <web-8763177@inc.ru>
	 <1149003085.6590.37.camel@tribesman.namesys.com>
	 <447DBC31.2020405@parkheights.dyndns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28704-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <447DBC31.2020405@parkheights.dyndns.org>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sergey Ivanov <seriv@parkheights.dyndns.org>
Cc: reiserfs-list@namesys.com

Hello

On Wed, 2006-05-31 at 11:54 -0400, Sergey Ivanov wrote:
> Vladimir V. Saveliev wrote:
> [skip]
> > thanks, please try that
> > ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.16/reiser4-for-2.6.16-4.patch.gz
> [skip]
> I have compiled kernel 2.6.16.18 with this patch. Then mounted reiser4
> filesystem for spool of mail server, listening from smtp-source and
> delivering to smtp-sink. This is the load, caused problems with previous
> versions of reiser4 (see
> http://marc.theaimsgroup.com/?l=reiserfs&m=114175170229924&w=2 )

How does reiser4 compare to ext3 now (if you measured it)?

> This patch works without problem.
> Thank you!
> 

