From: myciel <myciel@dotcom.pl>
Subject: Re: How to build a big file server
Date: Tue, 10 Jun 2003 16:13:18 +0200
Message-ID: <3EE5E77E.70505@dotcom.pl>
References: <1054800852.1997.15.camel@wusel.schnulli.de>	 <20030605083301.GB4849@vestdata.no>	 <1054802574.1995.26.camel@wusel.schnulli.de>	 <200306051045.53677.m.c.p@gmx.net>  <3EE5DD06.3010100@dotcom.pl> <1055252169.2010.5.camel@wusel.schnulli.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-14507-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1055252169.2010.5.camel@wusel.schnulli.de>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: reiserfs-list@namesys.com

Heinz-Josef Claes wrote:
> Am Die, 2003-06-10 um 15.28 schrieb myciel:
> 
>> >
>>
>>>3ware Controller. Works perfect.
>>>
>>
>>
>>but not in raid 5...
>>
 > What do you mean? Do have any experiences? What type of controler do
 > use?

2 x 3ware 7500-8 ATA RAID with 160GB Maxtors.
What I need for my production is: read speed ~2MB/s, write speed ~1MB/s.
With one partition per controller, on each of them  ~500k of mail 
accounts using maildir exported via nfs to www frontends and 
mailservers, it simply did not work.
After migration to raid 10, it works perfect, during backup I'm able
to get 5MB/s reading (during busy hours).


rafal


