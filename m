From: Brian Uhrain <buhrain@rosettastone.com>
Subject: Re: New Reiser4 patch
Date: Sun, 19 Mar 2006 17:11:19 +0000
Message-ID: <441D90B7.4080302@rosettastone.com>
References: <441A8E9F.4030602@rosettastone.com> <1142599600.7415.274.camel@tribesman.namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-28300-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1142599600.7415.274.camel@tribesman.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com



Vladimir V. Saveliev wrote:
> On Fri, 2006-03-17 at 10:25 +0000, Brian Uhrain wrote:
>>P.S.  If you want any more information on the VMware issue, I can see if 
>>it still does it on one of my home systems, and try to grab kernel 
>>messages via serial console. 
> 
> 
> Yes, please do so.

I've tried to recreate the lockup at home without success; VMware ran 
just fine.  I'd say either the problem has been fixed (when I 
encountered the lockup I was using a 2.6.12 or 2.6.13 kernel, and am 
currently using 2.6.15--in all cases vanilla kernel.org sources with the 
reiser4 patches from ftp.namesys.com), or it's a bad interaction with 
one of the other kernel components.  I mention the latter because at 
home my system has an IDE disk without any fancy partitioning, and my 
work system--in addition to being dual-core--has two SATA drives and the 
partition in question was an LVM partition striped across the two drives.

- Brian
