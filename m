From: Spam <spam@tnonline.net>
Subject: Re: Repacker cause fs corruption:
Date: Tue, 14 Sep 2004 16:26:35 +0200
Message-ID: <968637306.20040914162635@tnonline.net>
References: <710218328.20040914105908@tnonline.net>
 <20040914094223.GE2252@backtop.namesys.com>
 <981213141.20040914120831@tnonline.net>
 <20040914101120.GF2252@backtop.namesys.com>
Reply-To: Spam <spam@tnonline.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-21741-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <20040914101120.GF2252@backtop.namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Alex Zarochentsev <zam@namesys.com>
Cc: reiserfs-list@namesys.com

> On Tue, Sep 14, 2004 at 12:08:31PM +0200, Spam wrote:
>> 
>> > On Tue, Sep 14, 2004 at 10:59:08AM +0200, Spam wrote:
>> >> 
>> >>   I tried the resier4 repacker yesterday on a 2GB device that I use
>> >>   for /usr/portage in Gentoo. This morning I found these errors in the
>> >>   kernel log:
>> 
>> > Thanks for the report.  
>> 
>> > How did you start the repacker?  which direction did you run it in?
>> 
>>   The direction is "0". I started by issuing:
>>   echo 1 >/sys/fs/reiser4/loop0/repacker/start

> It looks like the repacker triggers a bug in reiser4.  the forward run does not
> modify reiser4 nodes by itself.

  Anything I can do for testing? The data I have on this device isn't
  critical so I can test more if needed.

  ~S

>>   ~S
>> 
>> >> 
>> >> ##########################################################
>> >> 
>> >> Repacker: I am alive, pid = 32717
>> >> reiser4[k_reiser4_repac(32717)]: renew_sibling_link
>> >> (fs/reiser4/tree_walk.c:441)[nikita-3532]:
>> >> WARNING: Sibling nodes on the different levels: 1 != 1
>> >> reiser4 repacker: 659 formatted node(s) processed, 170984
>> >> unformatted node(s) processed, ret = -5
>> 
 


