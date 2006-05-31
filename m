From: Sergey Ivanov <seriv@parkheights.dyndns.org>
Subject: Re: reiser4 for 2.6.16 (version 3)
Date: Wed, 31 May 2006 11:54:25 -0400
Message-ID: <447DBC31.2020405@parkheights.dyndns.org>
References: <web-8763177@inc.ru> <1149003085.6590.37.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28703-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1149003085.6590.37.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: reiserfs-list@namesys.com

Vladimir V. Saveliev wrote:
[skip]
> thanks, please try that
> ftp://ftp.namesys.com/pub/reiser4-for-2.6/2.6.16/reiser4-for-2.6.16-4.patch.gz
[skip]
I have compiled kernel 2.6.16.18 with this patch. Then mounted reiser4
filesystem for spool of mail server, listening from smtp-source and
delivering to smtp-sink. This is the load, caused problems with previous
versions of reiser4 (see
http://marc.theaimsgroup.com/?l=reiserfs&m=114175170229924&w=2 )
This patch works without problem.
Thank you!

-- 
	Sergey Ivanov.
