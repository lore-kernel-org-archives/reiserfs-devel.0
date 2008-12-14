From: Ralph Ulrich <eulenreich@gmx.de>
Subject: Re: The...  reiser4 with no ambiguity
Date: Sun, 14 Dec 2008 16:24:27 +0100
Message-ID: <gi38gg$56v$1@ger.gmane.org>
References: <494035ED.4000706@gmx.de> <49404165.6050806@gmail.com> <49405D98.7000402@gmx.de> <4941467B.30308@gmail.com> <49414FC3.1040206@gmx.de> <494157FD.5020708@gmail.com> <ghroan$2e2$1@ger.gmane.org> <49419A90.4020906@gmail.com> <ghu32e$nqp$1@ger.gmane.org> <49440D64.9050900@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7Bit
Return-path: <reiserfs-devel-owner@vger.kernel.org>
Sender: reiserfs-devel-owner@vger.kernel.org
List-ID: <reiserfs-devel.vger.kernel.org>
To: reiserfs-devel@vger.kernel.org

Edward Shishkin Samstag 13 Dezember 2008 20:30:
> I don't know such vfs doctrine. Who is the keeper of this doctrine?
> :-)))
Please, do not be too ironicle here, because I am not an insider and english is not my motherlanguage. I meant there was a discussion that in the linux mainline kernel there should not be a filesystem which has files that can have files. A file as directory was introduced to unifiy namespace by namesys. 

> Subfiles mean one more step in the procedure of name resolution.
> You should return an allocated inode to vfs for every such subfile.
> So subfiles also can not be hidden. There is a temptation to cheat
> vfs, so it will think that it deals with usual files, but such
> cheating doesn't lead to happy end..
> 
> xattrs is ugly, but working solution,
> subfiles are nice, but it doesn't work.. ;)

First of all I have to understand reiser4 with no ambiguity:

Are reiser4 file-plugins _only_ to handle data effective at low-level (like your compression plugin). I know you stress this quiet often in your mails. Or is it just your focussing for now to get reiser4 mainline?

Is it not possible to introduce new extended features in reiser4 and hide these features vfs? 
In reiser4 there is no such possibility to introduce a new kind of file which is hidden from vfs?

Semantics of reiser5 are totally out of scope here, but I thought of them as implementable above/on reiser4 - reiser4 as the technical grounds for reiser5 (as announced by namesys).

Ralph

