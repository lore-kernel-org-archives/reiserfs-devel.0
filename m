From: Hans Reiser <reiser@namesys.com>
Subject: Re: new v3 2.6.4  logging/xattr patches
Date: Fri, 19 Mar 2004 22:03:33 +0300
Message-ID: <405B4405.4010804@namesys.com>
References: <1079679539.11055.101.camel@watt.suse.com>	 <405AA885.3030000@namesys.com> <1079705006.11062.134.camel@watt.suse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-17332-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <1079705006.11062.134.camel@watt.suse.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Chris Mason <mason@suse.com>
Cc: reiserfs-list@namesys.com

Chris Mason wrote:

>On Fri, 2004-03-19 at 03:00, Hans Reiser wrote:
>  
>
>>Chris Mason wrote:
>>
>>    
>>
>>>Hello everyone,
>>>
>>>I've just uploaded all the reiserfs patches from the suse 2.6 kernel to:
>>>
>>>ftp.suse.com/pub/people/mason/patches/data-logging/experimental/2.6.4
>>>
>>>(they should also apply to 2.6.5-rc1 and 2.6.5-rc1-mm2)
>>>
>>>These include:
>>>Latency fixes
>>>Logging performance fixes
>>>data=ordered support
>>>quota support
>>>xattrs and acls from Jeff Mahoney
>>>
>>>and a few random bug fixes.  There's a README file in the directory with
>>>a some more details.
>>>
>>>      
>>>
>>are these ready to go to Andrew or?
>>    
>>
>
>They are ready for Andrew for additional testing, I'd like to submit the
>whole bunch to him actually.  Any objections?
>
>-chris
>
>
>
>
>
>
>  
>
I object to the xattr patch.  Is the write cache related work in this 
anywhere?

-- 
Hans

