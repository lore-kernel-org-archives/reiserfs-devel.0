From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: The reiser4 programming style is recursive?
Date: Thu, 11 Dec 2008 21:12:13 +0300
Message-ID: <494157FD.5020708@gmail.com>
References: <494035ED.4000706@gmx.de> <49404165.6050806@gmail.com> <49405D98.7000402@gmx.de> <4941467B.30308@gmail.com> <49414FC3.1040206@gmx.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <49414FC3.1040206@gmx.de>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ralph Ulrich <eulenreich@gmx.de>
Cc: reiserfs-devel@vger.kernel.org

Ralph Ulrich wrote:
> Edward Shishkin wrote:
>   
>>> will get there first!
>>>       
>> And what? I don't see any problems if someone gets it prior
>> to reiser4.
>>
>>     
>>> Edward, we are all waiting, what do you need for help?
>>>       
>> To maintain at least one reiser4 subsystem would be real help..
>> However, it requires a victim in the person of some student(s),
>> who is ready to kill the best years by sitting in front of monitor
>> and studying reiser4 sources..
>>     
>
> Upto recently I had a gentoo linux with your patches running on reiser4
> without problems (but with gentoo.org politics at the moment).
>
> Edward, what do you mean "reiser4 subsystem",
>   
examples of subsystems:

in kernel:
. transaction manager;
. flush manager;
. tree operations (balancing);
. unix file plugin;

in user-space:
. libaal and reiser4progs

> "studying reiser4 sources" - debugging?
>   
Currently there is nothing to debug, at least for beginners.

The best way is to start with writing something useful, say
xattrs support, or (meta)data checksums support.

Edward.
