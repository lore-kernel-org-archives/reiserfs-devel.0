From: Hans Reiser <reiser@namesys.com>
Subject: Re: Basic interface for key management in reiser4 (DRAFT)
Date: Tue, 23 Aug 2005 17:52:50 -0700
Message-ID: <430BC4E2.8080204@namesys.com>
References: <43034EC4.9040906@namesys.com> <43039594.3040300@namesys.com> <4304D492.5010203@namesys.com> <43052842.6050505@namesys.com> <430B4556.6000608@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25632-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <430B4556.6000608@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward@namesys.com>
Cc: Reiserfs developers mail-list <Reiserfs-Dev@namesys.com>, Reiserfs List <reiserfs-list@namesys.com>

Edward Shishkin wrote:

> Hans Reiser wrote:
>
>> Edward Shishkin wrote:
>>
>>  
>>
>>>>
>>>> When you load a key, who can access the file?  Only the person who
>>>> loaded it, yes or?
>>>>
>>>>     
>>>
>>> Currently standard unix permissions work here.
>>>   
>>
>>
>> but the idea is to use keys instead of standard unix permissions....
>>
>> I think you need to store keys in a per process place, and allow
>> specifying whether children of a process inherit the keys somehow.
>>  
>>
>
> Unfortunately the encrypt-on-flush violates all this beauty: the flush,
> which serves all the files, can not look for a key in the process
> keyring (*), therefore besides the process keyrings, reiser4 should
> create and manage its own keyring (accessible to the flush). It means
> additional charges on searching, hashing, updating, etc..
>
> (*) Because:
>    1) the flush does not have needed task_struct;
>    2) the flush can not return an error if someone killed the key in
> the process keyring.
>
> Edward.
>
>
per process is not the same as "in user space and under user control"

Also the key to encrypt a given file with should be specified to the fs
at open() or at  sys_reiser4() time, not at flush time.

Please consider these thoughts, and then revise and resend your opinion
on this.
