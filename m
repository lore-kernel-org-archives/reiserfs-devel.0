From: Ralph <eulenreich@gmx.de>
Subject: Re: The reiser4 programming style is recursive?
Date: Thu, 11 Dec 2008 20:05:34 +0100
Message-ID: <ghroan$2e2$1@ger.gmane.org>
References: <494035ED.4000706@gmx.de> <49404165.6050806@gmail.com> <49405D98.7000402@gmx.de> <4941467B.30308@gmail.com> <49414FC3.1040206@gmx.de> <494157FD.5020708@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org

Edward Shishkin wrote:
>>> To maintain at least one reiser4 subsystem would be real help..
>>> However, it requires a victim in the person of some student(s),
>>> who is ready to kill the best years by sitting in front of monitor
>>> and studying reiser4 sources..
>> Edward, what do you mean "reiser4 subsystem",
> examples of subsystems:
> 
> in kernel:
> . transaction manager;
> . flush manager;
> . tree operations (balancing);
> . unix file plugin;
> 
> in user-space:
> . libaal and reiser4progs

I think the user-space libaal and reiser4progs are no problem, everybody who uses your reiser4 patches runs that....

I had a look at your reiser4 patches, and it is clear to me - as the patches
interfere just a handful of lines with the rest of the linux kernel - there is no reiser4 transaction manager in place with just the patches, right ?

Why not creating an experimental vbox real-reiser4-linux image, which everyone interested can get per torrent at mininova ?

I know transaction capability of reiser4 was announced on namesys.com at that time. And the right balancing code in place would have effects like optimizing access on hard disk, right?

> The best way is to start with writing something useful, say
> xattrs support, or (meta)data checksums support.

I read about the xattr problem, traditional linux xattr is to big to suit in place. This means you have to apply the reiser4-philosophy: A file can
have sub files (is not only a file but also a directory of subfiles). Why not creating a new reiser4 specific file type just for xattr. This filetype will be ignored by vfs-api invoked commands except for xattr specific commands.
Such a filetype would be implemented via a new file plugin, i guess, right ?

Ralph

