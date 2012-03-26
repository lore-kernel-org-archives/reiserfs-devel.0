From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: Question about the Reiser4 patch for kernel 2.6.38
Date: Tue, 27 Mar 2012 00:14:15 +0200
Message-ID: <4F70EA37.1010805@gmail.com>
References: <CANish_m0MWeeQxywQzeAqCEMSoCbuu7-0ixOLC6Qk0Api+x9=g@mail.gmail.com> <4F6EFC06.9020704@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <4F6EFC06.9020704@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: ReiserFS Development List <reiserfs-devel@vger.kernel.org>

On 03/25/2012 01:05 PM, Edward Shishkin wrote:
> On 03/25/2012 12:10 AM, Sandro Souza wrote:
>> Hello my friends. : D
>>
>
> Hi Sandro,
>
>> Firstly, sorry for my bad English (I'm just a brazilian newbie).
>>
>> Recently, I downloaded the 2.6.38 kernel sources, and I applied the
>> Reiser4 patch for this kernel version (for Ubuntu 11.04 - Natty).
>>
>> But I saw that the file "page_cache.c" has the same change (Riffard's
>> patch) showed in page http://linuxhelp.150m.com/jews/saboteurs.htm


Folks,
A convincing request to the owner of the web page above:
this page insults the experienced developers. Please, remove this!

Thanks!
Edward.


>>
>> This left me worried. :(
>
>
> This looks like very old complaints.
> Reiser4 has been adjusted to some VFS changes, which
> were really needed. It could happen that those changes
> caused some local problems, but all they have been fixed
> long time ago.
>
> I confirm that everything is OK in page_cache.c.
>
> BTW, as far as I remember, all patches of Laurent Riffard
> were extremely useful.
>
> Thanks,
> Edward.
>
>
>>
>> May you (Reiser4 developers) tell me if I can compile and use the
>> kernel this way?
>>
>> May you tell me if that page is showing "unwanted" changes in the
>> Reiser4 source code?
>>
>> Thanks in advance.

