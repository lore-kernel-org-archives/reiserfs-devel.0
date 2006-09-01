From: Hans Reiser <reiser@namesys.com>
Subject: Re: FEATURE Req: integrate badblocks check into fsck.reiser*
Date: Fri, 01 Sep 2006 12:26:45 -0700
Message-ID: <44F88975.5040007@namesys.com>
References: <ed9tqo$2tc$1@sea.gmane.org> <200609012250.44548.vs@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-29780-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <200609012250.44548.vs@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Vladimir V. Saveliev" <vs@namesys.com>
Cc: reiserfs-list@namesys.com, Peter <sw98234@hotmail.com>

Vladimir V. Saveliev wrote:
> Hello
>
> On Friday 01 September 2006 22:23, Peter wrote:
>   
>> Perhaps this has been mentioned before. If so, sorry. IMHO, it would be
>> useful to integrate a call to badblocks in the fsck/mkfs.reiser* programs
>> so that more thorough disk checking can be done at format time. Sort of
>> like the option e2fsck -c. If this is added, the output could be fed
>> immediately to the reiser format program and badblocks spared prior to
>> filesystem use.
>>
>> JM$0.02
>>     
>
> both mkfs.reiserfs and fsck.reiserfs have -B option to accept list of bad 
> blocks. We thought that should be enough.
>
>
>   
I'll take a patch....;-)
