From: Edward Shishkin <edward.shishkin@gmail.com>
Subject: Re: The reiser4 programming style is recursive?
Date: Fri, 12 Dec 2008 01:56:16 +0300
Message-ID: <49419A90.4020906@gmail.com>
References: <494035ED.4000706@gmx.de> <49404165.6050806@gmail.com> <49405D98.7000402@gmx.de> <4941467B.30308@gmail.com> <49414FC3.1040206@gmx.de> <494157FD.5020708@gmail.com> <ghroan$2e2$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
In-Reply-To: <ghroan$2e2$1@ger.gmane.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Ralph <eulenreich@gmx.de>
Cc: reiserfs-devel@vger.kernel.org

Ralph wrote:
> Edward Shishkin wrote:
>   
>>>> To maintain at least one reiser4 subsystem would be real help..
>>>> However, it requires a victim in the person of some student(s),
>>>> who is ready to kill the best years by sitting in front of monitor
>>>> and studying reiser4 sources..
>>>>         
>>> Edward, what do you mean "reiser4 subsystem",
>>>       
>> examples of subsystems:
>>
>> in kernel:
>> . transaction manager;
>> . flush manager;
>> . tree operations (balancing);
>> . unix file plugin;
>>
>> in user-space:
>> . libaal and reiser4progs
>>     
>
> I think the user-space libaal and reiser4progs are no problem,

once, you implement xattrs, checksums, etc., it'll become
a problem immediately, as fsck must know about them..

>  everybody who uses your reiser4 patches runs that....
>
> I had a look at your reiser4 patches, and it is clear to me - as the patches
> interfere just a handful of lines with the rest of the linux kernel - there is no reiser4 transaction manager in place with just the patches, right ?
>   

Its code can be found in reiser4/txnmgr.c

> Why not creating an experimental vbox real-reiser4-linux image, which everyone interested can get per torrent at mininova ?
>
> I know transaction capability of reiser4 was announced on namesys.com at that time.

yes

>  And the right balancing code in place would have effects like optimizing access on hard disk, right?
>
>   
 yes

>   
>> The best way is to start with writing something useful, say
>> xattrs support, or (meta)data checksums support.
>>     
>
> I read about the xattr problem, traditional linux xattr is to big to suit in place. This means you have to apply the reiser4-philosophy: A file can
> have sub files (is not only a file but also a directory of subfiles). Why not creating a new reiser4 specific file type just for xattr.

Subfiles are impossible because of a problem on vfs level
related to hardlink functionality. It seems not yet resolved...

>  This filetype will be ignored by vfs-api invoked commands except for xattr specific commands.
> Such a filetype would be implemented via a new file plugin, i guess, right ?
>
>   

You are right about new file plugin for xattrs support:
It is important to not break compatibility.
It should be based on some existing file plugin for
regular files (currently there are 2 ones: unix-file plugin
and cryptcompress plugin).

Edward.
