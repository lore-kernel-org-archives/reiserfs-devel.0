From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: kernel BUG at fs/reiser4/plugin/item/ctail.c
Date: Wed, 06 Aug 2008 00:31:11 +0400
Message-ID: <4898B88F.3080207@gmail.com>
References: <558.1643-13003-1386678025-1217242012@post.cz> <4897333E.3030600@gmail.com> <a08621850808041457y2f30559ve104c2a86a5f9970@mail.gmail.com> <200808050051.37637.volker.armin.hemmann@tu-clausthal.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <200808050051.37637.volker.armin.hemmann@tu-clausthal.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Volker Armin Hemmann <volker.armin.hemmann@tu-clausthal.de>
Cc: reiserfs-devel@vger.kernel.org

Volker Armin Hemmann wrote:
> On Montag, 4. August 2008, Dushan Tcholich wrote:
>   
>> On Mon, Aug 4, 2008 at 6:50 PM, Edward Shishkin
>>
>> <edward.shishkin@gmail.com> wrote:
>>     
>>> Dushan Tcholich wrote:
>>>       
>>>> On Mon, Aug 4, 2008 at 4:47 PM, Edward Shishkin
>>>>
>>>> <edward.shishkin@gmail.com> wrote:
>>>>         
>>>>> Dushan Tcholich wrote:
>>>>>           
>>>>>> Would it be possible if there would be a new version of fsck.reiser4
>>>>>> to fix those false positives about wrong size when checking
>>>>>> cryptocompress partitions?
>>>>>>             
>>>>> Yes,  per-file warnings about wrong i_bytes should be suppressed.
>>>>> Fsck just should report at the end of work in default mode, that N
>>>>> wrong i_bytes were detected and suggest to fix it with --fix option.
>>>>> Anyone care to try to make a patch?
>>>>>           
>>>> But what happens with systems with ccreg and fsck on boot? They would
>>>> stop and wait for user interaction.
>>>>         
>>> Why?
>>> Do you have any problems with boot?
>>>       
>> I don't have problems.
>> I just thought that checking for these false positives lasted 10
>> minutes on my 6GB / so wouldn't this be a little too long if we don't
>> put some status of some sorts?
>>
>>     
>>>> Or you meant just to print a message about it with recomended solution
>>>> and continue.
>>>>         
>>> Everything should be the same except per-file warnings.
>>>       
>> Maybe a better explanation would be better instead just: "600000 small
>> errors found" :)
>>
>>     
>
>   

There is no big problem here:

Kernel:
-----------
For unix-file plugin:
(1) set i_size and real size which coincide with each other;
(2) don't protect data by checksums (for performance reasons).

For cryptcompress plugin:
(1) set  i_size which usually doesn't coincide with real size;
(2) don' t set real size for performance issues.
(3) set data checksums for every logical cluster;

Fsck:
----------
I. For unix-file plugin:
(1) check if i_size == real size, if no then
     (a) report error and
     (b) handle as corruption

II. For cryptcompress plugin:
(1) check checksums; If wrong, then handle as corruption;
(2) check if i_size == real size, if no, then
     (a) report error;
     (b) set correct real size;

It is clear, that (II.2.a) is not needed. Just because (II.1): checksums is
the best means to detect corruptions.

> that would completly freak out people. How about '60000 false file sizes - 
> this is normal with compression'?
> --
> To unsubscribe from this list: send the line "unsubscribe reiserfs-devel" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
>   

