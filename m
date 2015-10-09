From: Oleg Drokin <green@linuxhacker.ru>
Subject: Re: [PATCH 3/3] reiser4: in our own sync writes, mark pages dirty before marking them writeback.
Date: Fri, 9 Oct 2015 12:27:22 -0400
Message-ID: <D0AB4773-B98F-4D8B-8070-7FB88D7E1CED@linuxhacker.ru>
References: <1444389417-14929-1-git-send-email-intelfx100@gmail.com> <1444389417-14929-4-git-send-email-intelfx100@gmail.com> <5617C0C1.6060806@gmail.com> <1444398642.6030.3.camel@gmail.com> <5617D55D.2040908@gmail.com> <1444407218.4546.3.camel@gmail.com>
Mime-Version: 1.0 (Apple Message framework v1283)
Content-Transfer-Encoding: 8BIT
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <1444407218.4546.3.camel@gmail.com>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ivan Shapovalov <intelfx100@gmail.com>
Cc: Edward Shishkin <edward.shishkin@gmail.com>, reiserfs-devel@vger.kernel.org


On Oct 9, 2015, at 12:13 PM, Ivan Shapovalov wrote:

> On 2015-10-09 at 16:55 +0200, Edward Shishkin wrote:
> 
>> 
>> On 10/09/2015 03:50 PM, Ivan Shapovalov wrote:
> 
>>> On 2015-10-09 at 15:27 +0200, Edward Shishkin wrote:
> 
>>>> Hi Ivan,
>>>> 
>>>> On 10/09/2015 01:16 PM, Ivan Shapovalov wrote:
> 
>>>>> Ref.: https://www.mail-archive.com/linux-f2fs-devel%40lists.sou
>>>>> rcef
>>>>> orge.net/msg02745.html
>>>> Do you have a stack trace for reiser4?
>>>> How to reproduce it?
>>> I'll rebuild the kernel without the fix and provide you with the
>>> oops'
>>> stacktrace asap.
>>> 
>>> I guess that it's tied to the config. In my case, it is
>>> reproducible on
>>> each boot, just as the DE starts up and something issues the first
>>> fsync().
>> 
>> 
>> Yes, let's try to find the culprit who doesn't set i_wb...
> 
> So, here is the oops:

I suspect this will not help you much.
What you probably need to do is to add an assertion of some sort when the page
is inserted into this list (on which you later do waiting for writeback) and
it's not dirty.
Either that or you might be able to see in the coe right away where such
addition is made without markign the page dirty.


Bye,
    Oleg