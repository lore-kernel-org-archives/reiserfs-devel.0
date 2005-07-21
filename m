From: David Masover <ninja@slaphack.com>
Subject: Re: reiser4progs do not handle the reiser4 format changes
Date: Thu, 21 Jul 2005 12:35:06 -0500
Message-ID: <42DFDCCA.1000002@slaphack.com>
References: <42DE5A5E.9020404@namesys.com> <42DE9DD6.1090104@slaphack.com> <42DEF3C7.3040104@namesys.com> <42DF5511.1060009@namesys.com> <42DF7A7A.9070308@namesys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-list-return-25230-reiserfs=m.gmane.org@namesys.com>
list-help: <mailto:reiserfs-list-help@namesys.com>
list-unsubscribe: <mailto:reiserfs-list-unsubscribe@namesys.com>
list-post: <mailto:reiserfs-list@namesys.com>
Errors-To: flx@namesys.com
In-Reply-To: <42DF7A7A.9070308@namesys.com>
List-Id: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Edward Shishkin <edward@namesys.com>
Cc: Hans Reiser <reiser@namesys.com>, "E.Gryaznova" <grev@namesys.com>, reiserfs-list@namesys.com

Edward Shishkin wrote:
> Hans Reiser wrote:
> 
>> Edward Shishkin wrote:
>>
>>  
>>
>>> David Masover wrote:
>>>
>>>   
>>>
>>>> E.Gryaznova wrote:
>>>>
>>>>     
>>>>
>>>>> Notification:
>>>>>
>>>>> The reiser4 format was changed in reiser4-for-2.6.11-5.patch and new
>>>>> reiser4 kernel code is able to handle the old format.
>>>>>       
>>>>
>>>>
>>>> Good, so I don't have to reformat _immediately_...
>>>>
>>>> But, why isn't it for 2.6.12 yet?  We're already on at least
>>>> 2.6.12.2, last I checked...
>>>>
>>>>     
>>>>
>>>>> The reiser4progs-1.0.4 are not able to handle the format changes.
>>>>> The fix for reiser4progs will be ready next week.
>>>>>       
>>>>
>>>>
>>>> Will there be a conversion tool?
>>>>
>>>>
>>>>     
>>>
>>> No. Reiser4progs just will support a set of new plugins which have
>>> been added to the kernel.
>>> In particular, mkfs.reiser4 should allow user to specify the plugins
>>> like other existing
>>> ones. This will be a way to create cryptcompress files per superblock.
>>> There is another
>>> more flexible way (which is compatible with the previous one) to
>>> create it per file/directory,
>>> but it uses deprecated metas interface..
>>> Note: since cryptcompress plugin is unstable, the new options are
>>> supposed to be undocumented.
>>>
>>> Thanks,
>>> Edward.
>>>
>>>
>>>
>>>   
>>
>> So why does this create a format change that breaks things?  I cannot
>> see why it should do so, please explain.
>>  
>>
> 
> I have lost a track who first called upgrading plugin_set by the terrible
> words "disk format change". Plugin set is not a disk format, it is supposed
> to be upgraded..

Ok, please explain what this actually means for users.

How will an FS made by the current reiser4progs be different than that 
made by the new (patched) ones that will be coming out?  Is the new way 
better?  If so, how can one take an existing FS and convert/update/tweak 
it to the new way?



-- 
No virus found in this outgoing message.
Checked by AVG Anti-Virus.
Version: 7.0.323 / Virus Database: 267.9.2/55 - Release Date: 7/21/2005

