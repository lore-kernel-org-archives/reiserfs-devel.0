From: Sergey Ivanov <seriv@parkheights.dyndns.org>
Subject: Re: reiser4 for 2.6.16 (version 3)
Date: Wed, 31 May 2006 14:24:36 -0400
Message-ID: <447DDF64.1050603@parkheights.dyndns.org>
References: <web-8763177@inc.ru>	 <1149003085.6590.37.camel@tribesman.namesys.com>	 <447DBC31.2020405@parkheights.dyndns.org> <1149093000.6409.57.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28707-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1149093000.6409.57.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Vladimir V. Saveliev" <vs@namesys.com>, reiserfs-list@namesys.com

Vladimir V. Saveliev wrote:
[skip]
> 
> How does reiser4 compare to ext3 now (if you measured it)?
> 
Well, while writing messages to spool ext3 gives 240 msg/sec, while
reiser4 only 115 msg/sec. It was measured while acquiring 136000
messages, occupying more than 3 Gig storage. But while delivering these
messages from spool, reiser4 gives 155 msg/sec, while ext3 only 115
msg/sec rates.
Both filesystems were mounted with "noatime,nodiratime" options, at
FAST-80 WIDE SCSI 160.0 MB/s bus.
-- 
	Sergey Ivanov
