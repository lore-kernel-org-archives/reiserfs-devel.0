From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: The reiser4 programming style is recursive?
Date: Thu, 11 Dec 2008 19:57:31 +0300
Message-ID: <4941467B.30308@gmail.com>
References: <494035ED.4000706@gmx.de> <49404165.6050806@gmail.com> <49405D98.7000402@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <49405D98.7000402@gmx.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ralph Ulrich <eulenreich@gmx.de>
Cc: reiserfs-devel@vger.kernel.org

Ralph Ulrich wrote:
> Edward Shishkin schrieb:
>   
>> AFAIK they were unhappy with assertions and "coding nits"  like
>> if (foo) {         bar(); }
>>     
> ....
>   
>> Eventually akpm said that assertions are okay and guys send
>> cleanup patches against other issues once in a while.
>>     
>
> And what are Your plans to get reiser4 in the kernel now!
>   

I wouldn't force the events:
there is no hurry, business plans, timelines, etc..

> As of now it seems that brtfs,
> which has nearly the same "hardware" logic as reiser4
> but lacks the whole ground breaking philosophy,
> will get there first!
>   

And what? I don't see any problems if someone gets it prior
to reiser4.

> Edward, we are all waiting, what do you need for help?
>   

To maintain at least one reiser4 subsystem would be real help..
However, it requires a victim in the person of some student(s),
who is ready to kill the best years by sitting in front of monitor
and studying reiser4 sources..
Do you know such ones? ;)

Edward.
