From: John <geearf@free.fr>
Subject: Re: No space left on rfs4
Date: Tue, 11 Mar 2008 23:19:28 +0100
Message-ID: <108eb7dfa14ebeb20c254a72c4057785@free.fr>
References: <47D6FBFC.4000905@gmail.com>
Reply-To: geearf@free.fr
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <47D6FBFC.4000905@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Edward Shishkin <edward.shishkin@gmail.com>
Cc: reiserfs-devel@vger.kernel.org



On Wed, 12 Mar 2008 00:39:08 +0300, Edward Shishkin <edward.shishkin@gmail.com> wrote:
> Edward Shishkin wrote:
> 
>>On 3/3/08, John <geearf@free.fr> wrote:
>>
>>
>>> On Sun, 02 Mar 2008 13:17:12 +0300, Edward Shishkin
> <edward.shishkin@gmail.com> wrote:
>>> > Hello.
>>> >
>>> > Yeah, indeed, I have reproduced it for reg40 (default plugin):
>>> > tar process is in permanent "+D" state. After reboot all files
>>> > were successfully deleted, although there is some leak of free
>>> > disk space there.
>>> >
>>> > Ok, I'll take a look at this more carefully (I guess -ENOSPC
>>> > error is handled incorrectly somewhere).
>>> >
>>> > If you have a problems with deleting files on reg40 partition,
>>> > then please pack your metadata by
>>> > debugfs.reiser4 -P /dev/xxx | gzip > meta.gz
>>> > and let me download the file meta.gz
>>>
>>>My FS is currently no full and with no bug, so I hope these are the
> metadata you wanted.
>>> If not I'll fill it again and send it to you again
>>>
>>> http://www.megaupload.com/?d=XVITV1CU
>>>
>>>
>>>
>>
>>Eventually I have not downloaded this:
>>It said "No free slots available for your country" ;)
>>
>>Well, don't bother with this for a while:
>>I have caught a mutex leak in cryptcompress plugin,
>>(fixup is attached) this explains undeletable files in ccreg40.
>>
>>I'll try fo fix unix-file plugin a bit later.
>>
>>
>>
> 
> I have found some ancient bugs related to tail conversion.
> In particular, it take place when application writes by chunks
> < 20K in no-space-left-on-device situation (for example, tar,
> which uses 10240 bytes chunks by default).
> The bugs are:
> . leak of per-inode exclusive access;
> . leak of per-inode flag REISER4_PART_IN_CONV
> All of them are responsible for reported deadlocks , and, perhaps
> can lead to data corruptions.
> 
> The fixup is attached.
> 
> There still takes place a silent leak of free disk space, when
> applications runs in no-space-left-on-device situation. This is also
> related only to (default) unix-file plugin with (default) "smart"
> formatting policy. Hope to address it soon..
> 
> Thanks for reports,
> Edward.
> 


Hello Edward,

Would you like me to test something particular now? 
I was waiting for 2.6.25 to compile again but I can do it before if you want.
My configuration changed a little bit, now all my reiser4 partitions are ccreg40, but I can replace swap for a reg40 partition to test it...


Thank you for your help,

John

