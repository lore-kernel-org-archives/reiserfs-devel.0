From: Jeff Mahoney <jeffm@suse.com>
Subject: Re: Getopt improvements
Date: Fri, 28 Feb 2003 10:30:40 -0500
Message-ID: <3E5F80A0.5000707@suse.com>
References: <3E5D26A2.7010804@suse.com> <20030227092551.C28643@namesys.com> <3E5E312C.50406@suse.com> <3E5E730C.7030804@namesys.com> <3E5E84B2.90708@suse.com> <3E5E92BA.4090307@namesys.com> <20030228100147.A878@namesys.com> <3E5F504A.6010902@namesys.com> <20030228154157.A10830@namesys.com> <3E5F5B81.1040602@namesys.com> <20030228161535.C10830@namesys.com> <3E5F6374.9040003@suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-13028-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <3E5F6374.9040003@suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jeff Mahoney <jeffm@suse.com>
Cc: Oleg Drokin <green@namesys.com>, Hans Reiser <reiser@namesys.com>, Reiserfs List <reiserfs-list@namesys.com>

Jeff Mahoney wrote:
> Oleg Drokin wrote:
> 
>> Hello!
>>
>> On Fri, Feb 28, 2003 at 03:52:17PM +0300, Hans Reiser wrote:
>>
>>
>>>>> Incompatible options should fail as they represent error.  Feel 
>>>>> free to argue with that.
>>>>
>>>>
>>>> Hm, I am not going to argue. But we never had this kind of logic.
>>>> Usually the latest-specified option was taking effect.
>>>
>>>
>>> Conflicts in the same command line should fail, latest command line 
>>> should override.  Yes?
>>
>>
>>
>> Ok, I will think on how to implement that.
>>
>> Bye,
>>     Oleg
> 
> 
> No, just the opposite. I'm suggesting that if smalltail and largetail 
> were _not_ mutually exclusive they should be first level options. Since 
> they _are_ mutually exclusive, then they are well suited for a second 
> level option.
> 
>     I think that the appearance of assignment involved in specifying a 
> second level option makes it intuitive to believe that only the most 
> recently used option is the active one.
> 
>     -Jeff
> 

	Sorry guys, that'll teach me to skip breakfast. I accidentally replied 
to Oleg as "Reply", rather than "Reply All", and grabbed the wrong 
message to use for "Reply All" for this list.

	-Jeff


-- 
jeffm@suse.com
jeffm@csh.rit.edu

